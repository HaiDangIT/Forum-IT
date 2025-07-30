import prisma from '../utils/prismaClient';
import { hashPassword, verifyPassword as checkPassword } from '../utils/passwordUtils';
import { generateToken, generateRefreshToken } from '../utils/jwt';

interface UserPayload {
  username: string;
  email: string;
  password: string;
}

export async function createUser({ username, email, password }: UserPayload) {
  const hashedPassword = await hashPassword(password);
  return prisma.user.create({
    data: {
      username,
      email,
      password: hashedPassword,
    },
  });
}

export async function validateLogin(email: string, password: string) {
  const user = await prisma.user.findUnique({ where: { email } });
  if (!user) return null;
  const isValid = await checkPassword(password, user.password);
  return isValid ? user : null;
  
}

export function generateTokens(user: { id: number; username: string }) {
  const accessToken = generateToken({ userId: user.id, username: user.username });
  const refreshToken = generateRefreshToken({ userId: user.id });
  return { accessToken, refreshToken };
}

export async function verifyPassword(password: string, hashed: string) {
  return checkPassword(password, hashed);
}

export async function updateLastLogin(userId: number) {
    return prisma.user.update({
        where: { id: userId },
        data: { lastLoginAt: new Date() }
    });
}