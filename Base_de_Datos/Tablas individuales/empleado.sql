-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 02:28 AM
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
-- Table structure for table `empleado`
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
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `email`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fechaNac`, `fechaIngr`, `numTelefonico`, `cantidadNatgasBlocks`, `antigüedad`, `vacacionesTotales`, `numVacacionesLey`, `numVacacionesPremio`, `plaza`) VALUES
(40201, 'pilar1999@natgas.com.mx', 'Pilar', 'Garcia', 'Torrez', '1999-01-24', '2019-02-06', '4423743823', 5, 3, 14, 14, 0, 'QRO'),
(90122, 'samperjes@natgas.com.mx', 'Jesus', 'Samper', 'Luna', '1999-01-24', '2019-02-06', '4422289412', 5, 3, 14, 14, 0, 'QRO'),
(90155, 'jfortiz@natgas.com.mx', 'José Francisco ', 'Ortiz', 'Diaz', '1999-01-24', '2019-02-02', '4428787113', 5, 3, 14, 14, 0, 'QRO'),
(90421, 'AMLedesma@natgas.com.mx', 'Andres', 'Martinez', 'Ledesma', '2001-01-05', '2021-02-06', '4422267512', 2, 1, 10, 10, 0, 'CDMX'),
(90521, 'aleubeda@natgas.com.mx', 'Alejandra ', 'Ubeda', 'Beltran', '2000-01-05', '2019-02-06', '4422267202', 5, 3, 14, 14, 0, 'QRO'),
(90541, 'Octaviusjuar@natgas.com.mx', 'Octavio', 'Juarez', 'Sanchez', '1999-05-21', '2019-02-06', '4422267468', 5, 3, 14, 14, 0, 'QRO'),
(90920, 'davidcardenas@natgas.com.mx', 'David', 'Cardenas', 'Soza', '1997-01-20', '2020-02-06', '4422262049', 5, 2, 12, 12, 0, 'QRO'),
(90954, 'aavila@natgas.com.mx \r\n', 'Adriana ', 'Avila ', 'Hernandez ', '1999-01-06', '2019-02-07', '4423743857', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90958, 'larenas@natgas.com.mx \r\n', 'Luis Fernando ', 'Arenas', 'Gomez ', '1999-01-07', '2019-02-08', '4433562535', 5, 3, 14, 14, 0, 'AGS\r\n'),
(90961, 'kbarcenas@natgas.com.mx \r\n', 'Karen Cristell ', 'Barcenas ', 'Corona ', '1999-01-09', '2019-02-10', '4429876543', 5, 3, 14, 14, 0, 'QRO'),
(90967, 'parroyo@natgas.com.mx \r\n', 'Pablo Estefano ', 'Arroyo', 'Garrido ', '1999-01-04', '2019-02-05', '4422781765', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90972, 'pfranco@natgas.com.mx \r\n', 'Paola ', 'Franco ', 'Ramirez ', '1999-01-08', '2019-02-09', '4435678876', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90976, 'fayala@natgas.com.mx \r\n', 'Brenda Fabiola ', 'Ayala', 'Mauricio ', '1999-01-05', '2019-02-06', '4422738746', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90977, 'belroseZac@natgas.com.mx', 'Zacarias', 'Belrose', 'Garrido ', '1999-09-25', '2019-02-06', '4422289765', 5, 3, 14, 14, 0, 'QRO'),
(90978, 'jcpineda@natgas.com.mx\r\n', 'Juan Carlos ', 'Pineda ', 'Adaya', '1999-01-02', '2019-02-03', '4428787690', 5, 3, 14, 14, 0, 'QRO'),
(90984, 'mvillanueva@natgas.com.mx\r\n', 'Marco Alejandro ', 'Villanueva ', 'Suarez ', '1999-01-10', '2019-02-11', '4421787645', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90987, 'orodriguez@natgas.com.mx \r\n', 'Oscar Daniel ', 'Rodriguez ', 'Amador ', '1999-01-03', '2019-02-04', '4422289879', 5, 3, 14, 14, 0, 'GDL\r\n'),
(90995, 'drodriguez@natgas.com.mx \r\n', 'Diego ', 'Rodriguez ', 'Beltran ', '1999-01-01', '2019-02-02', '4422267610', 5, 3, 14, 14, 0, 'QRO'),
(9092421, 'Manusilvestre@natgas.com.mx', 'Manuel', 'Silvestre', 'Rojas', '1999-04-05', '2019-02-05', '4422267543', 5, 3, 14, 14, 0, 'QRO'),
(9094287, 'emimedina@natgas.com.mx', 'Emiliano', 'Medina', 'Garcia', '1999-07-21', '2019-02-05', '4428787984', 5, 3, 14, 14, 0, 'QRO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
