-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 11:44 PM
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
-- Table structure for table `area_empleado`
--

CREATE TABLE `area_empleado` (
  `idArea` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `area_empleado`
--

INSERT INTO `area_empleado` (`idArea`, `idEmpleado`, `fechaInicio`, `fechaFin`) VALUES
(1, 90995, '2019-02-02', '0000-00-00'),
(1, 90978, '2019-02-03', NULL),
(1, 90987, '2019-02-04', NULL),
(4, 90967, '2019-02-05', NULL),
(1, 90976, '2019-02-06', NULL),
(1, 90954, '2019-02-07', NULL),
(1, 90958, '2019-02-08', NULL),
(1, 90972, '2019-02-09', NULL),
(1, 90961, '2019-02-10', NULL),
(1, 90984, '2019-02-11', NULL),
(2, 90977, '1999-09-25', NULL),
(3, 90421, '2021-02-06', NULL),
(5, 90541, '2019-02-06', NULL),
(6, 40201, '2019-02-06', NULL),
(7, 9092421, '2019-02-05', NULL),
(8, 90521, '2019-02-06', NULL),
(9, 9094287, '2019-02-05', NULL),
(10, 90920, '2020-02-06', NULL),
(5, 90122, '2019-02-06', NULL),
(7, 90155, '2019-02-02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_empleado`
--
ALTER TABLE `area_empleado`
  ADD KEY `idArea` (`idArea`),
  ADD KEY `area_empleado_ibfk_2` (`idEmpleado`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area_empleado`
--
ALTER TABLE `area_empleado`
  ADD CONSTRAINT `area_empleado_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `area_empleado_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
