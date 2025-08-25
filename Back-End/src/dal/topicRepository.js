const prisma = require("../config/primaClient");

class TopicRepository {
  constructor() {
    this.prisma = prisma;
  }

  async getTopicById(id) {
    try {
      return await this.prisma.topic.findUnique({
        where: { id_topic: parseInt(id) },
      });
    } catch (err) {
      throw new Error("Không tìm thấy chủ đề với ID này");
    }
  }

  async getAllTopics() {
    try {
      return await this.prisma.topic.findMany();
    } catch (err) {
      throw new Error("Không thể lấy danh sách chủ đề");
    }
  }

  async getTopicByName(topicName) {
    try {
      return await this.prisma.topic.findFirst({
        where: { name: topicName },
      });
    } catch (err) {
      throw new Error("Không thể lấy topic theo tên này");
    }
  }

  async createTopic(topicData) {
    try {
      return await this.prisma.topic.create({
        data: {
          name: topicData.name,
          description: topicData.description,
          create_at: new Date(),
        },
      });
    } catch (err) {
      throw new Error("Không thể tạo topic");
    }
  }

  async updateTopic(topicData) {
    try {
      return await this.prisma.topic.update({
        where: { id_topic: parseInt(topicData.id) },
        data: {
          name: topicData.name,
          description: topicData.description,
          create_at: new Date(),
        },
      });
    } catch (err) {
      throw new Error("Không thể cập nhật topic này");
    }
  }

  async deleteTopic(topicId) {
    try {
      return await this.prisma.topic.delete({
        where: { id_topic: parseInt(topicId) },
      });
    } catch (err) {
      throw new Error("Không thể xóa topic này");
    }
  }
}

module.exports = new TopicRepository();
