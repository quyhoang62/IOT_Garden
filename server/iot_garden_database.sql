-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 01, 2023 lúc 07:50 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `iot_garden_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_ID` int(11) NOT NULL,
  `admin_Name` varchar(255) NOT NULL,
  `admin_Username` varchar(255) NOT NULL,
  `admin_Password` varchar(255) NOT NULL,
  `admin_Role` varchar(50) NOT NULL,
  `admin_Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_condition`
--

CREATE TABLE `tbl_condition` (
  `condition_ID` int(11) NOT NULL,
  `condition_Amdat` varchar(255) NOT NULL,
  `condition_Temp` varchar(255) NOT NULL,
  `condition_Humid` varchar(255) NOT NULL,
  `condition_GardenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_condition`
--

INSERT INTO `tbl_condition` (`condition_ID`, `condition_Amdat`, `condition_Temp`, `condition_Humid`, `condition_GardenID`) VALUES
(1, '30', '35', '30', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_dht20`
--

CREATE TABLE `tbl_dht20` (
  `dht_ID` int(11) NOT NULL,
  `dht_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `dht_Temp` varchar(255) NOT NULL,
  `dht_Humid` varchar(255) NOT NULL,
  `dht_GardenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_dht20`
--

INSERT INTO `tbl_dht20` (`dht_ID`, `dht_Time`, `dht_Temp`, `dht_Humid`, `dht_GardenID`) VALUES
(1, '2025-05-17 00:37:52', '30.3', '51.3', 1),
(2, '2025-05-17 00:38:08', '30.3', '51.3', 1),
(3, '2025-05-17 00:38:25', '30.3', '50.9', 1),
(4, '2025-05-17 00:38:41', '30.2', '50.8', 1),
(5, '2025-05-17 00:38:57', '30.2', '51.6', 1),
(6, '2025-05-17 00:39:13', '30.2', '51.1', 1),
(7, '2025-05-17 00:39:29', '30.1', '51.1', 1),
(8, '2025-05-17 00:39:46', '30.1', '51.3', 1),
(9, '2025-05-17 00:40:02', '30.2', '51.7', 1),
(10, '2025-05-17 00:40:18', '30.2', '51.3', 1),
(11, '2025-05-17 00:40:34', '30.2', '50.9', 1),
(12, '2025-05-17 00:40:49', '30.3', '51.1', 1),
(13, '2025-05-17 00:41:05', '30.2', '53.1', 1),
(14, '2025-05-17 00:41:22', '30.2', '51', 1);


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_garden`
--

CREATE TABLE `tbl_garden` (
  `garden_ID` int(11) NOT NULL,
  `garden_OwnerID` int(11) NOT NULL,
  `garden_Location` varchar(255) DEFAULT NULL,
  `garden_Status` varchar(150) DEFAULT NULL,
  `garden_Name` varchar(150) DEFAULT NULL,
  `garden_Description` varchar(250) DEFAULT NULL,
  `garden_Area` decimal(10,2) DEFAULT NULL,
  `garden_Image` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_garden`
--

INSERT INTO `tbl_garden` (`garden_ID`, `garden_OwnerID`, `garden_Location`, `garden_Status`, `garden_Name`, `garden_Description`, `garden_Area`, `garden_Image`) VALUES
(1, 1, 'vuon ban cong', 'Active', 'Garden', 'Garten1', '50.00', 'None');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_light`
--

CREATE TABLE `tbl_light` (
  `light_ID` int(11) NOT NULL,
  `light_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `light_Value` varchar(255) NOT NULL,
  `light_GardenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_soil_moisture`
--

CREATE TABLE `tbl_soil_moisture` (
  `soil_moisture_ID` int(11) NOT NULL,
  `soil_moisture_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `soil_moisture_Value` varchar(255) NOT NULL,
  `soil_moisture_GardenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_soil_moisture`
--

INSERT INTO `tbl_soil_moisture` (`soil_moisture_ID`, `soil_moisture_Time`, `soil_moisture_Value`, `soil_moisture_GardenID`) VALUES
(1, '2025-05-17 07:14:31', '52', 1),
(2, '2025-05-17 00:37:52', '40', 1),
(3, '2025-05-17 00:38:08', '41', 1),
(4, '2025-05-17 00:38:25', '43', 1),
(5, '2025-05-17 00:38:41', '46', 1),
(6, '2025-05-17 00:38:57', '51', 1),
(7, '2025-05-17 00:39:13', '52', 1),
(8, '2025-05-17 00:39:29', '53', 1),
(9, '2025-05-17 00:39:46', '57', 1),
(10, '2025-05-17 00:40:02', '43', 1),
(11, '2025-05-17 00:40:18', '34', 1),
(12, '2025-05-17 00:40:34', '35', 1),
(13, '2025-05-17 00:40:49', '46', 1),
(14, '2025-05-17 00:41:06', '36', 1);


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_ID` int(11) NOT NULL,
  `user_Name` varchar(255) NOT NULL,
  `user_Username` varchar(255) NOT NULL,
  `user_Password` varchar(255) NOT NULL,
  `user_Role` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  `user_Address` varchar(50) DEFAULT NULL,
  `user_Email` varchar(255) DEFAULT NULL,
  `user_Phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`user_ID`, `user_Name`, `user_Username`, `user_Password`, `user_Role`, `user_Address`, `user_Email`, `user_Phone`) VALUES
(1, 'quy', 'user', '$2b$10$pcXkMmi2yPpFxe5Is5emBeIjVplfwVG11RguBPbruzaPZ7ijnkVAi', 'USER', 'Ha Noi', 'hoangquy@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_water_pump`
--

CREATE TABLE `tbl_water_pump` (
  `water_pump_ID` int(11) NOT NULL,
  `water_pump_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `water_pump_Value` varchar(255) NOT NULL,
  `water_pump_GardenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_water_pump`
--

INSERT INTO `tbl_water_pump` (`water_pump_ID`, `water_pump_Time`, `water_pump_Value`, `water_pump_GardenID`) VALUES
(1, '2025-05-16 08:20:04', '0', 1),
(2, '2025-05-16 19:50:17', '0', 1),
(3, '2025-05-16 20:08:29', '0', 1),
(4, '2025-05-16 20:36:26', '0', 1),
(5, '2025-05-16 21:39:42', '0', 1),
(6, '2025-05-16 21:39:52', '1', 1),
(7, '2025-05-16 21:39:58', '0', 1),
(8, '2025-05-16 22:06:38', '1', 1),
(9, '2025-05-16 22:06:43', '0', 1),
(10, '2025-05-16 22:07:23', '1', 1),
(11, '2025-05-16 22:07:28', '0', 1),
(12, '2025-05-16 23:52:24', '0', 1),
(13, '2025-05-17 00:02:18', '0', 1),
(14, '2025-05-17 00:05:36', '0', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Chỉ mục cho bảng `tbl_condition`
--
ALTER TABLE `tbl_condition`
  ADD PRIMARY KEY (`condition_ID`),
  ADD KEY `condition_GardenID` (`condition_GardenID`);

--
-- Chỉ mục cho bảng `tbl_dht20`
--
ALTER TABLE `tbl_dht20`
  ADD PRIMARY KEY (`dht_ID`),
  ADD KEY `dht_GardenID` (`dht_GardenID`);

--
-- Chỉ mục cho bảng `tbl_garden`
--
ALTER TABLE `tbl_garden`
  ADD PRIMARY KEY (`garden_ID`),
  ADD KEY `garden_OwnerID` (`garden_OwnerID`);

--
-- Chỉ mục cho bảng `tbl_light`
--
ALTER TABLE `tbl_light`
  ADD PRIMARY KEY (`light_ID`),
  ADD KEY `light_GardenID` (`light_GardenID`);

--
-- Chỉ mục cho bảng `tbl_soil_moisture`
--
ALTER TABLE `tbl_soil_moisture`
  ADD PRIMARY KEY (`soil_moisture_ID`),
  ADD KEY `soil_moisture_GardenID` (`soil_moisture_GardenID`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_ID`);

--
-- Chỉ mục cho bảng `tbl_water_pump`
--
ALTER TABLE `tbl_water_pump`
  ADD PRIMARY KEY (`water_pump_ID`),
  ADD KEY `water_pump_GardenID` (`water_pump_GardenID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_condition`
--
ALTER TABLE `tbl_condition`
  MODIFY `condition_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_dht20`
--
ALTER TABLE `tbl_dht20`
  MODIFY `dht_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT cho bảng `tbl_garden`
--
ALTER TABLE `tbl_garden`
  MODIFY `garden_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_light`
--
ALTER TABLE `tbl_light`
  MODIFY `light_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_soil_moisture`
--
ALTER TABLE `tbl_soil_moisture`
  MODIFY `soil_moisture_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_water_pump`
--
ALTER TABLE `tbl_water_pump`
  MODIFY `water_pump_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_condition`
--
ALTER TABLE `tbl_condition`
  ADD CONSTRAINT `tbl_condition_ibfk_1` FOREIGN KEY (`condition_GardenID`) REFERENCES `tbl_garden` (`garden_ID`);

--
-- Các ràng buộc cho bảng `tbl_dht20`
--
ALTER TABLE `tbl_dht20`
  ADD CONSTRAINT `tbl_dht20_ibfk_1` FOREIGN KEY (`dht_GardenID`) REFERENCES `tbl_garden` (`garden_ID`);

--
-- Các ràng buộc cho bảng `tbl_garden`
--
ALTER TABLE `tbl_garden`
  ADD CONSTRAINT `tbl_garden_ibfk_1` FOREIGN KEY (`garden_OwnerID`) REFERENCES `tbl_user` (`user_ID`);

--
-- Các ràng buộc cho bảng `tbl_light`
--
ALTER TABLE `tbl_light`
  ADD CONSTRAINT `tbl_light_ibfk_1` FOREIGN KEY (`light_GardenID`) REFERENCES `tbl_garden` (`garden_ID`);

--
-- Các ràng buộc cho bảng `tbl_soil_moisture`
--
ALTER TABLE `tbl_soil_moisture`
  ADD CONSTRAINT `tbl_soil_moisture_ibfk_1` FOREIGN KEY (`soil_moisture_GardenID`) REFERENCES `tbl_garden` (`garden_ID`);

--
-- Các ràng buộc cho bảng `tbl_water_pump`
--
ALTER TABLE `tbl_water_pump`
  ADD CONSTRAINT `tbl_water_pump_ibfk_1` FOREIGN KEY (`water_pump_GardenID`) REFERENCES `tbl_garden` (`garden_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
