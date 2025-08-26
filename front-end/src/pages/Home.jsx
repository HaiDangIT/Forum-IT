// src/components/Main.jsx
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../components/Header';
import PostModal from '../components/PostModal';
import { fakePosts } from '../data/fakePosts';
import '../assets/css/Main.css';

export default function Main() {
  const [showPostModal, setShowPostModal] = useState(false);
  const [currentUser, setCurrentUser] = useState(null); // Giả sử chưa có context user
  const navigate = useNavigate();
  const handleLogin = (user) => {
    setCurrentUser(user);
  };

  return (
    <>
      <Header onLogin={handleLogin} />
      <main className="main-content">
        {/* Sidebar trái */}
        <aside className="sidebar">
          <div className="sidebar-section">
            <h3>Chủ đề nổi bật</h3>
            <div className="tag-list">
              {['JavaScript', 'Python', 'Node.js', 'React', 'AI/ML'].map((tag, i) => (
                <div className="tag-box" key={i}>
                  <span className="tag-icon">
                    <i className={`fab fa-${tag.toLowerCase().includes("ai") ? "brain" : tag.toLowerCase().replace('.', '')}`}></i>
                  </span>
                  <span className="tag-name">{tag}</span>
                  <span className="tag-count">68,000+</span>
                </div>
              ))}
            </div>
          </div>

          <div className="sidebar-section">
            <h3>Thống kê</h3>
            <div className="stats">
              <div className="stat-item"><span className="stat-number">12,580</span><span className="stat-label">Thành viên</span></div>
              <div className="stat-item"><span className="stat-number">2,847</span><span className="stat-label">Bài viết</span></div>
              <div className="stat-item"><span className="stat-number">156</span><span className="stat-label">Online</span></div>
            </div>
          </div>
        </aside>

        {/* Feed giữa */}
        <section className="feed">
          <div className="create-post-card">
            <div className="create-post-header">
              <img
                src={currentUser?.avatar || "https://via.placeholder.com/40x40/2387FA/FFFFFF?text=U"}
                alt="User"
                className="user-avatar-small"
              />
              <input
                type="text"
                placeholder="Chia sẻ kiến thức hoặc đặt câu hỏi..."
                className="create-post-input"
                onFocus={() => currentUser ? setShowPostModal(true) : alert("Bạn cần đăng nhập để đăng bài")}
              />
            </div>
            <div className="create-post-actions">
              <div className="action-buttons">
                <button className="btn-ghost"><i className="fas fa-code"></i> Code</button>
                <button className="btn-ghost"><i className="fas fa-image"></i> Hình ảnh</button>
              </div>
              <button
                className="btn-primary"
                onClick={() => currentUser ? setShowPostModal(true) : alert("Bạn cần đăng nhập để đăng bài")}
              >
                Đăng bài
              </button>
            </div>
          </div>

          {/* {fakePosts.map((post) => (
            <article className="post-card" key={post.id}>
              <div className="post-header">
                <img src="https://via.placeholder.com/40x40/2CD4D9/FFFFFF?text=A" alt="User" className="user-avatar-small" />
                <div className="post-user-info">
                  <h4>{post.originalAuthor || 'Anonymous'}</h4>
                  <span className="post-time">2 giờ trước • Developer</span>
                </div>
                <button className="btn-follow">Theo dõi</button>
              </div>

              <div className="post-content">
                <h3>{post.title}</h3>
                <p>{post.excerpt || '...'}</p>
              </div>

              <div className="post-tags">
                {post.tags?.map((tag, i) => (
                  <span className="tag" key={i}>
                    <span className="tag-icon"><i className={`fab fa-${tag.toLowerCase()}`}></i></span>
                    {tag}
                  </span>
                ))}
              </div>

              <div className="post-actions">
                <button className="action-btn"><i className="fas fa-heart"></i> 24</button>
                <button className="action-btn"><i className="fas fa-comment"></i> 8</button>
                <button className="action-btn"><i className="fas fa-bookmark"></i></button>
                <button className="action-btn"><i className="fas fa-share"></i></button>
              </div>
            </article>
          ))} */}

          {fakePosts.map((post) => (
            <article
              className="post-card"
              key={post.id}
              onClick={() => navigate(`/posts/${post.id}`)}
              style={{ cursor: 'pointer' }}
            >
              <div className="post-header">
                <img src="https://via.placeholder.com/40x40/2CD4D9/FFFFFF?text=A" alt="User" className="user-avatar-small" />
                <div className="post-user-info">
                  <h4>{post.originalAuthor || 'Anonymous'}</h4>
                  <span className="post-time">2 giờ trước • Developer</span>
                </div>
                <button className="btn-follow" onClick={(e) => e.stopPropagation()}>Theo dõi</button>
              </div>

              <div className="post-content">
                <h3>{post.title}</h3>
                <p>{post.excerpt || '...'}</p>
              </div>

              <div className="post-tags">
                {post.tags?.map((tag, i) => (
                  <span className="tag" key={i}>
                    <span className="tag-icon"><i className={`fab fa-${tag.toLowerCase()}`}></i></span>
                    {tag}
                  </span>
                ))}
              </div>

              <div className="post-actions">
                <button className="action-btn" onClick={(e) => e.stopPropagation()}><i className="fas fa-heart"></i> 24</button>
                <button className="action-btn" onClick={(e) => e.stopPropagation()}><i className="fas fa-comment"></i> 8</button>
                <button className="action-btn" onClick={(e) => e.stopPropagation()}><i className="fas fa-bookmark"></i></button>
                <button className="action-btn" onClick={(e) => e.stopPropagation()}><i className="fas fa-share"></i></button>
              </div>
            </article>
          ))}
        </section>

        {/* Sidebar phải */}
        <aside className="right-sidebar">
          <div className="sidebar-section">
            <h3>Gợi ý kết nối</h3>
            <div className="connection-suggestions">
              <div className="suggestion-item">
                <img src="https://via.placeholder.com/40x40/2387FA/FFFFFF?text=A" alt="User" />
                <div className="suggestion-info">
                  <h4>An Phạm</h4>
                  <p>Frontend Developer</p>
                </div>
                <button className="btn-connect">Kết nối</button>
              </div>
            </div>
          </div>
        </aside>
      </main>

      {/* Modal đăng bài */}
      <PostModal
        show={showPostModal}
        onHide={() => setShowPostModal(false)}
        currentUser={currentUser}
      />
    </>
  );
}
