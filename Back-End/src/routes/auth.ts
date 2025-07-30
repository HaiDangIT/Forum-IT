import express from 'express';
import * as authController from '../controllers/authController';
import { authenticateJWT } from '../middlewares/auth';
import { validateRegister, validateLogin } from '../middlewares/validation';

const router = express.Router();

// Register a new account
router.post('/register', validateRegister, authController.register);

// Login
router.post('/login', validateLogin, authController.login);

// Logout (optional)
router.post('/logout', authenticateJWT, authController.logout);

// Refresh token (optional, implement in controller if needed)
router.post('/refresh', authenticateJWT, authController.refreshToken);

export default router;