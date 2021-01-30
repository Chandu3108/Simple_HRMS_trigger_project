-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 04:30 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms_proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEP_ID` int(3) NOT NULL,
  `DEP_NAME` varchar(20) NOT NULL,
  `MGR_SSN` int(5) NOT NULL,
  `EMP_NEED` int(2) NOT NULL,
  `EMP_AVAIL` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DEP_ID`, `DEP_NAME`, `MGR_SSN`, `EMP_NEED`, `EMP_AVAIL`) VALUES
(10, 'SALES', 11155, 20, 10),
(20, 'MARKETING', 11160, 20, 15),
(30, 'ACCOUNTS', 11165, 40, 15),
(40, 'RESEARCH', 11170, 20, 20),
(50, 'DEVELOPMENT', 11175, 30, 18),
(60, 'CLEANING', 11180, 25, 16),
(70, 'ADMIN', 11185, 20, 15);

--
-- Triggers `department`
--
DELIMITER $$
CREATE TRIGGER `job_avail` AFTER UPDATE ON `department` FOR EACH ROW UPDATE vacancy INNER JOIN department
ON vacancy.DEP_ID=department.DEP_ID
SET vacancy.VACANCIES = department.EMP_NEED-department.EMP_AVAIL
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` int(5) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `COUNTRY` varchar(15) NOT NULL,
  `MGR_SSN` int(5) NOT NULL,
  `DEP_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `NAME`, `EMAIL`, `COUNTRY`, `MGR_SSN`, `DEP_ID`) VALUES
(11151, 'MOHIT', 'MOHIT@GMAIL', 'INDIA', 11155, 10),
(11153, 'RAM', 'RAM@GMAIL', 'INDIA', 11160, 20),
(11155, 'ROHIT', 'ROHIT@GMAIL', 'NEPAL', 11155, 10),
(11161, 'SHAM', 'SHAM@GMAIL', 'INDIA', 11160, 20),
(11162, 'RAHUL', 'RAHUL@GMAIL', 'UK', 11160, 20),
(11163, 'VIRAT', 'VIRAT@GMAIL', 'SRI LANK', 11170, 40),
(11164, 'SHEELA', 'SHEELA@GMAIL', 'INDIA', 11175, 50),
(11165, 'ROOPA', 'ROOPA@GMAIL', 'US', 11165, 30),
(11171, 'ROOMA', 'ROOMA@GMAIL', 'NEPAL', 11180, 60),
(11172, 'KRISHNA', 'KRISHNA@GMAIL', 'NEPAL', 11155, 10),
(11180, 'ertyui', 'ertyui@gmail.com', 'SRILANKA', 11171, 20),
(11190, 'dfgh', 'fghj@gmail.com', 'india', 11170, 70),
(11191, 'CHANDU', 'CHANDU@GMAIL', 'INDIA', 11180, 10);

-- --------------------------------------------------------

--
-- Table structure for table `payclip`
--

CREATE TABLE `payclip` (
  `PF_ID` int(3) NOT NULL,
  `SSN` int(5) NOT NULL,
  `TOTAL_PAY` int(6) NOT NULL,
  `BASIC_PAY` int(6) NOT NULL,
  `PF` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payclip`
--

INSERT INTO `payclip` (`PF_ID`, `SSN`, `TOTAL_PAY`, `BASIC_PAY`, `PF`) VALUES
(1, 11151, 20000, 10000, 1000),
(2, 11155, 40000, 25000, 2500),
(3, 11153, 50000, 40000, 4000),
(4, 11161, 50000, 40000, 4000),
(5, 11162, 100000, 85000, 8500),
(6, 11163, 200000, 130000, 13000),
(7, 11164, 50000, 35000, 3500),
(80, 11165, 50000, 35000, 3500),
(90, 11171, 20000, 15000, 1500),
(100, 11172, 40000, 20000, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `PROJ_ID` int(5) NOT NULL,
  `SSN` int(5) NOT NULL,
  `PROJ_NAME` varchar(20) NOT NULL,
  `MGR_SSN` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PROJ_ID`, `SSN`, `PROJ_NAME`, `MGR_SSN`) VALUES
(22201, 11153, 'SPENDING_ANALYSIS', 11153),
(22202, 11161, 'EARNING_ANALYSIS', 11153),
(22203, 11163, 'OPERATOR', 11163),
(22204, 11172, 'TRANSLATOR', 11163),
(22206, 11164, 'SOCIAL_CIRCLE', 11164),
(22208, 11171, 'TEXT_VOICE', 11180);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `SSN` int(5) NOT NULL,
  `WORK_STAR` int(2) NOT NULL,
  `TIME_STAR` int(2) NOT NULL,
  `EMP_DES` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`SSN`, `WORK_STAR`, `TIME_STAR`, `EMP_DES`) VALUES
(11151, 7, 8, 'SMALL GROWTH'),
(11153, 9, 8, 'PERFORMER'),
(11155, 7, 8, 'SMALL GROWTH'),
(11161, 6, 7, 'AVERAGE'),
(11162, 8, 9, 'PERFORMER'),
(11163, 5, 6, 'NO GROWTH'),
(11164, 8, 7, 'SMALL GROWTH'),
(11165, 6, 8, 'AVERAGE');

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `DEP_ID` int(5) NOT NULL,
  `D_NAME` varchar(15) NOT NULL,
  `VACANCIES` int(3) NOT NULL,
  `CRITERIA` varchar(15) NOT NULL,
  `QUALIFICATION` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacancy`
--

INSERT INTO `vacancy` (`DEP_ID`, `D_NAME`, `VACANCIES`, `CRITERIA`, `QUALIFICATION`) VALUES
(30, 'ACCOUNTS', 25, '2+ YEARS', 'MBA'),
(70, 'ADMIN', 5, '0+ YEARS', 'MBA'),
(60, 'CLEANING', 9, '0+ YEARS', 'SCHOOLING'),
(50, 'DEVELOPMENT', 12, '0+ YEARS', 'M.TECH'),
(20, 'MARKETING', 5, '2+ YEARS', 'MBA'),
(40, 'RESEARCH', 0, '5+ YEARS', 'PHD'),
(10, 'SALES', 10, '3+ YEARS', 'MBA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEP_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `DEP_ID` (`DEP_ID`);

--
-- Indexes for table `payclip`
--
ALTER TABLE `payclip`
  ADD PRIMARY KEY (`PF_ID`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PROJ_ID`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`D_NAME`),
  ADD KEY `DEP_ID` (`DEP_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DEP_ID`) REFERENCES `department` (`DEP_ID`);

--
-- Constraints for table `payclip`
--
ALTER TABLE `payclip`
  ADD CONSTRAINT `payclip_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `vacancy_ibfk_1` FOREIGN KEY (`DEP_ID`) REFERENCES `department` (`DEP_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
