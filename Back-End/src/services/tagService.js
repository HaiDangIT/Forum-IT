const { tag, message } = require("../config/primaClient");
const tagRepository = require("../dal/tagRespository");

class TagService {
  constructor() {
    this.tagRepo = tagRepository;
  }

  async getTagById(id) {
    const tag = await this.tagRepo.getTagById(id);
    if (!tag) {
      throw new Error("Không thể tìm thấy tag này");
    }
    return tag;
  }

  async getTagByName(tagname) {
    const tag = await this.tagRepo.getTagByName(tagname);
    if (!tag) {
      throw new Error("Không thể tìm thấy tên của tag này");
    }
    return tag;
  }

  async groupTagsByFirstLetter() {
    const tags = await this.tagRepo.getAllTags();
    return tags.reduce((acc, tag) => {
      const firstChar = tag.name[0].toUpperCase();
      if (!acc[firstChar]) acc[firstChar] = [];
      acc[firstChar].push(tag);
      return acc;
    }, {});
  }

  async getAllTags() {
    const tags = await this.tagRepo.getAllTags();
    if (!tags || tags.length === 0) {
      throw new Error("Không thể lấy danh sách tag");
    }
    const filteredTags = tags
      .filter((tag) => !tag.isHidden && !tag.isDeleted && tag.name.length > 1)
      .sort((a, b) => a.name.localeCompare(b.name, "vi"));

    return {
      tag: filteredTags.map((tag) => ({
        name: tag.name,
        description: tag.description,
      })),
    };
  }

  async createTag(tagData) {
    const existingTag = await this.tagRepo.getTagByName(tagData.name);
    if (existingTag) {
      throw new Error("Tag này đã được tạo");
    }
    const newTag = await this.tagRepo.createTag(tagData);
    return {
      message: "✅ Đăng ký thành công",
      tag: newTag,
    };
  }

  async updateTag(id, tagData) {
    const tag = await this.tagRepo.getTagById(id);
    if (!tag) {
      throw new Error("Không tìm thấy tag để cập nhật");
    }
    const updatedTag = await this.tagRepo.updateTag(id, tagData);
    return {
      message: "✅ Cập nhật thành công",
      tag: updatedTag,
    };
  }

  async deleteTag(id) {
    const tag = await this.tagRepo.getTagById(id);
    if (!tag) {
      throw new Error("Không tìm thấy tag để xóa");
    }
    await this.tagRepo.deleteTag(id);
    return {
      message: "✅ Xóa tag thành công",
    };
  }
}

module.exports = new TagService();
