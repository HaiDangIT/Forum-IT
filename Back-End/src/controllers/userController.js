// const prisma = require("../config/prismaClient");
// const bcrypt = require("bcryptjs");
// const jwt = require("jsonwebtoken");
// const JWT_SECRET = process.env.JWT_SECRET;

const userService = require("../services/userService");

class UserController {
  async register(req, res) {
    try {
      const user = await userService.registerUser(req.body);
      res.status(201).json({
        message: user.message,
      });
    } catch (err) {
      res.status(400).json({ err: err.message });
    }
  }

  async login(req, res) {
    try {
      const result = await userService.loginUser(req.body);
      res.status(200).json({
        // message: result.message,
        // user: result.user,
        message: "✅ Đăng nhập thành công",
        // token: result.token,
      });
    } catch (err) {
      res.status(400).json({ error: err.message });
    }
  }

  async getUserById(req, res) {
    const userId = req.params.id;
    try {
      const user = await userService.getUserById(userId);
      res.status(200).json({
        message: "✅ Lấy thông tin người dùng thành công",
        data: user,
      });
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }

  async getAllUsers(req, res) {
    try {
      const users = await userService.getAllUsers();
      res.status(200).json({
        message: "✅ Lấy danh sách người dùng thành công",
        data: users,
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

module.exports = new UserController();
