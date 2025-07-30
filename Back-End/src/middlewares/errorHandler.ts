import { Request, Response, NextFunction } from 'express';

export function errorHandler(
    err: any,
    req: Request,
    res: Response,
    next: NextFunction
) {
    // Default error status and message
    const statusCode = err.statusCode || 500;
    const message =
        err.message ||
        'Đã xảy ra lỗi trong quá trình xử lý yêu cầu. Vui lòng thử lại sau.';

    // Log error details for debugging (avoid logging sensitive info)
    console.error(`[Error] ${req.method} ${req.url}:`, err);

    res.status(statusCode).json({
        success: false,
        error: {
            message,
            // Optionally include error code or details in development
            ...(process.env.NODE_ENV === 'development' && { details: err }),
        },
    });
}