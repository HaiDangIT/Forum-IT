import React from 'react';
import { fakePosts } from '../../data/fakePosts';
import '../../assets/css/RelatedPosts.css';

export default function RelatedPosts({ currentPostId }) {
  const related = fakePosts.filter(p => p.id !== currentPostId).slice(0, 3);

  return (
    <div className="related-posts">
      <h3>Bài viết liên quan</h3>
      <ul>
        {related.map(post => (
          <li key={post.id}>{post.title}</li>
        ))}
      </ul>
    </div>
  );
}