import React, { useContext, useState } from 'react';
import { Link } from "react-router-dom";
import LoginModal from './LoginModal';
import { UserContext } from "../context/UserContext"; // 👈
import '../assets/css/Header.css';

export default function Header() {
  const { currentUser, login, logout } = useContext(UserContext); // 👈
  const [showLoginModal, setShowLoginModal] = useState(false);

  return (
    <>
      <div className="navbar">
        <div className="nav-container">
          <div className="nav-brand">
            <h2>Forum IT Việt</h2>
          </div>

          <nav className="nav-menu">
            <Link className="nav-link" to="/">Trang chủ</Link>
            <Link className="nav-link" to="/discussion">Thảo luận</Link>
            <Link className="nav-link" to="/study">Học tập</Link>
            <Link className="nav-link" to="/connect">Kết nối</Link>
          </nav>

          <div className="nav-actions">
            {currentUser ? (
              <>
                <div className="user-avatar">
                  <img
                    src={currentUser.avatar || "https://via.placeholder.com/40x40/2387FA/FFFFFF?text=U"}
                    alt="User"
                  />
                </div>
                <span className="username">{currentUser.username}</span>
                <button className="btn btn-primary" onClick={logout}>Đăng xuất</button>
              </>
            ) : (
              <button className="btn btn-primary" onClick={() => setShowLoginModal(true)}>
                Đăng nhập
              </button>
            )}
          </div>
        </div>
      </div>

      <LoginModal
        show={showLoginModal}
        onHide={() => setShowLoginModal(false)}
        onLogin={(user) => {
          login(user); // sử dụng context để login
          setShowLoginModal(false);
        }}
      />
    </>
  );
}
