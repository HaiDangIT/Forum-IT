// src/pages/PostDetail.js
import React from 'react';
import { useParams } from 'react-router-dom';
import { fakePosts } from '../data/fakePosts';
import Header from '../components/Header';
import RelatedPosts from '../components/PostDetailComponents/RelatedPosts';
import ShareButtons from '../components/PostDetailComponents/ShareButtons';
import Comments from '../components/PostDetailComponents/Comments';
import '../assets/css/PostDetail.css';

export default function PostDetail() {
  const { id } = useParams(); // Lấy id từ URL
  const post = fakePosts.find(p => p.id === id); // tìm bài viết có id tương ứng

  if (!post) {
    return <div>❌ Không tìm thấy bài viết!</div>;
  }

  return (
    <>
    <Header />
    <div className="post-detail">
      <div className="post-header">
        <h1>{post.title}</h1>
        <p className="author">Tác giả: {post.originalAuthor || 'Ẩn danh'}</p>
        <p className="date">{new Date(post.createdAt).toLocaleDateString()}</p>
      </div>

      <div className="post-body">
        <p>{post.content}</p>
      </div>

      <ShareButtons />
      <Comments postId={post.id} />
    </div>
    
    <div>
      <RelatedPosts currentPostId={post.id} />      
    </div>
    </>
  );
}
