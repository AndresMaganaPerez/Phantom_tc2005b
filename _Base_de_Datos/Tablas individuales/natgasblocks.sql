-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 11:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_natgas_phantom`
--

-- --------------------------------------------------------

--
-- Table structure for table `natgasblocks`
--

CREATE TABLE `natgasblocks` (
  `idNatgasBlocks` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaSolicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `natgasblocks`
--

INSERT INTO `natgasblocks` (`idNatgasBlocks`, `idEmpleado`, `fechaSolicitud`) VALUES
(1, 90967, '2022-02-09'),
(2, 90521, '2022-03-30'),
(3, 90958, '2022-03-31'),
(4, 90541, '2022-04-06'),
(5, 9092421, '2022-02-22'),
(6, 90995, '2022-02-20'),
(7, 90972, '2022-03-21'),
(8, 40201, '2022-02-18'),
(9, 9094287, '2022-04-14'),
(10, 90967, '2022-02-15'),
(11, 90987, '2022-03-03'),
(12, 90977, '2022-03-01'),
(13, 90961, '2022-01-18'),
(14, 90954, '2022-03-22'),
(15, 90421, '2022-03-28'),
(16, 90972, '2022-03-11'),
(17, 90122, '2022-01-07'),
(18, 90987, '2022-01-10'),
(19, 90976, '2022-03-31'),
(20, 90155, '2022-01-26'),
(31, 90961, '2022-03-29'),
(32, 90972, '2022-03-08'),
(33, 90122, '2022-03-22'),
(34, 90421, '2022-04-22'),
(35, 90977, '2022-04-21'),
(36, 90976, '2022-05-11'),
(37, 90984, '2022-05-18'),
(38, 90521, '2022-04-06'),
(39, 90995, '2022-05-11'),
(40, 90541, '2022-06-15'),
(41, 9094287, '2022-03-16'),
(42, 90421, '2022-01-19'),
(43, 90122, '2022-02-03'),
(44, 9092421, '2022-03-15'),
(45, 90541, '2022-03-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `natgasblocks`
--
ALTER TABLE `natgasblocks`
  ADD PRIMARY KEY (`idNatgasBlocks`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `natgasblocks`
--
ALTER TABLE `natgasblocks`
  MODIFY `idNatgasBlocks` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `natgasblocks`
--
ALTER TABLE `natgasblocks`
  ADD CONSTRAINT `natgasblocks_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
