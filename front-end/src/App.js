import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import AppRoute from "./routes/AppRoutes";
import { UserProvider } from "./context/UserContext"; // Import UserProvider

function App() {
  return (
    <UserProvider>
      <Router>
        <AppRoute />
      </Router>
    </UserProvider>
  );
}

export default App;