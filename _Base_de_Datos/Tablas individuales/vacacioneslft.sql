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
-- Table structure for table `vacacioneslft`
--

CREATE TABLE `vacacioneslft` (
  `idVacacionesLFT` int(8) NOT NULL,
  `diasCorrespondientes` int(2) NOT NULL,
  `añoInicio` int(4) NOT NULL,
  `añoFin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `vacacioneslft`
--

INSERT INTO `vacacioneslft` (`idVacacionesLFT`, `diasCorrespondientes`, `añoInicio`, `añoFin`) VALUES
(1, 8, 0, 1),
(2, 10, 1, 2),
(3, 12, 2, 3),
(4, 14, 3, 4),
(5, 16, 4, 5),
(6, 18, 5, 6),
(7, 20, 6, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  ADD PRIMARY KEY (`idVacacionesLFT`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  MODIFY `idVacacionesLFT` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
