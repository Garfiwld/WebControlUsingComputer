-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 09:31 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

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
('8C-EC-4B-A3-8C-EE', NULL, '6-9', 'Offline', NULL),
('8C-EC-4B-A3-8D-28', NULL, '10-1', 'Offline', NULL),
('8C-EC-4B-A3-8D-7D', NULL, '9-3', 'Offline', NULL),
('8C-EC-4B-A3-8D-7E', NULL, '10-6', 'Offline', NULL),
('8C-EC-4B-A3-8D-98', NULL, '6-8', 'Offline', NULL),
('8C-EC-4B-A3-8D-A1', NULL, '9-11', 'Offline', NULL),
('8C-EC-4B-A3-8D-BB', NULL, '2-6', 'Offline', NULL),
('8C-EC-4B-A3-8D-CB', NULL, '2-5', 'Offline', NULL),
('8C-EC-4B-A3-8D-CE', NULL, '10-9', 'Offline', NULL),
('8C-EC-4B-A3-8D-FE', NULL, '10-3', 'Offline', NULL),
('8C-EC-4B-A3-8E-78', NULL, '9-4', 'Offline', NULL),
('8C-EC-4B-A3-8E-CA', '192.168.14.244', '2-11', 'Login', 'q'),
('8C-EC-4B-A3-8E-F8', NULL, '2-10', 'Offline', NULL),
('8C-EC-4B-A3-8F-84', NULL, '1-6', 'Offline', NULL),
('8C-EC-4B-A3-8F-AA', NULL, '10-11', 'Offline', NULL),
('8C-EC-4B-A3-8F-E6', NULL, '10-10', 'Offline', NULL),
('8C-EC-4B-A3-8F-ED', NULL, '1-9', 'Offline', NULL),
('8C-EC-4B-A3-90-4F', NULL, '5-8', 'Offline', NULL),
('8C-EC-4B-A3-90-9E', NULL, '2-4', 'Offline', NULL),
('8C-EC-4B-A3-90-B2', NULL, '2-8', 'Offline', NULL),
('8C-EC-4B-A3-90-DA', NULL, '6-4', 'Offline', NULL),
('8C-EC-4B-A3-91-13', NULL, '6-11', 'Offline', NULL),
('8C-EC-4B-A3-91-49', NULL, '5-11', 'Offline', NULL),
('8C-EC-4B-A3-91-97', NULL, '9-5', 'Offline', NULL),
('8C-EC-4B-A3-91-B1', NULL, '6-10', 'Offline', NULL),
('8C-EC-4B-A3-91-B4', NULL, '1-8', 'Offline', NULL),
('8C-EC-4B-A3-91-B5', NULL, '5-5', 'Offline', NULL),
('8C-EC-4B-A3-91-B8', NULL, '9-1', 'Offline', NULL),
('8C-EC-4B-A3-91-D7', NULL, '5-9', 'Offline', NULL),
('8C-EC-4B-A3-91-E0', NULL, '2-9', 'Offline', NULL),
('8C-EC-4B-A3-D9-74', NULL, '10-4', 'Offline', NULL),
('8C-EC-4B-A6-CF-45', NULL, '1-3', 'Offline', NULL),
('8C-EC-4B-A7-0D-2D', NULL, '5-4', 'Offline', NULL),
('8C-EC-4B-A7-0D-AA', NULL, '1-10', 'Offline', NULL),
('8C-EC-4B-A7-77-1D', NULL, '6-3', 'Offline', NULL),
('8C-EC-4B-A7-77-1E', NULL, '1-4', 'Offline', NULL),
('8C-EC-4B-A7-77-27', NULL, '5-6', 'Offline', NULL),
('8C-EC-4B-A7-77-90', NULL, '10-5', 'Offline', NULL),
('8C-EC-4B-A7-77-94', NULL, '10-8', 'Offline', NULL),
('8C-EC-4B-A7-77-95', NULL, '6-6', 'Offline', NULL),
('8C-EC-4B-A7-77-96', NULL, '1-5', 'Offline', NULL),
('8C-EC-4B-A7-77-C5', NULL, '9-10', 'Offline', NULL),
('8C-EC-4B-A7-78-58', NULL, '9-8', 'Offline', NULL),
('8C-EC-4B-A7-78-5B', NULL, '5-3', 'Offline', NULL),
('8C-EC-4B-A7-78-6F', NULL, '9-9', 'Offline', NULL),
('8C-EC-4B-A7-78-78', NULL, '5-10', 'Offline', NULL),
('8C-EC-4B-A7-78-F7', NULL, '2-3', 'Offline', NULL),
('8C-EC-4B-A7-79-01', NULL, '1-11', 'Offline', NULL),
('8C-EC-4B-A7-79-25', NULL, '9-6', 'Offline', NULL),
('8C-EC-4B-A7-79-48', NULL, '6-5', 'Offline', NULL),
('Teacher', NULL, '1-12', 'Teacher', NULL);

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

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `sPassword`, `sFirstname`, `sLastname`, `sFirstLogin`) VALUES
('q', 'q', 'q', 'q', 'No');

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
('ADP', 'pda', 'อัครา', 'ประโยชน์', 'Teacher'),
('aws', '1234', 'อนุสรณ์', 'วงษ์สนิท', 'Teacher'),
('blt', '1234', 'เบญจพร ', 'ลิ้มธรรมาภรณ์', 'Teacher'),
('CHR', 'chr', 'เฉียบวุฒิ', 'รัตนวิไลสกุล', 'Teacher'),
('ens', '1234', 'เอิญ', 'สุริยะฉาย', 'Teacher'),
('gdp', '1234', 'กฤดาภัทร', 'สีหารี', 'Teacher'),
('kab', '1234', 'คันธารัตน์', 'อเนกบุณย์', 'Teacher'),
('ksb', '1234', 'กอบเกียรติ', 'สระอุบล', 'Teacher'),
('lpp', '1234', 'ลือพล', 'พิพานเมฆาภรณ์', 'Teacher'),
('miku', 'm1ku039', 'napachat', 'sujaritchit', 'Admin'),
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
