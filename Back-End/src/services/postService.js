const postRepository = require("../dal/postRespository");

class PostService {
  constructor() {
    this.postRepo = postRepository;
  }

  async getPostById(id) {
    const post = await this.postRepo.getPostById(id);
    if (!post) {
      throw new Error("Không tìm thấy bài viết với ID này");
    }
    return post;
  }

  async getAllPosts() {
    const posts = await this.postRepo.getAllPosts();
    if (!posts || posts.length === 0) {
      throw new Error("Không thể lấy danh sách bài viết");
    }
    return {
      post: posts.map((post) => ({
        title: posts.title,
        content: posts.content,
        originalAuthor: posts.originalAuthor,
        originalPublishedDate: posts.originalPublishedDate,
      })),
    };
  }

  async createPost(postData) {
    // Có thể kiểm tra trùng tiêu đề hoặc validate dữ liệu ở đây nếu muốn
    const newPost = await this.postRepo.createPost(postData);
    return {
      message: "✅ Tạo bài viết thành công",
      post: newPost,
    };
  }

  async updatePost(postData) {
    const post = await this.postRepo.getPostById(postData.id);
    if (!post) {
      throw new Error("Không tìm thấy bài viết để cập nhật");
    }
    const updatedPost = await this.postRepo.updatePost(postData);
    return {
      message: "✅ Cập nhật bài viết thành công",
      post: updatedPost,
    };
  }

  async deletePost(id) {
    const post = await this.postRepo.getPostById(id);
    if (!post) {
      throw new Error("Không tìm thấy bài viết để xóa");
    }
    await this.postRepo.deletePost(id);
    return {
      message: "✅ Xóa bài viết thành công",
    };
  }
}

module.exports = new PostService();
