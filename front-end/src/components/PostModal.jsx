// src/components/PostModal.js
import React, { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';

export default function PostModal({ show, onHide, currentUser }) {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');

  const handlePost = (e) => {
    e.preventDefault();

    const post = {
      userId: currentUser.id,
      username: currentUser.username,
      title,
      content,
      createdAt: new Date().toISOString()
    };

    console.log('📝 Bài đăng mới:', post);

    // TODO: gửi lên server hoặc lưu tạm thời
    setTitle('');
    setContent('');
    onHide(); // đóng modal sau khi đăng
  };

  return (
    <Modal show={show} onHide={onHide}>
      <Modal.Header closeButton>
        <Modal.Title>Đăng bài mới</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form onSubmit={handlePost}>
          <Form.Group className="mb-3">
            <Form.Label>Người đăng</Form.Label>
            <Form.Control type="text" value={currentUser?.username} readOnly />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Tiêu đề</Form.Label>
            <Form.Control
              type="text"
              placeholder="Nhập tiêu đề bài viết"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              required
            />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Nội dung</Form.Label>
            <Form.Control
              as="textarea"
              rows={4}
              placeholder="Viết nội dung ở đây..."
              value={content}
              onChange={(e) => setContent(e.target.value)}
              required
            />
          </Form.Group>

          <Button variant="primary" type="submit">
            Đăng bài
          </Button>
        </Form>
      </Modal.Body>
    </Modal>
  );
}
