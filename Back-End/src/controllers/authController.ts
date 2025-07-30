import { generateToken, verifyToken } from "../utils/jwt";
import prisma from "../utils/prismaClient";
import { hashPassword, verifyPassword } from "../utils/passwordUtils";
import { JwtPayload } from "jsonwebtoken";
import { updateLastLogin } from '../services/authService';

import { Request, Response } from 'express';

// Register a new user
export const register = async (req: Request, res: Response) => {
    const { username, email, password } = req.body;
    // Validate user input
    if (!username || !email || !password) {
        return res.status(400).json({ message: "All fields are required" });
    }
    try {
        // Check if user already exists
        const existingUser = await prisma.user.findUnique({
            where: { email },
        });
        if (existingUser) {
            return res.status(409).json({ message: "User already exists" });
        }

        // Hash password
        const hashedPassword = await hashPassword(password);

        // Create new user
        const newUser = await prisma.user.create({
            data: {
                username,
                email,
                password: hashedPassword,
            },
        });

        // Generate JWT token
        const token = generateToken({ userId: newUser.id, username: newUser.username });

        return res.status(201).json({ token, user: { id: newUser.id, username: newUser.username, email: newUser.email } });
    } catch (error) {
        console.error("Error registering user:", error);
        return res.status(500).json({ message: "Internal server error" });
    }
};

// Login user (Should update some attributes like gender, dateOfBirth, etc)
export const login = async (req: Request, res: Response) => {
    const { email, password } = req.body;
    // Basic input validation (should be improved with middleware for production)
    if (!email || !password) {
        return res.status(400).json({ message: "Email and password are required." });
    }
    try {
        const user = await prisma.user.findUnique({ where: { email } });
        if (!user) {
            return res.status(400).json({ message: 'Invalid email or password.' });
        }
        const isMatch = await verifyPassword(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: 'Invalid email or password.' });
        }
        await updateLastLogin(user.id);
        const token = generateToken({ userId: user.id, username: user.username });
        res.json({ token, user: { id: user.id, username: user.username, email: user.email } });
    } catch (error) {
        console.error("Error logging in user:", error);
        res.status(500).json({ message: 'Internal server error.' });
    }
};

// Logout function
export const logout = (req: Request, res: Response) => {
    res.status(200).json({ message: 'Logged out successfully.' });
};

// Refresh token function
export const refreshToken = async (req: Request, res: Response) => {
    const { refreshToken } = req.body;
    if (!refreshToken) {
        return res.status(400).json({ message: "Vui lòng cung cấp refresh token." });
    }
    try {
        // Verify refresh token
        const payload = verifyToken(refreshToken) as string | JwtPayload;
        // Check if payload is an object and has userId
        if (!payload || typeof payload === "string" || !("userId" in payload)) {
            return res.status(401).json({ message: "Refresh token không hợp lệ hoặc đã hết hạn." });
        }
        // Optionally: check if user still exists and is active
        const user = await prisma.user.findUnique({ where: { id: (payload as JwtPayload).userId } });
        if (!user) {
            return res.status(404).json({ message: "Người dùng không tồn tại." });
        }
        // Generate new access token
        const newAccessToken = generateToken({ userId: user.id, username: user.username });
        return res.json({ accessToken: newAccessToken });
    } catch (error) {
        console.error("Lỗi làm mới token:", error);
        return res.status(500).json({ message: "Lỗi hệ thống, vui lòng thử lại sau." });
    }
};