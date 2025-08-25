const prisma = require("../config/primaClient");

class ReactionRespository {
  constructor() {
    this.prisma = prisma;
  }

  async getAllReaction() {
    try {
      return await this.prisma.reaction.findMany();
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không có biểu cảm nào hiện tại");
    }
  }
}

module.exports = new ReactionRespository();
