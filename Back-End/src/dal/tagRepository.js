const prisma = require("../config/primaClient");

class TagRepository {
  constructor() {
    this.prisma = prisma;
  }

  // Lấy tag theo id
  async getTagById(id) {
    try {
      return await this.prisma.tag.findUnique({
        where: { id_tag: parseInt(id) },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không tìm thấy thẻ");
    }
  }

  // Lấy tag theo tên
  async getTagByName(name) {
    try {
      return await this.prisma.tag.findUnique({
        where: { name: name },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy tag theo tên");
    }
  }

  // Lấy tất cả tag
  async getAllTags() {
    try {
      return await this.prisma.tag.findMany();
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy danh sách tag");
    }
  }

  // Tạo tag
  async createTag(tagData) {
    try {
      return await this.prisma.tag.createTag({
        data: {
          name: tagData.name,
          description: tagData.description || null,
          create_at: new Date(),
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể tạo thẻ mới");
    }
  }

  // Cập nhật tag
  async updateTag(tagData) {
    try {
      return await this.prisma.tag.update({
        where: { id_tag: parseInt(tagData.id_tag) },
        data: {
          name: tagData.name,
          description: tagData.description || null,
          create_at: new Date(),
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể cập nhật thẻ");
    }
  }

  // Xóa vĩnh viễn tag
  async deletetag(tagId) {
    try {
      return await this.prisma.tag.delete({
        where: { id_tag: parseInt(tagId) },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể xóa thẻ");
    }
  }
}

module.exports = new TagRepository();
