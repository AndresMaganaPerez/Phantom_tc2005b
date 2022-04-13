-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 11:52 PM
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
-- Table structure for table `solicitudvacaciones`
--

CREATE TABLE `solicitudvacaciones` (
  `idSolicitud` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `fechaReanudacion` date NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `solicitudAceptadaEstatus` tinyint(1) DEFAULT NULL,
  `Nota` text COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `solicitudvacaciones`
--

INSERT INTO `solicitudvacaciones` (`idSolicitud`, `idEmpleado`, `fechaInicio`, `fechaFin`, `fechaReanudacion`, `fechaSolicitud`, `solicitudAceptadaEstatus`, `Nota`) VALUES
(1, 90954, '2022-04-15', '2022-04-19', '2022-04-20', '2022-03-29', NULL, NULL),
(2, 90521, '2022-05-10', '2022-05-14', '2022-05-16', '2022-03-29', NULL, NULL),
(3, 90421, '2022-02-08', '2022-03-11', '2022-03-14', '2022-02-03', NULL, NULL),
(4, 90977, '2022-01-11', '2022-03-13', '2022-03-14', '2022-02-28', NULL, NULL),
(5, 90920, '2022-07-02', '2022-07-08', '2022-07-11', '2022-03-29', NULL, NULL),
(6, 90995, '2022-03-30', '2022-04-04', '2022-04-05', '2022-03-22', NULL, NULL),
(7, 9094287, '2021-12-24', '2022-01-02', '2022-01-03', '2021-12-18', NULL, NULL),
(8, 90976, '2022-04-01', '2022-04-04', '2022-04-05', '2022-03-31', NULL, NULL),
(9, 90978, '2022-04-11', '2022-03-18', '2022-03-21', '2022-03-29', NULL, NULL),
(10, 90155, '2022-04-25', '2022-04-29', '2022-05-02', '2022-03-29', NULL, NULL),
(11, 90954, '2022-03-02', '2022-03-04', '2022-03-07', '2022-03-01', 1, NULL),
(12, 90421, '2022-01-03', '2022-01-07', '2022-01-10', '2021-12-30', 1, NULL),
(13, 90920, '2022-02-17', '2022-02-21', '2022-02-22', '2022-02-14', NULL, NULL),
(14, 90995, '2022-01-21', '2022-01-24', '2022-01-25', '2022-01-19', 1, NULL),
(15, 90976, '2022-03-30', '2022-04-04', '2022-04-05', '2022-03-29', NULL, NULL),
(16, 90961, '2022-02-14', '2022-02-16', '2022-02-17', '2022-02-01', 1, NULL),
(17, 90984, '2022-04-08', '2022-04-11', '2022-04-12', '2022-03-30', NULL, NULL),
(18, 90987, '2021-12-16', '2021-12-21', '2021-12-22', '2021-12-13', 0, 'No hay suplentes disponibles'),
(19, 90972, '2022-02-21', '2022-02-22', '2022-02-23', '2022-02-18', NULL, NULL),
(20, 90122, '2022-01-28', '2022-01-28', '2022-01-31', '2022-01-24', NULL, NULL),
(21, 90961, '2021-03-07', '2021-03-14', '2021-03-15', '2021-03-01', 1, ''),
(22, 90521, '2021-03-10', '2021-03-16', '2021-03-18', '2021-03-04', 1, ''),
(23, 90421, '2021-06-09', '2021-06-15', '2021-06-17', '2021-06-06', 1, ''),
(24, 90521, '2021-03-10', '2021-03-16', '2021-03-18', '2021-03-04', 1, ''),
(25, 90920, '2021-04-10', '2021-04-15', '2021-04-16', '2021-04-03', 1, ''),
(26, 90155, '2022-02-02', '2022-02-08', '2022-02-10', '2022-01-30', 1, ''),
(27, 90920, '2021-04-10', '2021-04-15', '2021-04-16', '2021-04-03', 1, ''),
(28, 90155, '2022-02-02', '2022-02-08', '2022-02-10', '2022-01-30', 1, ''),
(29, 90541, '2021-03-20', '2021-03-26', '2021-03-27', '2021-03-15', 1, ''),
(30, 90972, '2021-07-08', '2021-07-14', '2021-07-15', '2021-07-02', 1, ''),
(31, 90421, '2022-05-09', '2022-05-16', '2022-05-17', '2022-03-29', NULL, NULL),
(32, 90977, '2022-06-22', '2022-06-29', '2022-06-30', '2022-03-29', NULL, NULL),
(33, 9092421, '2021-12-13', '2021-12-17', '2021-12-20', '2021-12-08', NULL, NULL),
(34, 9094287, '2022-04-04', '2022-04-08', '2022-04-11', '2022-03-29', NULL, NULL),
(35, 90967, '2022-03-30', '2022-04-06', '2022-04-07', '2022-03-22', NULL, NULL),
(36, 90976, '2022-04-12', '2022-04-19', '2022-04-20', '2022-03-29', NULL, NULL),
(37, 90976, '2022-05-12', '2022-05-16', '2022-05-17', '2022-03-30', NULL, NULL),
(38, 90984, '2022-03-08', '2022-03-15', '2022-03-16', '2022-03-01', NULL, NULL),
(39, 90920, '2022-05-11', '2022-05-18', '2022-05-19', '2022-03-29', NULL, NULL),
(40, 90978, '2022-03-29', '2022-04-04', '2022-04-05', '2022-03-22', NULL, NULL),
(41, 90521, '2022-02-14', '2022-02-14', '2022-02-15', '2022-02-11', 1, NULL),
(42, 90977, '2022-01-12', '2022-01-12', '2022-01-13', '2022-01-10', 1, NULL),
(43, 90541, '2022-03-18', '2022-03-25', '2022-03-28', '2022-03-01', NULL, NULL),
(44, 40201, '2022-02-28', '2022-03-02', '2022-03-03', '2022-02-23', NULL, NULL),
(45, 90958, '2022-01-19', '2022-01-21', '2022-01-24', '2022-01-17', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  MODIFY `idSolicitud` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  ADD CONSTRAINT `solicitudvacaciones_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
