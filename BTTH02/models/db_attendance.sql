-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 22, 2023 lúc 09:54 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quan_ly_diem_danh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `attendance_Date` date NOT NULL,
  `id_Class` varchar(25) NOT NULL,
  `id_Student` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance`
--

INSERT INTO `attendance` (`attendance_Date`, `id_Class`, `id_Student`, `status`) VALUES
('2023-05-19', 'cse1', '205106325', 'Co mat'),
('2023-05-20', 'cse1', '205106325', 'Vang mat'),
('2023-05-21', 'cse2', '205106659', 'Co mat'),
('2023-05-22', 'cse2', '205106659', 'Co mat');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `id_Class` varchar(25) NOT NULL,
  `id_Course` varchar(25) DEFAULT NULL,
  `id_Lecturer` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`id_Class`, `id_Course`, `id_Lecturer`) VALUES
('cse1', '1', '123'),
('cse2', '2', '345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_student`
--

CREATE TABLE `class_student` (
  `id_Class` varchar(25) NOT NULL,
  `id_Student` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `class_student`
--

INSERT INTO `class_student` (`id_Class`, `id_Student`) VALUES
('cse1', '205106325'),
('cse2', '205106659');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `id_Course` varchar(25) NOT NULL,
  `id_Lecturer` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`id_Course`, `id_Lecturer`, `name`) VALUES
('2', '345', 'Lap trinh winform '),
('1', '123', 'Lap trinh cong nghe web');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lecturer`
--

CREATE TABLE `lecturer` (
  `id_Lecturer` varchar(50) NOT NULL,
  `full_Name` varchar(50) NOT NULL,
  `user_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lecturer`
--

INSERT INTO `lecturer` (`id_Lecturer`, `full_Name`, `user_Name`) VALUES
('123', 'Kiều Tuấn Dũng', 'dungkt@gmail.com'),
('345', 'Nguyễn Văn Nam', 'namvn@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `id_Student` varchar(50) NOT NULL,
  `full_Name` varchar(50) NOT NULL,
  `birth_Day` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `user_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`id_Student`, `full_Name`, `birth_Day`, `address`, `user_Name`) VALUES
('205106325', 'Nguyen Van A', '2002-05-21', 'Ha Noi', 'nguyenvana@gmail.com'),
('205106659', 'Nguyen Van B', '2001-09-20', 'Ha Noi', 'nguyenvanb@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_User` varchar(25) NOT NULL,
  `user_Name` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_User`, `user_Name`, `password`, `role`) VALUES
('u1', 'nguyenvana@gmail.com', '123456', '1'),
('u2', 'nguyenvanb@gmail.com', '123456', '1'),
('a1', 'dungkt@gmail.com', '123456', '0'),
('a2', 'namvn@gmail.com', '123456', '0');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `id_Class` (`id_Class`),
  ADD KEY `id_Student` (`id_Student`);

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_Class`),
  ADD KEY `id_Course` (`id_Course`),
  ADD KEY `id_Lecturer` (`id_Lecturer`);

--
-- Chỉ mục cho bảng `class_student`
--
ALTER TABLE `class_student`
  ADD KEY `id_Class` (`id_Class`),
  ADD KEY `id_Student` (`id_Student`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_Course`),
  ADD KEY `id_Lecturer` (`id_Lecturer`);

--
-- Chỉ mục cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`id_Lecturer`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_Student`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id_Class`) REFERENCES `class` (`id_Class`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`id_Student`) REFERENCES `student` (`id_Student`);

--
-- Các ràng buộc cho bảng `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`id_Course`) REFERENCES `course` (`id_Course`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`id_Lecturer`) REFERENCES `lecturer` (`id_Lecturer`);

--
-- Các ràng buộc cho bảng `class_student`
--
ALTER TABLE `class_student`
  ADD CONSTRAINT `class_student_ibfk_1` FOREIGN KEY (`id_Class`) REFERENCES `class` (`id_Class`),
  ADD CONSTRAINT `class_student_ibfk_2` FOREIGN KEY (`id_Student`) REFERENCES `student` (`id_Student`);

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_Lecturer`) REFERENCES `lecturer` (`id_Lecturer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;