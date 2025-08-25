const prisma = require("../config/primaClient");

class UserRepository {
  constructor() {
    this.prisma = prisma;
  }

  async getUserbyId(id) {
    try {
      return await this.prisma.user.findUnique({
        where: { id: parseInt(id) },
      });
    } catch (err) {
      throw err;
      //   throw new Error("Không tìm thấy người dùng");
    }
  }

  async getUserByEmail(email) {
    try {
      return await this.prisma.user.findUnique({
        where: { email: email },
      });
    } catch (err) {
      throw err;
      //   throw new Error("Không tìm thấy người dùng với email này");
    }
  }

  async getUserByName(username) {
    try {
      return await this.prisma.user.findFirst({
        where: { username: username },
      });
    } catch (err) {
      throw err;
      //   throw new Error("Không tìm thấy người dùng với tên này");
    }
  }

  async getAllUsers() {
    try {
      return await this.prisma.user.findMany();
    } catch (err) {
      throw err;
      //   throw new Error("Không thể lấy danh sách người dùng");
    }
  }

  async getUserByIdWithRoles(id) {
    try {
      const roles = await this.prisma.userRole.findMany({
        where: { userId: parseInt(id) },
        include: { role: true },
      });
      return roles.map((r) => r.role.name);
    } catch (err) {
      throw err;
      //   throw new Error("Không tìm thấy role của người dùng với ID này");
    }
  }

  async createUser(userData) {
    try {
      return await this.prisma.user.create({
        data: {
          username: userData.username,
          password: userData.password,
          email: userData.email,
          firstName: userData.firstName,
          lastName: userData.lastName,
          gender: userData.gender || null,
          avatar: userData.avatar || null,
          dateOfBirth: userData.dateOfBirth || null,
        },
      });
    } catch (err) {
      throw err;
      //   throw new Error("Không thể tạo người dùng mới");
    }
  }

  async updateUser(userData) {
    try {
      return await this.prisma.user.update({
        where: { id: parseInt(userData.id) },
        data: {
          username: userData.username,
          password: userData.password,
          email: userData.email,
          firstName: userData.firstName,
          lastName: userData.lastName,
          gender: userData.gender || null,
          avatar: userData.avatar || null,
          dateOfBirth: userData.dateOfBirth || null,
        },
      });
    } catch (err) {
      throw err;
      //   throw new Error("Không thể cập nhật người dùng");
    }
  }

  async deleteUser(userId) {
    try {
      return await this.prisma.user.delete({
        where: { id: parseInt(userId) },
      });
    } catch (err) {
      throw err;
      // throw new Error("Không thể xóa người dùng");
    }
  }
}

module.exports = new UserRepository();
