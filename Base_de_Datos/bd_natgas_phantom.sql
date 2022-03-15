-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2022 a las 17:58:55
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `phantom_natgas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(3) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidoMaterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidoPaterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `noTelefono` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `IdAnuncios` int(3) NOT NULL,
  `Fecha` date NOT NULL,
  `Titulo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Pin` tinyint(1) NOT NULL,
  `expiracion` date NOT NULL,
  `texto` text COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios_recurso_digital`
--

CREATE TABLE `anuncios_recurso_digital` (
  `idAnuncios` int(3) NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idArea` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_empleado`
--

CREATE TABLE `area_empleado` (
  `idArea` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `idBanner` int(3) NOT NULL,
  `expiracion` date NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners_recurso_digital`
--

CREATE TABLE `banners_recurso_digital` (
  `idBanner` int(3) NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dirige`
--

CREATE TABLE `dirige` (
  `idOperador` int(11) NOT NULL,
  `idLider` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dirige`
--

INSERT INTO `dirige` (`idOperador`, `idLider`, `fechaInicio`, `fechaFin`) VALUES
(2, 1, '2022-03-01', '2022-03-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(8) NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidoPaterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidoMaterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaNac` date NOT NULL,
  `fechaIngr` date NOT NULL,
  `numTelefonico` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidadNatgasBlocks` int(1) NOT NULL,
  `antigüedad` int(2) NOT NULL,
  `vacacionesTotales` int(2) NOT NULL,
  `numVacacionesLey` int(2) NOT NULL,
  `numVacacionesPremio` int(2) NOT NULL,
  `plaza` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `email`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fechaNac`, `fechaIngr`, `numTelefonico`, `cantidadNatgasBlocks`, `antigüedad`, `vacacionesTotales`, `numVacacionesLey`, `numVacacionesPremio`, `plaza`) VALUES
(1, 'changito@natgas.com', 'Pablo', 'Figueroa', 'Rodríguez', '2022-03-01', '2022-03-15', '4431987622', 0, 1, 8, 6, 2, 'Querétaro'),
(2, 'vaquita@natgas.mx', 'Daniela', 'Ramirez', 'López', '2016-03-15', '2030-03-28', '4432778855', 3, 5, 19, 15, 1, 'CDMX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_rol`
--

CREATE TABLE `empleado_rol` (
  `idEmpleado` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador`
--

CREATE TABLE `indicador` (
  `idIndicador` int(8) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `valor` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaIndicador` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `natgasblocks`
--

CREATE TABLE `natgasblocks` (
  `idNatgasBlocks` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaSolicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `accion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_digital`
--

CREATE TABLE `recurso_digital` (
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(3) NOT NULL,
  `descripcionRol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `idRol` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudvacaciones`
--

CREATE TABLE `solicitudvacaciones` (
  `idSolicitud` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `fechaReanudacion` date NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `solicitudAceptadaEstatus` tinyint(1) NOT NULL,
  `Nota` text COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suple`
--

CREATE TABLE `suple` (
  `idEmpleado` int(11) NOT NULL,
  `idSolicitud` int(11) NOT NULL,
  `fechaInicioSuplente` date NOT NULL,
  `fechaFinSuplente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacacioneslft`
--

CREATE TABLE `vacacioneslft` (
  `idVacacionesLFT` int(8) NOT NULL,
  `diasCorrespondientes` int(2) NOT NULL,
  `añoInicio` year(4) NOT NULL,
  `añoFin` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`IdAnuncios`);

--
-- Indices de la tabla `anuncios_recurso_digital`
--
ALTER TABLE `anuncios_recurso_digital`
  ADD KEY `idAnuncios` (`idAnuncios`),
  ADD KEY `url` (`url`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `area_empleado`
--
ALTER TABLE `area_empleado`
  ADD KEY `idArea` (`idArea`);

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`idBanner`);

--
-- Indices de la tabla `banners_recurso_digital`
--
ALTER TABLE `banners_recurso_digital`
  ADD KEY `idBanner` (`idBanner`),
  ADD KEY `url` (`url`);

--
-- Indices de la tabla `dirige`
--
ALTER TABLE `dirige`
  ADD KEY `idOperador` (`idOperador`),
  ADD KEY `idLider` (`idLider`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `empleado_rol`
--
ALTER TABLE `empleado_rol`
  ADD KEY `index_idEmpleado` (`idEmpleado`),
  ADD KEY `index_idRol` (`idRol`);

--
-- Indices de la tabla `indicador`
--
ALTER TABLE `indicador`
  ADD PRIMARY KEY (`idIndicador`);

--
-- Indices de la tabla `natgasblocks`
--
ALTER TABLE `natgasblocks`
  ADD PRIMARY KEY (`idNatgasBlocks`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idPrivilegio`);

--
-- Indices de la tabla `recurso_digital`
--
ALTER TABLE `recurso_digital`
  ADD PRIMARY KEY (`url`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD KEY `index_idRol` (`idRol`),
  ADD KEY `index_idPrivilegio` (`idPrivilegio`);

--
-- Indices de la tabla `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `suple`
--
ALTER TABLE `suple`
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idSolicitud` (`idSolicitud`);

--
-- Indices de la tabla `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  ADD PRIMARY KEY (`idVacacionesLFT`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `IdAnuncios` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idArea` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `indicador`
--
ALTER TABLE `indicador`
  MODIFY `idIndicador` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `natgasblocks`
--
ALTER TABLE `natgasblocks`
  MODIFY `idNatgasBlocks` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  MODIFY `idSolicitud` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  MODIFY `idVacacionesLFT` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anuncios_recurso_digital`
--
ALTER TABLE `anuncios_recurso_digital`
  ADD CONSTRAINT `anuncios_recurso_digital_ibfk_1` FOREIGN KEY (`idAnuncios`) REFERENCES `anuncios` (`IdAnuncios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anuncios_recurso_digital_ibfk_2` FOREIGN KEY (`url`) REFERENCES `recurso_digital` (`url`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `area_empleado`
--
ALTER TABLE `area_empleado`
  ADD CONSTRAINT `area_empleado_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `banners_recurso_digital`
--
ALTER TABLE `banners_recurso_digital`
  ADD CONSTRAINT `banners_recurso_digital_ibfk_1` FOREIGN KEY (`idBanner`) REFERENCES `banners` (`idBanner`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banners_recurso_digital_ibfk_2` FOREIGN KEY (`url`) REFERENCES `recurso_digital` (`url`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dirige`
--
ALTER TABLE `dirige`
  ADD CONSTRAINT `dirige_ibfk_1` FOREIGN KEY (`idOperador`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dirige_ibfk_2` FOREIGN KEY (`idLider`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado_rol`
--
ALTER TABLE `empleado_rol`
  ADD CONSTRAINT `fk_Empleado_Rol` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rol_Empleado` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `natgasblocks`
--
ALTER TABLE `natgasblocks`
  ADD CONSTRAINT `natgasblocks_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD CONSTRAINT `fk_Privilegio_Rol` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rol_Privilegio` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  ADD CONSTRAINT `solicitudvacaciones_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `suple`
--
ALTER TABLE `suple`
  ADD CONSTRAINT `suple_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suple_ibfk_2` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudvacaciones` (`idSolicitud`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
