import jwt, { SignOptions, VerifyOptions, JwtPayload } from 'jsonwebtoken';

const JWT_SECRET = process.env.JWT_SECRET || 'your-default-secret';


export function generateToken(payload: object, options?: SignOptions): string {
    return jwt.sign(payload, JWT_SECRET, {
        expiresIn: '7d',
        ...options,
    });
}


export function verifyToken(token: string, options?: VerifyOptions): JwtPayload | string {
    return jwt.verify(token, JWT_SECRET, options);
}


export function decodeToken(token: string): null | { [key: string]: any } {
    return jwt.decode(token) as { [key: string]: any } | null;
}

export function generateRefreshToken(payload: object, options?: SignOptions): string {
    return jwt.sign(payload, JWT_SECRET, {
        expiresIn: '30d', 
        ...options,
    });
}