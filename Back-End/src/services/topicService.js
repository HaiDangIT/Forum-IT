const topicRepository = require("../dal/topicRespository");

class TopicService {
  constructor() {
    this.topicRepo = topicRepository;
  }

  async getTopicById(id) {
    const topic = await this.topicRepo.getTopicById(id);
    if (!topic) {
      throw new Error("Không tìm thấy chủ đề với ID này");
    }
    return topic;
  }

  async getAllTopics() {
    const topics = await this.topicRepo.getAllTopics();
    if (!topics || topics.length === 0) {
      throw new Error("Không thể lấy danh sách chủ đề");
    }
    return {
      topic: topics.map((topic) => ({
        name: topic.name,
        description: topic.description,
      })),
    };
  }

  async getTopicByName(topicName) {
    const topic = await this.topicRepo.getTopicByName(topicName);
    if (!topic) {
      throw new Error("Không tìm thấy chủ đề với tên này");
    }
    return topic;
  }

  async createTopic(topicData) {
    const existingTopic = await this.topicRepo.getTopicByName(topicData.name);
    if (existingTopic) {
      throw new Error("Chủ đề này đã tồn tại");
    }
    const newTopic = await this.topicRepo.createTopic(topicData);
    return {
      message: "✅ Tạo chủ đề thành công",
      topic: newTopic,
    };
  }

  async updateTopic(id, topicData) {
    const topic = await this.topicRepo.getTopicById(id);
    if (!topic) {
      throw new Error("Không tìm thấy chủ đề để cập nhật");
    }
    const updatedTopic = await this.topicRepo.updateTopic({ id, ...topicData });
    return {
      message: "✅ Cập nhật chủ đề thành công",
      topic: updatedTopic,
    };
  }

  async deleteTopic(id) {
    const topic = await this.topicRepo.getTopicById(id);
    if (!topic) {
      throw new Error("Không tìm thấy chủ đề để xóa");
    }
    await this.topicRepo.deleteTopic(id);
    return {
      message: "✅ Xóa chủ đề thành công",
    };
  }
}

module.exports = new TopicService();
