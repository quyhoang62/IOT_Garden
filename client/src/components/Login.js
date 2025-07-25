import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import jwtDecode from "jwt-decode";
import "./Login.css";

import PersonIcon from "../assets/icons/person.svg";
import LockIcon from "../assets/icons/lock.svg";

function Login({ onLogin }) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (event) => {
    event.preventDefault();

    if (!username.trim() || !password.trim()) {
      return;
    }

    try {
      const response = await axios.post("/api/v1/login", { username, password });

      const token = response.data.token;
      localStorage.setItem("token", token);

      const tokenObject = jwtDecode(token);
      localStorage.setItem("userId", tokenObject.id);

      const gardenRes = await axios.get(`/api/v1/gardens/owner/${tokenObject.id}`, {
        headers: { Authorization: `Bearer ${token}` }
      });

      const gardenId = gardenRes.data.garden_ID;
      localStorage.setItem("gardenId", gardenId);

      setErrorMessage(""); // Xóa lỗi nếu thành công
      onLogin();
      navigate("/dashboard");

    } catch (error) {
      // ⚠️ Bắt lỗi từ backend và hiển thị
      console.error(error);
      setErrorMessage("Wrong account or password.");
    }
  };

  const handleSignUp = (event) => {
    event.preventDefault();
    navigate("/signup");
  };

  return (
    <div className="w-screen h-screen flex items-center justify-center bg-[#f0f4ff]">
      <div className="wrapper">
        <h1 className="text-3xl font-bold uppercase mb-4 text-center">Login</h1>

        {/* Thông báo lỗi */}
        {errorMessage && (
          <p className="text-red-600 text-center mb-2">{errorMessage}</p>
        )}

        <form className="w-full space-y-4 flex flex-col items-center" onSubmit={handleSubmit}>
          <div className="flex items-center w-80">
            <div className="label-icon">
              <img src={PersonIcon} alt="Username" />
            </div>
            <input
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              placeholder="Username"
              className="input-field"
            />
          </div>
          <div className="flex items-center w-80">
            <div className="label-icon">
              <img src={LockIcon} alt="Password" />
            </div>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Password"
              className="input-field"
            />
          </div>
          <button type="submit" className="btn-submit w-80">Login</button>
        </form>
        <p className="mt-4 text-center">
          New here?{" "}
          <span
            className="text-blue-600 hover:underline cursor-pointer"
            onClick={handleSignUp}
          >
            Sign up
          </span>
        </p>
      </div>
    </div>
  );
}

export default Login;
