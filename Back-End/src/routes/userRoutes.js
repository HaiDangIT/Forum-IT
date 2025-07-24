const express = require('express');
const router = express.Router();
const userController = require('../controller/userController');
const authMiddleware = require('../middlewares/authMiddleware');

// Register route
router.post('/register', userController.register);
// Login route
router.post('/login', userController.login);

// Get profile route
router.get('/profile', authMiddleware, userController.getProfile);

// Update profile route
router.put('/profile', authMiddleware, userController.updateProfile);

// Change password route
router.put('/change-password', authMiddleware, userController.changePassword);

// Get user by id
router.get('/:id', userController.getUserById);

module.exports = router;