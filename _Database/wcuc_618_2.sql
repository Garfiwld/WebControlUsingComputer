-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 09:42 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
('10-E7-C6-3E-08-7D', NULL, '8-3', 'Offline', NULL),
('10-E7-C6-3E-08-BE', NULL, '1-1', 'Offline', NULL),
('10-E7-C6-3E-08-E3', NULL, '5-1', 'Offline', NULL),
('10-E7-C6-3E-08-E7', NULL, '5-7', 'Offline', NULL),
('10-E7-C6-3E-08-F6', NULL, '11-3', 'Offline', NULL),
('10-E7-C6-3E-08-FE', NULL, '4-3', 'Offline', NULL),
('10-E7-C6-3E-09-0B', NULL, '5-3', 'Offline', NULL),
('10-E7-C6-3E-09-13', NULL, '1-7', 'Offline', NULL),
('10-E7-C6-3E-09-8A', NULL, '10-3', 'Offline', NULL),
('10-E7-C6-3E-09-91', NULL, '7-9', 'Offline', NULL),
('10-E7-C6-3E-09-96', NULL, '7-3', 'Offline', NULL),
('10-E7-C6-3E-09-AE', NULL, '2-3', 'Offline', NULL),
('10-E7-C6-3E-09-B4', NULL, '7-7', 'Offline', NULL),
('10-E7-C6-3E-10-06', NULL, '2-5', 'Offline', NULL),
('10-E7-C6-3E-10-1F', NULL, '1-9', 'Offline', NULL),
('10-E7-C6-3E-10-2C', NULL, '2-9', 'Offline', NULL),
('10-E7-C6-3E-10-30', NULL, '10-9', 'Offline', NULL),
('10-E7-C6-3E-10-39', NULL, '2-1', 'Offline', NULL),
('10-E7-C6-3E-10-3C', NULL, '10-1', 'Offline', NULL),
('10-E7-C6-3E-10-45', NULL, '7-5', 'Offline', NULL),
('10-E7-C6-3E-10-4A', NULL, '8-1', 'Offline', NULL),
('10-E7-C6-3E-10-4B', NULL, '10-7', 'Offline', NULL),
('10-E7-C6-3E-10-4F', NULL, '4-7', 'Offline', NULL),
('10-E7-C6-3E-10-50', NULL, '11-7', 'Offline', NULL),
('10-E7-C6-3E-10-54', NULL, '10-5', 'Offline', NULL),
('10-E7-C6-3E-10-E0', NULL, '1-5', 'Offline', NULL),
('10-E7-C6-3E-10-E5', NULL, '11-1', 'Offline', NULL),
('10-E7-C6-3E-10-E6', NULL, '2-7', 'Offline', NULL),
('10-E7-C6-3E-10-E8', NULL, '7-1', 'Offline', NULL),
('10-E7-C6-3E-10-E9', NULL, '11-9', 'Offline', NULL),
('10-E7-C6-3E-10-EE', NULL, '11-5', 'Offline', NULL),
('10-E7-C6-3E-11-76', NULL, '4-5', 'Offline', NULL),
('10-E7-C6-3E-11-79', NULL, '8-9', 'Offline', NULL),
('10-E7-C6-3E-11-7C', NULL, '1-3', 'Offline', NULL),
('10-E7-C6-3E-11-82', NULL, '5-5', 'Offline', NULL),
('10-E7-C6-3E-11-90', NULL, '4-1', 'Offline', NULL),
('10-E7-C6-3E-11-9D', NULL, '8-7', 'Offline', NULL),
('10-E7-C6-3E-11-A6', NULL, '4-9', 'Offline', NULL),
('10-E7-C6-3E-11-A8', NULL, '5-9', 'Offline', NULL),
('Teacher', NULL, '11-11', 'Teacher', NULL);

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
