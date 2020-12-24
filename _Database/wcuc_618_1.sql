-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 09:20 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wcuc`
--

-- --------------------------------------------------------

--
-- Table structure for table `computer`
--

CREATE TABLE `computer` (
  `MacAddress` varchar(17) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IPv4` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SeatID` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cStatus` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offline',
  `StudentID` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `computer`
--

INSERT INTO `computer` (`MacAddress`, `IPv4`, `SeatID`, `cStatus`, `StudentID`) VALUES
('44-37-E6-6A-98-3D', NULL, '5-3', 'Offline', NULL),
('44-37-E6-94-6D-43', NULL, '1-3', 'Offline', NULL),
('44-37-E6-98-FC-BB', NULL, '7-3', 'Offline', NULL),
('44-37-E6-98-FC-CF', NULL, '4-7', 'Offline', NULL),
('44-37-E6-98-FD-54', NULL, '4-3', 'Offline', NULL),
('44-37-E6-98-FD-66', NULL, '2-3', 'Offline', NULL),
('44-37-E6-A7-A2-64', NULL, '8-3', 'Offline', NULL),
('44-37-E6-A7-CD-B0', NULL, '1-7', 'Offline', NULL),
('44-37-E6-B1-1E-93', NULL, '8-7', 'Offline', NULL),
('44-37-E6-B1-1E-D4', NULL, '7-11', 'Offline', NULL),
('C4-34-6B-62-A6-74', NULL, '8-9', 'Offline', NULL),
('C4-34-6B-62-A7-31', NULL, '4-9', 'Offline', NULL),
('C4-34-6B-62-A7-51', NULL, '8-5', 'Offline', NULL),
('C4-34-6B-62-A7-57', NULL, '10-9', 'Offline', NULL),
('C4-34-6B-62-A7-66', NULL, '11-7', 'Offline', NULL),
('C4-34-6B-62-A7-6D', NULL, '2-11', 'Offline', NULL),
('C4-34-6B-62-A7-70', NULL, '4-5', 'Offline', NULL),
('C4-34-6B-62-A7-71', NULL, '2-9', 'Offline', NULL),
('C4-34-6B-62-A7-76', NULL, '7-1', 'Offline', NULL),
('C4-34-6B-62-A7-79', NULL, '10-3', 'Offline', NULL),
('C4-34-6B-62-A7-7F', NULL, '11-3', 'Offline', NULL),
('C4-34-6B-63-24-FB', NULL, '7-9', 'Offline', NULL),
('C4-34-6B-63-25-35', NULL, '7-5', 'Offline', NULL),
('C4-34-6B-63-25-37', NULL, '8-1', 'Offline', NULL),
('C4-34-6B-63-25-42', NULL, '2-5', 'Offline', NULL),
('C4-34-6B-63-25-43', NULL, '5-7', 'Offline', NULL),
('C4-34-6B-63-25-49', NULL, '1-11', 'Offline', NULL),
('C4-34-6B-63-25-4A', NULL, '11-5', 'Offline', NULL),
('C4-34-6B-63-25-4B', NULL, '4-11', 'Offline', NULL),
('C4-34-6B-63-25-4C', NULL, '1-9', 'Offline', NULL),
('C4-34-6B-63-25-4D', NULL, '11-11', 'Offline', NULL),
('C4-34-6B-63-25-4E', NULL, '10-11', 'Offline', NULL),
('C4-34-6B-63-25-51', NULL, '10-5', 'Offline', NULL),
('C4-34-6B-63-25-54', NULL, '1-5', 'Offline', NULL),
('C4-34-6B-64-0E-A3', NULL, '5-9', 'Offline', NULL),
('C4-34-6B-64-0E-A7', NULL, '5-5', 'Offline', NULL),
('C4-34-6B-64-0E-A8', NULL, '10-7', 'Offline', NULL),
('C4-34-6B-65-10-45', NULL, '5-11', 'Offline', NULL),
('C4-34-6B-65-10-52', NULL, '11-9', 'Offline', NULL),
('C4-34-6B-65-10-56', NULL, '8-11', 'Offline', NULL),
('C4-34-6B-65-10-5A', NULL, '2-7', 'Offline', NULL),
('C4-34-6B-65-10-5B', NULL, '7-7', 'Offline', NULL),
('Teacher', NULL, '1-13', 'Teacher', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sPassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sFirstname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sLastname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sFirstLogin` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TeacherID` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tPassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tFirstname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tLastname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tRole` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`TeacherID`, `tPassword`, `tFirstname`, `tLastname`, `tRole`) VALUES
('ADMIN', 'admin', 'Administrator', '', 'Admin'),
('adp', '1234', 'อัครา', 'ประโยชน์', 'Teacher'),
('aws', '1234', 'อนุสรณ์', 'วงษ์สนิท', 'Teacher'),
('blt', '1234', 'เบญจพร ', 'ลิ้มธรรมาภรณ์', 'Teacher'),
('chr', '1234', 'เฉียบวุฒิ', 'รัตนวิไลสกุล', 'Teacher'),
('ens', '1234', 'เอิญ', 'สุริยะฉาย', 'Teacher'),
('gdp', '1234', 'กฤดาภัทร', 'สีหารี', 'Teacher'),
('kab', '1234', 'คันธารัตน์', 'อเนกบุณย์', 'Teacher'),
('ksb', '1234', 'กอบเกียรติ', 'สระอุบล', 'Teacher'),
('lpp', '1234', 'ลือพล', 'พิพานเมฆาภรณ์', 'Teacher'),
('nks', '1234', 'นิกร', 'สุทธิเสงี่ยม', 'Teacher'),
('nsd', '1234', 'ณัฐวุฒิ', 'สร้อยดอกสน', 'Teacher'),
('nsn', '1234', 'นนทกร', 'สถิตานนท์', 'Teacher'),
('pls', '1234', 'ปรัชญาพร', 'เลี้ยงสุทธิสกนธ์', 'Teacher'),
('prv', '1234', 'ปรวัฒน์', 'วิสูตรศักดิ์', 'Teacher'),
('srs', '1234', 'สรร', 'รัตนสัญญา', 'Teacher'),
('ssp', '1234', 'สถิตย์', 'ประสมพันธ์', 'Teacher'),
('swk', '1234', 'สุวัจชัย', 'กมลสันติโรจน์', 'Teacher'),
('tna', '1234', 'ธนภัทร์', 'อนุศาสน์อมรกุล', 'Teacher'),
('yck', '1234', 'ยนต์ชนก', 'เขาแก้ว', 'Teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`MacAddress`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TeacherID`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
