import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import './Login.css';
import PersonIcon from '../assets/icons/person.svg';
import LockIcon from '../assets/icons/lock.svg';

function SignUp() {
  const [name, setName] = useState('');
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [message, setMessage] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (event) => {
    event.preventDefault();

    // Kiểm tra xác nhận mật khẩu
    if (password !== confirmPassword) {
      setMessage("❌ Mật khẩu không khớp!");
      return;
    }

    axios.post('/api/v1/signup', { name, username, password })
.then(response => {
  localStorage.setItem('token', response.data.token);
  setMessage("✅ Đăng ký thành công! Đang chuyển hướng...");

  // ✅ Chỉ chuyển hướng sau 2 giây (sau khi message được hiển thị)
  setTimeout(() => {
    navigate('/login');
  }, 2000);
})
      .catch(error => {
        console.error(error);
        setMessage("❌ Đăng ký thất bại. Vui lòng thử lại.");
      });
  };

  return (
    <div className="w-screen h-screen flex items-center justify-center bg-[#f0f4ff]">
      <div className="wrapper">
        <h1 className="text-3xl font-bold uppercase mb-4 text-center">Sign Up</h1>

        {message && (
          <p className={`text-center mb-2 ${message.includes('✅') ? 'text-green-600' : 'text-red-600'}`}>
            {message}
          </p>
        )}

        <form className="w-full space-y-4 flex flex-col items-center" onSubmit={handleSubmit}>
          <div className="flex items-center w-80">
            <div className="label-icon">
              <img src={PersonIcon} alt="Name" />
            </div>
            <input
              type="text"
              value={name}
              onChange={e => setName(e.target.value)}
              placeholder="Name"
              className="input-field"
            />
          </div>
          <div className="flex items-center w-80">
            <div className="label-icon">
              <img src={PersonIcon} alt="Username" />
            </div>
            <input
              type="text"
              value={username}
              onChange={e => setUsername(e.target.value)}
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
              onChange={e => setPassword(e.target.value)}
              placeholder="Password"
              className="input-field"
            />
          </div>
          <div className="flex items-center w-80">
            <div className="label-icon">
              <img src={LockIcon} alt="Confirm Password" />
            </div>
            <input
              type="password"
              value={confirmPassword}
              onChange={e => setConfirmPassword(e.target.value)}
              placeholder="Confirm Password"
              className="input-field"
            />
          </div>
          <button type="submit" className="btn-submit w-80">Sign Up</button>
        </form>
        <p className="mt-4 text-center">
          Already have an account?{" "}
          <span
            className="text-blue-600 hover:underline cursor-pointer"
            onClick={() => navigate('/login')}
          >
            Login
          </span>
        </p>
      </div>
    </div>
  );
}

export default SignUp;
