import React from 'react';
import '../../assets/css/Comments.css';

export default function comments({ postId }) {
    return (
        <div className="comments-section">
            <h3>Bình luận</h3>
            <div className="comment">
                <strong>User123:</strong>Good!
            </div>
            <div className="comment">
                <strong>User123:</strong>Great!
            </div>
        </div>
    );
}