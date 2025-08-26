// src/AppRoute.jsx
import React from "react";
import { Routes, Route } from "react-router-dom";

// Layout

// Pages
import Home from "../pages/Home";
import PostDetail from '../pages/PostDetail';
import Discussion from "../pages/Discussion";
import Study from "../pages/Study";
import Connect from "../pages/Connect";

const AppRoute = () => {
  return (
    <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/posts/:id" element={<PostDetail />} />
        <Route path="/discussion" element={<Discussion />} />
        <Route path="/study" element={<Study />} />
        <Route path="/connect" element={<Connect />} />
    </Routes>
  );
};

export default AppRoute;