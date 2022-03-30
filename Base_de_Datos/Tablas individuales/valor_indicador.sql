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
-- Table structure for table `valor_indicador`
--

CREATE TABLE `valor_indicador` (
  `ValorIndicadorID` int(8) NOT NULL,
  `TipoIndicadorID` int(8) NOT NULL,
  `Valor` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `valor_indicador`
--

INSERT INTO `valor_indicador` (`ValorIndicadorID`, `TipoIndicadorID`, `Valor`, `fecha`) VALUES
(1, 1, '78', '2021-09-21'),
(2, 1, '78', '2021-10-21'),
(3, 1, '74', '2021-11-21'),
(4, 1, '77', '2021-12-21'),
(5, 1, '76', '2022-02-21'),
(6, 2, 'ADM 78\r\nOPE 61', '2021-10-21'),
(7, 3, '5456\r\n', '2021-09-21'),
(8, 3, '5756\r\n', '2021-10-21'),
(9, 3, '5637\r\n', '2021-11-21'),
(10, 3, '5947\r\n', '2021-12-21'),
(11, 3, '5583\r\n', '2022-01-21'),
(12, 3, '5318\r\n', '2022-02-21'),
(13, 4, '57 Hombres\r\n43 Mujeres\r\n\r\n', '2021-09-21'),
(14, 4, '57 Hombres\r\n43 Mujeres', '2021-10-21'),
(15, 4, '56 Hombres\r\n44 Mujeres\r\n', '2021-11-21'),
(16, 4, '56 Hombres\r\n44 Mujeres\r\n', '2021-12-21'),
(17, 4, '55 Hombres\r\n45 Mujeres', '2022-01-21'),
(18, 4, '55 Hombres\r\n45 Mujeres', '2022-02-22'),
(19, 2, 'ADM 80\r\nOPE 60', '2021-11-21'),
(20, 2, 'ADM 60\r\nOPE 40', '2021-12-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `valor_indicador`
--
ALTER TABLE `valor_indicador`
  ADD PRIMARY KEY (`ValorIndicadorID`),
  ADD KEY `valor_indicador_ibfk_1` (`TipoIndicadorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `valor_indicador`
--
ALTER TABLE `valor_indicador`
  MODIFY `ValorIndicadorID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `valor_indicador`
--
ALTER TABLE `valor_indicador`
  ADD CONSTRAINT `valor_indicador_ibfk_1` FOREIGN KEY (`TipoIndicadorID`) REFERENCES `tipo_indicador` (`TipoIndicadorID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
