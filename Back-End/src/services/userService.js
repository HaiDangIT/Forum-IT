const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const JWT_SECRET = process.env.JWT_SECRET;

const userRepository = require("../dal/userRespository");

class UserService {
  constructor() {
    this.userRepo = userRepository;
  }

  async getUserById(id) {
    const user = await this.userRepo.getUserbyId(id);
    if (!user) {
      throw new Error("Không tìm thấy người dùng");
    }
    return user;
  }

  async getUserByEmail(email) {
    const user = await this.userRepo.getUserByEmail(email);
    if (!user) {
      throw new Error("Không tìm thấy người dùng với email này");
    }
    return user;
  }

  async getUserByName(username) {
    const user = await this.userRepo.getUserByName(username);
    if (!user) {
      throw new Error("Không tìm thấy người dùng với tên này");
    }
    return user;
  }

  async getAllUsers() {
    const users = await this.userRepo.getAllUsers();
    if (!users || users.length === 0) {
      throw new Error("Không thể lấy danh sách người dùng");
    }
    return {
      user: users.map((user) => ({
        id: user.id,
        email: user.email,
        username: user.username,
        firstName: user.firstName,
        lastName: user.lastName,
        password: user.password,
      })),
    };
  }

  async registerUser(userData) {
    const existingUsername = await this.userRepo.getUserByName(
      userData.username
    );
    const existingUser = await this.userRepo.getUserByEmail(userData.email);
    if (existingUser) {
      throw new Error("Email đã được sử dụng");
    }
    if (existingUsername) {
      throw new Error("Tên người dùng đã tồn tại");
    }

    const hashedPassword = await bcrypt.hash(userData.password, 10);

    userData.password = hashedPassword;
    const newUser = await this.userRepo.createUser(userData);
    return {
      message: "✅ Đăng ký thành công",
      user: newUser,
    };
  }

  async loginUser(userData) {
    const user = await this.userRepo.getUserByEmail(userData.email);
    if (!user) {
      console.error("Lỗi: Tài khoản không tồn tại");
      throw new Error("Tài khoản không tồn tại");
    }
    const isMatch = await bcrypt.compare(userData.password, user.password);
    if (!isMatch) {
      throw new Error("Mật khẩu không đúng");
    }
    // const roles = await this.userRepo.getUserByIdWithRoles(user.id);
    // if (!roles || roles.length === 0) {
    //   throw new Error("Không tìm thấy quyền của người dùng");
    // }
    const userWithRoles = {
      ...user,
      // role: roles, Giả sử roles là một thuộc tính của user
    };

    const token = jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, {
      expiresIn: "1h",
    });

    // const token = jwt.sign(
    //   { id: user.id, email: user.email, roles: roles },
    //   JWT_SECRET,
    //   { expiresIn: "1h" }
    // );

    return {
      message: "✅ Đăng ký thành công",
      token,
      user: userWithRoles,
    };
  }

  async updateUser(userData) {
    if (!userData.id || isNaN(userData.id)) {
      throw new Error("ID không hợp lệ");
    }
    const existingUser = await this.userRepo.getUserbyId(userData.id);
    if (!existingUser) {
      throw new Error("Không tìm thấy người dùng để cập nhật");
    }
    const existingUsername = await this.userRepo.getUserByName(
      userData.username
    );
    if (existingUsername && existingUsername.id !== userData.id) {
      throw new Error("Tên người dùng đã tồn tại");
    }
    return await this.userRepo.updateUser(userData);
  }

  async deleteUser(id) {
    if (!id || isNaN(id)) {
      throw new Error("ID không hợp lệ");
    }
    const existingUser = await this.userRepo.getUserbyId(id);
    if (!existingUser) {
      throw new Error("Không tìm thấy người dùng để xóa");
    }
    return await this.userRepo.deleteUser(id);
  }
}

module.exports = new UserService();
