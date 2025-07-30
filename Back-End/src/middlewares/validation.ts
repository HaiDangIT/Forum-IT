import { Request, Response, NextFunction } from 'express';

// Validate registration input
export function validateRegister(req: Request, res: Response, next: NextFunction) {
    const { username, email, password } = req.body;
    if (!username || !email || !password) {
        return res.status(400).json({ message: "Vui lòng nhập đầy đủ tên, email và mật khẩu." });
    }
    next();
}

// Validate login input
export function validateLogin(req: Request, res: Response, next: NextFunction) {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(400).json({ message: "Vui lòng nhập email và mật khẩu." });
    }
    next();
}