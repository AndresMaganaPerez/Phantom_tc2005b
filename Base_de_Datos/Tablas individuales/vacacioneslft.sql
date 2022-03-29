-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2022 a las 19:33:35
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_natgas_phantom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacacioneslft`
--

CREATE TABLE `vacacioneslft` (
  `idVacacionesLFT` int(8) NOT NULL,
  `diasCorrespondientes` int(2) NOT NULL,
  `añoInicio` int(4) NOT NULL,
  `añoFin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `vacacioneslft`
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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  ADD PRIMARY KEY (`idVacacionesLFT`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  MODIFY `idVacacionesLFT` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
