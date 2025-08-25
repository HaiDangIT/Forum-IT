const { data } = require("react-router-dom");
const { flat } = require("../../prisma/roleconfig");
const prisma = require("../config/primaClient");

// Repository quản lý thao tác với bảng Post
class PostRepository {
  constructor() {
    this.prisma = prisma;
  }

  // Lấy bài viết theo id (Khong can)
  async getPostById(id) {
    try {
      return await this.prisma.post.findUnique({
        where: { id: parseInt(id) },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy id của bài viết này");
    }
  }

  // Lấy tất cả bài viết
  async getAllPosts(skip = 0, take = 10) {
    try {
      return await this.prisma.post.findMany({
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy danh sách post");
    }
  }

  // Tạo bài viết mới
  async createPost(postData) {
    try {
      return await this.prisma.post.create({
        data: {
          title: postData.title,
          content: postData.content,
          postType: postData.postType,
          sourceUrl: postData.sourceUrl ?? null,
          originalAuthor: postData.originalAuthor ?? null,
          originalPublishedDate: postData.originalPublishedDate ?? null,
          status: postData.status ?? "ACTIVE",
          viewCount: postData.viewCount ?? 0,
          moderatedById: postData.moderatedById ?? null,
          moderatedAt: postData.moderatedAt ?? null,
          wordCount: postData.wordCount ?? null,
          isDeleted: false,
          deletedAt: null,
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể tạo bài post");
    }
  }

  // Cập nhật bài viết
  async updatePost(postData) {
    try {
      return await this.prisma.post.update({
        where: { id: parseInt(postData.id) },
        data: {
          title: postData.title,
          content: postData.content,
          postType: postData.postType,
          sourceUrl: postData.sourceUrl ?? null,
          updatedAt: new Date(),
          originalAuthor: postData.originalAuthor ?? null,
          originalPublishedDate: postData.originalPublishedDate ?? null,
          status: postData.status,
          viewCount: postData.viewCount,
          moderatedById: postData.moderatedById ?? null,
          moderatedAt: postData.moderatedAt ?? null,
          wordCount: postData.wordCount ?? null,
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể cập nhật post này");
    }
  }

  // Xóa cứng bài viết khỏi database
  async deletePost(postId) {
    try {
      return await this.prisma.post.delete({
        where: { id: parseInt(postId) },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể xóa post này");
    }
  }

  // Xóa mềm bài viết (đánh dấu isDeleted = true)
  async softDeletePost(postId) {
    try {
      return await this.prisma.post.update({
        where: { id: parseInt(postId) },
        data: {
          isDeleted: true,
          status: "HIDDEN",
          deletedAt: new Date(),
          updatedAt: new Date(),
        },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể xóa mềm bài viết này");
    }
  }

  // Ẩn bài viết (đổi status thành HIDDEN)
  async hidePost(postId) {
    try {
      return await this.prisma.post.update({
        where: { id: parseInt(postId) },
        data: { status: "HIDDEN", updatedAt: new Date() },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể ẩn bài viết này");
    }
  }

  // Khôi phục xóa mềm bai viết
  async restorePost(postId) {
    try {
      return await this.prisma.post.update({
        where: { id: parseInt(postId) },
        data: { isDeleted: false, status: "ACTIVE", updatedAt: new Date() },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể khôi phục bài viết");
    }
  }

  // Lấy bài viết theo userId
  async getPostsByUser(userId, skip = 0, take = 10) {
    try {
      return await this.prisma.post.findMany({
        where: { userId: parseInt(userId), isDeleted: false },
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy bài viết theo user");
    }
  }

  // Lấy bài viết theo trạng thái "ACTIVE"
  async getPostsByStatus(status, skip = 0, take = 10) {
    try {
      return await this.prisma.post.findMany({
        where: { status: "ACTIVE", isDeleted: false },
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy bài viết theo trạng thái");
    }
  }

  // Lọc bài viết theo nhiều trường động (cho admin)
  async filterPostsAdmin(filter = {}, skip = 0, take = 10) {
    try {
      return await this.prisma.post.findMany({
        where: filter,
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lọc bài viết");
    }
  }

  // Lọc bài viết theo nhiều trường động (cho user)
  async filterPostsUser(filter = {}, skip = 0, take = 10) {
    try {
      return await this.prisma.post.findMany({
        where: { filter, AND: [{ isDeleted: false }, { status: "ACTIVE" }] },
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lọc bài viết");
    }
  }

  // Tìm kiếm theo title, content
  async getPostByKeyWord(keyword, skip = 0, take = 10) {
    try {
      return this.prisma.post.findMany({
        where: {
          AND: [
            { isDeleted: false },
            {
              OR: [
                { title: { contains: keyword, mode: "insensitive" } },
                { content: { contains: keyword, mode: "insensitive" } },
              ],
            },
          ],
        },
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy bài viết theo tag này");
    }
  }

  // Tìm kiếm theo tagid
  async getPostsByTag(tagid, skip = 0, take = 10) {
    try {
      return this.prisma.post.findMany({
        where: {
          isDeleted: false,
          postTags: {
            some: {
              idTag: parseInt(tagid),
            },
          },
        },
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy bài viết theo tag");
    }
  }

  // Tìm kiếm theo nhiều tag
  async findManyTag(tagIds = [], skip = 0, take = 10) {
    try {
      return await this.prisma.post.findMany({
        where: {
          isDeleted: false,
          postTags: {
            some: {
              idTag: { in: tagIds.map((id) => parseInt(id)) },
            },
          },
        },
        skip,
        take,
        orderBy: { createdAt: "desc" },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể tìm theo tag đã chọn");
    }
  }

  // Đếm số lượng bài viết
  async countPost() {
    try {
      return this.prisma.post.count({
        where: { isDeleted: false },
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể đếm số lượng bài viết");
    }
  }

  // Lấy bài viết nổi bật
  async getPostsByHighLight(limit = 5) {
    try {
      return this.prisma.post.findMany({
        where: { isDeleted: false, status: "ACTIVE" },
        orderBy: { viewCount: "desc" },
        take: limit,
      });
    } catch (err) {
      console.error("Lỗi: ", err);
      throw new Error("Không thể lấy những bài viết nổi bật");
    }
  }
}

module.exports = new PostRepository();
