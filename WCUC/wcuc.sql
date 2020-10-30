-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2020 at 05:00 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

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
  `MacAddress` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `IPv4` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SeatID` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cStatus` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offline',
  `StudentID` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `computer`
--

INSERT INTO `computer` (`MacAddress`, `IPv4`, `SeatID`, `cStatus`, `StudentID`) VALUES
('0', NULL, '1-1', 'Offline', NULL),
('08-00-27-1E-D2-65', NULL, '4-1', 'Offline', NULL),
('08-00-27-DD-A8-15', NULL, '5-1', 'Offline', NULL),
('0A-00-27-00-00-05', NULL, NULL, 'Offline', NULL),
('0A-00-27-00-00-06', NULL, NULL, 'Offline', NULL),
('1', NULL, '2-1', 'Offline', NULL),
('10', NULL, '1-3', 'Offline', NULL),
('11', NULL, '2-3', 'Offline', NULL),
('12', NULL, '1-5', 'Offline', NULL),
('13', NULL, '2-5', 'Offline', NULL),
('14', NULL, '1-7', 'Offline', NULL),
('15', NULL, '1-9', 'Offline', NULL),
('16', NULL, '2-7', 'Offline', NULL),
('17', NULL, '2-9', 'Offline', NULL),
('18', NULL, '4-3', 'Offline', NULL),
('19', NULL, '4-5', 'Offline', NULL),
('2', NULL, '5-3', 'Offline', NULL),
('20', NULL, '4-7', 'Offline', NULL),
('21', NULL, '4-9', 'Offline', NULL),
('22', NULL, '5-5', 'Offline', NULL),
('23', NULL, '5-9', 'Offline', NULL),
('24', NULL, '5-7', 'Offline', NULL),
('25', NULL, '7-1', 'Offline', NULL),
('26', NULL, NULL, 'Offline', NULL),
('27', NULL, '7-3', 'Offline', NULL),
('28', NULL, '8-3', 'Offline', NULL),
('29', NULL, '7-5', 'Offline', NULL),
('3', NULL, '8-5', 'Offline', NULL),
('30', NULL, '7-7', 'Offline', NULL),
('31', NULL, '8-7', 'Offline', NULL),
('32', NULL, '7-9', 'Offline', NULL),
('33', NULL, '8-9', 'Offline', NULL),
('34', NULL, NULL, 'Offline', NULL),
('35', NULL, NULL, 'Offline', NULL),
('36', NULL, '10-3', 'Offline', NULL),
('37', NULL, '11-3', 'Offline', NULL),
('38', NULL, '10-5', 'Offline', NULL),
('39', NULL, '11-5', 'Offline', NULL),
('4', NULL, '10-7', 'Offline', NULL),
('40', NULL, '11-7', 'Offline', NULL),
('41', NULL, '10-9', 'Offline', NULL),
('42', NULL, '11-9', 'Offline', NULL),
('43', NULL, '4-11', 'Offline', NULL),
('44', NULL, '7-11', 'Offline', NULL),
('45', NULL, '8-11', 'Offline', NULL),
('46', NULL, NULL, 'Offline', NULL),
('47', NULL, NULL, 'Offline', NULL),
('48', NULL, NULL, 'Offline', NULL),
('49', NULL, NULL, 'Offline', NULL),
('5', NULL, NULL, 'Offline', NULL),
('50', NULL, NULL, 'Offline', NULL),
('51', NULL, NULL, 'Offline', NULL),
('52', NULL, NULL, 'Offline', NULL),
('53', NULL, NULL, 'Offline', NULL),
('54', NULL, NULL, 'Offline', NULL),
('55', NULL, NULL, 'Offline', NULL),
('56', NULL, NULL, 'Offline', NULL),
('57', NULL, NULL, 'Offline', NULL),
('58', NULL, NULL, 'Offline', NULL),
('59', NULL, NULL, 'Offline', NULL),
('6', NULL, NULL, 'Offline', NULL),
('7', NULL, NULL, 'Offline', NULL),
('8', NULL, NULL, 'Offline', NULL),
('9', NULL, NULL, 'Offline', NULL),
('C4-34-6B-62-A7-6D', NULL, '10-1', 'Offline', NULL),
('C4-34-6B-63-25-49', NULL, '11-1', 'Offline', NULL),
('C4-34-6B-63-25-4B', NULL, '8-1', 'Offline', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `sPassword` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sFirstname` text COLLATE utf8_unicode_ci NOT NULL,
  `sLastname` text COLLATE utf8_unicode_ci NOT NULL,
  `sFirstLogin` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `sPassword`, `sFirstname`, `sLastname`, `sFirstLogin`) VALUES
('1', '1', 'สาธร', 'โพธิ์พันธุ์', 'No'),
('2', 'x', 'xxx', 'yyy', 'No'),
('6304062636014', '6304062636014', 'กวินธิดา', 'ตะวันธรงค์', 'Yes'),
('6304062636022', '6304062636022', 'กวิภัฎ', 'แสนสม', 'Yes'),
('6304062636031', '6304062636031', 'กิตติยา', 'แดงประภา', 'Yes'),
('6304062636049', '6304062636049', 'คุณนนท์', 'ลิ่มสุวรรณ์', 'Yes'),
('6304062636057', '6304062636057', 'จักรพงษ์', 'บุญเงิน', 'Yes'),
('6304062636065', '6304062636065', 'จิรายุส', 'หลวงนา', 'Yes'),
('6304062636073', '6304062636073', 'จิราวัฒน์', 'ลีวัฒนะ', 'Yes'),
('6304062636081', '6304062636081', 'จุฑารัตน์', 'ลิ่มกองลาภ', 'Yes'),
('6304062636090', '6304062636090', 'จุลพงศ์', 'เทพจันทร์', 'Yes'),
('6304062636103', '6304062636103', 'ชนินทร์', 'สิริโรจนากร', 'Yes'),
('6304062636111', '6304062636111', 'ชาญวิทย์', 'จันทร์ทิพย์', 'Yes'),
('6304062636120', '6304062636120', 'ทรงธรรม', 'คงสมปราชญ์', 'Yes'),
('6304062636138', '6304062636138', 'ทศวรรษ', 'พูลสวัสดิ์', 'Yes'),
('6304062636146', '6304062636146', 'ธนพล', 'สิงห์สถิตย์', 'Yes'),
('6304062636154', '6304062636154', 'ธนวัฒน์', 'ประดิษฐ์ดวง', 'Yes'),
('6304062636171', '6304062636171', 'ปริภาดา', 'จิตตจารุ', 'Yes'),
('6304062636189', '6304062636189', 'ปริยวิศว์', 'เมืองกุลนันท์', 'Yes'),
('6304062636197', '6304062636197', 'ปารมี', 'พันธุ์เสือ', 'Yes'),
('6304062636201', '6304062636201', 'ปิยวัฒน์', 'ต๋าอ่อน', 'Yes'),
('6304062636219', '6304062636219', 'พงศภัค', 'นิลเพชร', 'Yes'),
('6304062636227', '6304062636227', 'ภรัณยู', 'โสภณกิตติกุลชัย', 'Yes'),
('6304062636235', '6304062636235', 'ภานุพงศ์', 'ปุญเขตต์', 'Yes'),
('6304062636243', '6304062636243', 'ภูมิ', 'ภูมี', 'Yes'),
('6304062636251', '6304062636251', 'ภูมิชนก', 'ฉายานนท์', 'Yes'),
('6304062636260', '6304062636260', 'ยศศรัณย์', 'ยศกันโท', 'Yes'),
('6304062636278', '6304062636278', 'รุ่งกานต์', 'แสงนวล', 'Yes'),
('6304062636286', '6304062636286', 'ศุภศิษฏ์', 'ชินสา', 'Yes'),
('6304062636308', '6304062636308', 'สิรภัทร', 'ซอพรมราช', 'Yes'),
('6304062636316', '6304062636316', 'สุประวีณ์', 'ลู่พรธนพัฒน์', 'Yes'),
('6304062636324', '6304062636324', 'อดิศักดิ์', 'คำสมบัติ', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TeacherID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `tPassword` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tFirstname` text COLLATE utf8_unicode_ci NOT NULL,
  `tLastname` text COLLATE utf8_unicode_ci NOT NULL,
  `tRole` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`TeacherID`, `tPassword`, `tFirstname`, `tLastname`, `tRole`) VALUES
('AAAAA', 'AAAAA', 'AAAAA', 'AAAAA', 'Teacher'),
('AAAAAwqre', 'AAAAA', 'AAAAA', 'AAAAA', 'Teacher'),
('ADMIN', '$at0m', 'สาธร', 'โพธิ์พันธุ์', 'Admin'),
('adp', 'adp', 'adp', 'adp', 'Teacher'),
('asdf', 'asdf', 'asdf555', 'asdf', 'Teacher'),
('ffffffffffff', 'dffdf', 'df', 'df', 'Teacher'),
('QQQQQQQ', 'AAAAA', 'AAAAA', 'AAAAA', 'Teacher');

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
