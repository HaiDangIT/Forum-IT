const prisma = require("../config/primaClient");

// Repository quản lý thao tác với bảng Comment
class CommentRespository {
  constructor() {
    this.prisma = prisma;
  }

  // Lấy tất cả bình luận
  async getAllComment() {
    try {
      return await this.prisma.comment.findMany();
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không có bình luận nào hiện có");
    }
  }

  // Lấy bình luận theo postId, chỉ lấy bình luận chưa bị xóa mềm
  async getCommentByPost(postId) {
    try {
      return await this.prisma.comment.findMany({
        where: { postId: parseInt(postId), isDeleted: false },
        select: {
          content: true,
          createdAt: true,
          userId: true,
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Bài post này hiện chưa có bình luận nào!!!");
    }
  }

  // Tạo bình luận mới
  async createComment(commentData) {
    try {
      return await this.prisma.comment.create({
        data: {
          content: commentData.content,
          userId: commentData.userId,
          postId: commentData.postId,
          parentCommentId: commentData.parentCommentId ?? null,
          createdAt: new Date(),
          isDeleted: false, // Bình luận mặc định chưa bị xóa mềm
          status: commentData.status ?? "ACTIVE", // Bình luận mặc định đang hoạt động
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể tạo bài viết mới");
    }
  }

  // Cập nhật bình luận (chỉ cập nhật các trường truyền vào)
  async updateComment(commentData) {
    try {
      return await this.prisma.comment.update({
        where: { id: parseInt(commentData.id) },
        data: {
          content: commentData.content,
          userId: commentData.userId,
          postId: commentData.postId,
          parentCommentId: commentData.parentCommentId ?? null,
          updatedAt: new Date(),
          isDeleted: false, // Đặt lại trạng thái chưa bị xóa mềm (có thể cân nhắc bỏ nếu không cần)
          status: "ACTIVE", // Đặt lại trạng thái hoạt động (có thể cân nhắc bỏ nếu không cần)
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể cập nhật bài post");
    }
  }

  // Xóa cứng bình luận khỏi database
  async deleteComment(commentId) {
    try {
      return await this.prisma.comment.delete({
        where: { id: parseInt(commentId) },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể xóa bình luận này");
    }
  }

  // Xóa mềm bình luận (đánh dấu isDeleted = true)
  async softDeleteComment(commentId) {
    try {
      return await this.prisma.comment.update({
        where: { id: parseInt(commentId) },
        data: { isDeleted: true, status: "HIDDEN", updatedAt: new Date() },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể tạm xóa bình luận này");
    }
  }

  // Khôi phục bình luận đã xóa mềm
  async restoreComment(commentId) {
    try {
      return await this.prisma.comment.update({
        where: { id: parseInt(commentId) },
        data: { isDeleted: false, status: "ACTIVE", updatedAt: new Date() },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể khôi phục bình luận đã xóa");
    }
  }

  // Ẩn bình luận (đổi status thành HIDDEN)
  async hideComment(commentId) {
    try {
      return await this.prisma.comment.update({
        where: { id: parseInt(commentId) },
        data: { status: "HIDDEN", updatedAt: new Date() },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể ẩn bình luận này");
    }
  }

  // Lấy replies của một bình luận
  async getReplies(parentCommentId) {
    return await this.prisma.comment.findMany({
      where: { parentCommentId: parseInt(parentCommentId), isDeleted: false },
    });
  }
}

module.exports = new CommentRespository();
