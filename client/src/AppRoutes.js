import React from 'react';
import { Routes, Route, Navigate, useLocation } from 'react-router-dom';

import NavBar from './components/navbar';
import Login from './components/Login';
import SignUp from './components/SignUp';
import HomeScreen from './components/HomeScreen';
import Control from './components/Control';
import Profile from './components/Profile';
import InfomationTree from './components/InfomationTree';
import Pump from './components/Pump';
import PumpSetting from './components/PumpSetting';
import History from './components/History';
import ThresholdAlert from './components/ThresholdAlert';
import Garden from './components/Garden';

import classes from "./App.module.scss";

function AppRoutes({ loggedIn, handleLogin, handleLogout, message, gardenId }) {
  const location = useLocation();
  const hideNavBar = location.pathname === "/login" || location.pathname === "/signup";

  return (
    <div className={classes["main-content"]}>
      <ThresholdAlert message={message} gardenId={gardenId} />
      {!hideNavBar && <NavBar onLogOut={handleLogout} />}
      <div className={classes["routes-content"]}>
        <Routes>
          <Route path="/login" element={<Login onLogin={handleLogin} />} />
          <Route path="/signup" element={<SignUp />} />

          {loggedIn ? (
            <>
              <Route path="/dashboard" element={<HomeScreen message={message} />} />
              <Route path="/control" element={<Control message={message} />} />
              <Route path="/infomation" element={<InfomationTree message={message} />} />
              <Route path="/pumpSetting" element={<PumpSetting message={message} />} />
              <Route path="/pumpWater" element={<Pump />} />
              <Route path="/history" element={<History gardenId={gardenId} />} />
              <Route path="/profile" element={<Profile />} />
              <Route path="/garden" element={<Garden />} />
              <Route path="*" element={<Navigate to="/dashboard" />} />
            </>
          ) : (
            <Route path="*" element={<Navigate to="/login" />} />
          )}
        </Routes>
      </div>
    </div>
  );
}

export default AppRoutes;
