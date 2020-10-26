-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2020 at 07:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

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
('26', NULL, '8-1', 'Offline', NULL),
('27', NULL, '7-3', 'Offline', NULL),
('28', NULL, '8-3', 'Offline', NULL),
('29', NULL, '7-5', 'Offline', NULL),
('3', NULL, '8-5', 'Offline', NULL),
('30', NULL, '7-7', 'Offline', NULL),
('31', NULL, '8-7', 'Offline', NULL),
('32', NULL, '7-9', 'Offline', NULL),
('33', NULL, '8-9', 'Offline', NULL),
('34', NULL, '10-1', 'Offline', NULL),
('35', NULL, '11-1', 'Offline', NULL),
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
('9', NULL, NULL, 'Offline', NULL);

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
('2', '2', 'xxx', 'yyy', 'No'),
('6204062636040', '6204062636040', 'จีรพัฒน์', 'ราศรีชัย', 'Yes'),
('6304062616013', '6304062616013', 'กริน', 'นนทจิตต์', 'Yes'),
('6304062616021', '6304062616021', 'กฤติน', 'พรหมสิรินิมิต', 'Yes'),
('6304062616030', '6304062616030', 'กฤษดากร', 'ศรีบรรจง', 'Yes'),
('6304062616048', '6304062616048', 'จตุรภัทร', 'ศรัณย์วิริยะพงศ์', 'Yes'),
('6304062616056', '6304062616056', 'จิราภา', 'ห้วงยศ', 'Yes'),
('6304062616064', '6304062616064', 'จุลนพภ์', 'ขำเสถียร', 'Yes'),
('6304062616072', '6304062616072', 'จุฬารัตน์', 'บุญจันทร์', 'Yes'),
('6304062616081', '6304062616081', 'ชัญญา', 'ทรงเสรีย์', 'Yes'),
('6304062616099', '6304062616099', 'เตชินี', 'คำเพ็ง', 'Yes'),
('6304062616102', '6304062616102', 'ธนกฤต', 'ดีพาชู', 'Yes'),
('6304062616111', '6304062616111', 'ธนภูมิ', 'ศิริพันธ์', 'Yes'),
('6304062616129', '6304062616129', 'ธวัชชัย', 'เกิดสมบูรณ์', 'Yes'),
('6304062616137', '6304062616137', 'นภัสสร', 'สิงห์ทอน', 'Yes'),
('6304062616145', '6304062616145', 'นิชานันท์', 'สุขพันธ์', 'Yes'),
('6304062616153', '6304062616153', 'เบญญาภา', 'ชวเจริญพันธ์', 'Yes'),
('6304062616161', '6304062616161', 'ปกเกล้า', 'ศรีนอม', 'Yes'),
('6304062616170', '6304062616170', 'ปรมี', 'ศรีสมทรัพย์', 'Yes'),
('6304062616188', '6304062616188', 'ปิยวรรณ', 'แปงนุจา', 'Yes'),
('6304062616196', '6304062616196', 'ปุณยภา', 'แต้อวง', 'Yes'),
('6304062616200', '6304062616200', 'พชร', 'เขียวสอาด', 'Yes'),
('6304062616218', '6304062616218', 'พลวัตร', 'ดิษฐ์ป้าน', 'Yes'),
('6304062616226', '6304062616226', 'พีรวุฒิ', 'เขียวน้อย', 'Yes'),
('6304062616234', '6304062616234', 'ภควิชญ์', 'จันทร์จร', 'Yes'),
('6304062616242', '6304062616242', 'ภัทรกร', 'กิตติวรปัญญา', 'Yes'),
('6304062616251', '6304062616251', 'วรพล', 'บุญลือพันธ์', 'Yes'),
('6304062616269', '6304062616269', 'ศุภชัย', 'สุวรรณสิงห์', 'Yes'),
('6304062616285', '6304062616285', 'สุวิจักขณ์', 'วิตตินานนท์', 'Yes'),
('6304062616293', '6304062616293', 'อนพัทย์', 'หมั่นการนา', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TeacherID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
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
('ADMIN', '$at0m', 'สาธร', 'โพธิ์พันธุ์', 'Admin');

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
