// import React, { useState } from "react";
// import Header from "../components/Header"; // Header riêng đã code ở bước trước
// import Main from '../components/Main';

// const Layout = ({ children }) => {
//   const [showLoginModal, setShowLoginModal] = useState(false);
//   const [currentUser, setCurrentUser] = useState(null);

//   return (
//     <div className="d-flex flex-column min-vh-100">
//       <Header />
//       <Main />
//       {children}
//     </div>
//   );
// };

// export default Layout;
import React from "react";
import Header from "../components/Header";
import Main from '../components/Main';
// import Footer from "../components/Footer";

const Layout = () => {
  return (
    <div className="layout">
      <Header />
      <div className="content-area">
        <Main />
      </div>
      {/* <Footer /> */}
    </div>
  );
};

export default Layout;
