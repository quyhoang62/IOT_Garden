import React, { useEffect, useState } from "react";
import { BrowserRouter as Router } from "react-router-dom";
import axios from "axios";
import AppRoutes from "./AppRoutes";

const POLLING_INTERVAL = 5000;

function App() {
  const [message, setMessage] = useState("");
  const [loggedIn, setLoggedIn] = useState(() => !!localStorage.getItem("token"));
  const gardenId = parseInt(localStorage.getItem("gardenId"));

  const handleLogout = () => {
    localStorage.removeItem("token");
    setLoggedIn(false);
  };

  const handleLogin = () => {
    setLoggedIn(true);
  };

  useEffect(() => {
    const token = localStorage.getItem("token");
    setLoggedIn(!!token);
  }, []);

  useEffect(() => {
    if (loggedIn) {
      const intervalID = setInterval(() => {
        axios.get("/latest-message")
          .then(response => setMessage(response.data.message))
          .catch(console.log);
      }, POLLING_INTERVAL);
      return () => clearInterval(intervalID);
    }
  }, [loggedIn]);

  return (
    <Router>
      <AppRoutes
        loggedIn={loggedIn}
        handleLogin={handleLogin}
        handleLogout={handleLogout}
        message={message}
        gardenId={gardenId}
      />
    </Router>
  );
}

export default App;
