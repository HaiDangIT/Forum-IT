const express = require("express");
const router = express.Router();
const UserController = require("../controllers/userController");
const validataRegister = require("../middleware/validateRegister");
const validateLogin = require("../middleware/validateLogin");

router.post("/register", validataRegister, UserController.register);
router.post("/login", validateLogin, UserController.login);
router.get("/:id", UserController.getUserById);
router.get("/", UserController.getAllUsers);

module.exports = router;
