-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 02:27 AM
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
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `idBanner` int(3) NOT NULL,
  `expiracion` date NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`idBanner`, `expiracion`, `fecha`) VALUES
(1, '2022-03-30', '2022-03-28'),
(2, '2022-04-01', '2022-03-28'),
(3, '2022-04-13', '2022-02-16'),
(4, '2022-04-04', '2022-03-30'),
(5, '2022-03-28', '2022-03-31'),
(6, '2022-03-28', '2022-04-03'),
(7, '2022-03-28', '2022-04-04'),
(8, '2022-03-28', '2022-04-03'),
(9, '2022-03-28', '2022-03-30'),
(10, '2022-03-28', '2022-04-06'),
(11, '2022-03-29', '2022-03-30'),
(12, '2022-03-30', '2022-04-05'),
(13, '2022-03-31', '2022-04-06'),
(14, '2022-04-01', '2022-03-08'),
(15, '2022-04-05', '2022-03-12'),
(16, '2022-04-13', '2022-04-19'),
(17, '2022-03-28', '2022-03-29'),
(18, '2022-03-22', '2022-03-28'),
(19, '2022-03-14', '2022-03-21'),
(20, '2022-02-16', '2022-02-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`idBanner`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
