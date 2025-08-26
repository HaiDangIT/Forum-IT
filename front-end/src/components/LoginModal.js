// src/components/LoginModal.js
import React, { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';
import '../assets/css/LoginModal.css';
import { login, register } from '../services/UserApi';

export default function LoginModal({ show, onHide, setCurrentUser, onLogin }) {
  const [isLogin, setIsLogin] = useState(true);
  const [username, setUsername] = useState('');
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (isLogin) {
      // ---- LOGIN ----
      try {
        const res = await login(email, password);

        if (res.data) {
          alert(res.data.message || "✅ Đăng nhập thành công");
          onLogin(res.data);
          onHide();
        } else {
          alert("Sai email hoặc mật khẩu.");
        }
      } catch (err) {
        console.error(err.response?.data || err.message);
        alert(err.response?.data?.error || "❌ Đăng nhập thất bại!");
      }
    } else {
      // ---- REGISTER ----
      if (password !== confirmPassword) {
        alert("Mật khẩu xác nhận không khớp!");
        return;
      }

      try {
        const res = await register(username, password, email, firstName, lastName);
        alert(res.data.message || "✅ Đăng ký thành công, hãy đăng nhập");
        setIsLogin(true);
      } catch (err) {
        console.error(err.response?.data || err.message);
        alert(err.response?.data?.error || "❌ Đăng ký thất bại!");
      }
    }

    // Reset form
    setUsername('');
    setFirstName('');
    setLastName('');
    setEmail('');
    setPassword('');
    setConfirmPassword('');
  };

  return (
    <Modal show={show} onHide={onHide} centered>
      <Modal.Header closeButton>
        <Modal.Title>{isLogin ? 'Đăng nhập' : 'Đăng ký'}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form onSubmit={handleSubmit}>
          {/* Chỉ hiện khi Đăng ký */}
          {!isLogin && (
            <>
              <Form.Group className="mb-3">
                <Form.Label>Username</Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Nhập tối thiểu 3 ký tự (gồm: chữ cái và số)"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  required
                />
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>First Name</Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Nhập tối thiểu 3 ký tự"
                  value={firstName}
                  onChange={(e) => setFirstName(e.target.value)}
                  required
                />
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Last Name</Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Nhập tối thiểu 3 ký tự"
                  value={lastName}
                  onChange={(e) => setLastName(e.target.value)}
                  required
                />
              </Form.Group>
            </>
          )}

          {/* Email */}
          <Form.Group className="mb-3">
            <Form.Label>Email</Form.Label>
            <Form.Control
              type="email"
              placeholder="Nhập email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </Form.Group>

          {/* Password */}
          <Form.Group className="mb-3">
            <Form.Label>Mật khẩu</Form.Label>
            <Form.Control
              type="password"
              placeholder="Nhập tối thiểu 6 ký tự, Chữ hoa, Chữ thường, Số"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </Form.Group>

          {/* Confirm Password */}
          {!isLogin && (
            <Form.Group className="mb-3">
              <Form.Label>Xác nhận mật khẩu</Form.Label>
              <Form.Control
                type="password"
                placeholder="Nhập lại mật khẩu"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                required
              />
            </Form.Group>
          )}

          <Button variant="primary" type="submit" className="w-100">
            {isLogin ? 'Đăng nhập' : 'Đăng ký'}
          </Button>
        </Form>

        <hr />
        <div className="text-center mt-3">
          {isLogin ? (
            <span>
              Chưa có tài khoản?{' '}
              <button className="btn btn-link p-0" onClick={() => setIsLogin(false)}>
                Đăng ký
              </button>
            </span>
          ) : (
            <span>
              Đã có tài khoản?{' '}
              <button className="btn btn-link p-0" onClick={() => setIsLogin(true)}>
                Đăng nhập
              </button>
            </span>
          )}
        </div>
      </Modal.Body>
    </Modal>
  );
}
