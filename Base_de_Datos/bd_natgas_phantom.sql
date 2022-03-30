-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 11:53 PM
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
-- Table structure for table `admin`
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
-- Table structure for table `anuncios`
--

CREATE TABLE `anuncios` (
  `IdAnuncios` int(3) NOT NULL,
  `Fecha` date NOT NULL,
  `Titulo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Pin` tinyint(1) NOT NULL,
  `expiracion` date NOT NULL,
  `texto` text COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `anuncios`
--

INSERT INTO `anuncios` (`IdAnuncios`, `Fecha`, `Titulo`, `Pin`, `expiracion`, `texto`) VALUES
(1, '2022-03-28', 'Ipsum Lorem', 0, '2022-05-24', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(2, '2022-03-28', 'ISSPUM LOREM ', 0, '2022-05-11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(3, '2022-03-28', 'Lorem dipsum', 1, '2022-05-25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(4, '2022-03-28', 'Lorem Ipsum', 1, '2022-03-29', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(5, '2022-03-28', 'Orem Ipsum', 0, '2022-03-31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum. x'),
(6, '2022-03-28', 'Desp lorem ipsumdesp', 1, '2022-05-13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(7, '2022-04-01', 'Ipsum Lorem Dipsum', 0, '2022-06-02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(8, '2022-03-28', 'Nuevas instalaciones', 0, '2022-05-13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(9, '2022-03-09', 'Mantenimiento a pagina', 1, '2022-05-19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(10, '2022-04-08', 'Nueva Area ', 0, '2022-03-31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(11, '2022-04-01', 'Premio a mejor empleado', 0, '2022-05-11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(12, '2022-04-14', 'Foo bar', 0, '2022-06-15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(13, '2022-01-19', 'Bar Foo', 0, '2022-03-28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(14, '2022-03-28', 'Se rompen Records de ', 0, '2022-05-11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(15, '2022-02-08', 'Teambuilding', 0, '2022-04-14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(16, '2022-01-04', 'Lorem Dipsum Loripsum', 0, '2022-03-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(17, '2022-05-11', 'Noticias de Empresa Mayo', 0, '2022-06-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(18, '2022-03-29', 'donaciones', 0, '2022-05-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(19, '2022-03-29', 'Rally', 0, '2022-05-25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.'),
(20, '2022-02-15', 'Frooop Bar', 0, '2022-04-20', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eleifend velit et orci faucibus finibus. Vivamus eu volutpat diam. Nunc facilisis mauris at congue rhoncus. Nullam vulputate condimentum nunc non tristique. Aliquam sit amet placerat diam. Vestibulum ac diam quis dolor porta venenatis. Morbi molestie fringilla ex, sed semper ipsum laoreet a. Pellentesque sed dapibus arcu, sit amet faucibus felis. Proin quis sem dui. Nunc mollis, augue ullamcorper commodo sodales, ligula nibh condimentum quam, vitae finibus leo est a lorem. Quisque sit amet augue eu dui faucibus eleifend. Cras lacinia lectus in purus faucibus fermentum.');

-- --------------------------------------------------------

--
-- Table structure for table `anuncios_recurso_digital`
--

CREATE TABLE `anuncios_recurso_digital` (
  `idAnuncios` int(3) NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `anuncios_recurso_digital`
--

INSERT INTO `anuncios_recurso_digital` (`idAnuncios`, `url`) VALUES
(13, 'https://momentum-prod-uploads.s3.amazonaws.com/wp-content/uploads/2017/09/Captura-de-pantalla-2017-09-18-a-las-12.53.41.png'),
(16, 'https://cdn.businessinsider.es/sites/navi.axelspringer.es/public/styles/bi_570/public/media/image/2021/02/bi-2238511.jpg?itok=QqcsF0YZ'),
(13, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
(17, 'https://www.youtube.com/watch?v=dmcNbsLCpBQ'),
(20, 'https://tierragamer.com/wp-content/uploads/2021/05/shrek.jpg'),
(16, 'https://www.youtube.com/watch?v=r8xfzeD0ZK4'),
(8, 'https://m.media-amazon.com/images/I/51w7koDjFsL._AC_.jpg'),
(7, 'https://storage.googleapis.com/natgas/eds/eds-gto-mexico-japon_large.jpg'),
(18, 'https://www.youtube.com/watch?v=dmcNbsLCpBQ'),
(17, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
(15, 'https://www.youtube.com/watch?v=r8xfzeD0ZK4'),
(20, 'https://momentum-prod-uploads.s3.amazonaws.com/wp-content/uploads/2017/09/Captura-de-pantalla-2017-09-18-a-las-12.53.41.png'),
(4, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
(2, 'https://www.youtube.com/watch?v=feA64wXhbjo'),
(18, 'https://storage.googleapis.com/natgas/eds/eds-gto-mexico-japon_large.jpg'),
(4, 'https://storage.googleapis.com/natgas/eds/eds-gto-mexico-japon_large.jpg'),
(17, 'https://tierragamer.com/wp-content/uploads/2021/05/shrek.jpg'),
(10, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
(2, 'https://www.youtube.com/watch?v=feA64wXhbjo'),
(3, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `idArea` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`idArea`, `nombre`) VALUES
(1, 'Talento y Comunicación '),
(2, 'Comercial '),
(3, 'Finanzas '),
(4, 'TI '),
(5, 'Operaciones y SC '),
(6, 'Proyectos '),
(7, 'Mantenimiento '),
(8, 'Asuntos Regulatorios '),
(9, 'SST '),
(10, 'Dirección Técnica ');

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

-- --------------------------------------------------------

--
-- Table structure for table `banners_recurso_digital`
--

CREATE TABLE `banners_recurso_digital` (
  `idBanner` int(3) NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `banners_recurso_digital`
--

INSERT INTO `banners_recurso_digital` (`idBanner`, `url`) VALUES
(1, 'https://assets.entrepreneur.com/content/3x2/2000/1627801865-shutterstock-747539488.jpg'),
(2, 'https://lh3.googleusercontent.com/TfNN8HLZbAQhTIUkzCAJUipWqwbIzbpvI-TAffSvC8F3-yu5EMjeAq50vXC9EF6iXSxs7TE4zPlZErmy0VFmATJdxDau9VBYPqlT9rdBfIacyaEkBn4Du9uPHelJG6ic8OhHMIg'),
(3, 'https://lh3.googleusercontent.com/TfNN8HLZbAQhTIUkzCAJUipWqwbIzbpvI-TAffSvC8F3-yu5EMjeAq50vXC9EF6iXSxs7TE4zPlZErmy0VFmATJdxDau9VBYPqlT9rdBfIacyaEkBn4Du9uPHelJG6ic8OhHMIg'),
(4, 'https://m.media-amazon.com/images/I/51w7koDjFsL._AC_.jpg'),
(5, 'https://momentum-prod-uploads.s3.amazonaws.com/wp-content/uploads/2017/09/Captura-de-pantalla-2017-09-18-a-las-12.53.41.png'),
(6, 'https://storage.googleapis.com/natgas/eds/eds-gto-mexico-japon_large.jpg'),
(7, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
(8, 'https://tierragamer.com/wp-content/uploads/2021/05/shrek.jpg'),
(9, 'https://www.ricardosalinas.com/blog/images/fotoblogene2709.png'),
(10, 'https://www.youtube.com/watch?v=0mYBSayCsH0'),
(11, 'https://www.youtube.com/watch?v=djV11Xbc914'),
(12, 'https://www.youtube.com/watch?v=dmcNbsLCpBQ'),
(13, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
(14, 'https://www.youtube.com/watch?v=feA64wXhbjo'),
(15, 'https://www.youtube.com/watch?v=L_jWHffIx5E'),
(16, 'https://www.youtube.com/watch?v=NQSCKWfJlXs'),
(17, 'https://www.youtube.com/watch?v=r8xfzeD0ZK4'),
(18, 'https://www.youtube.com/watch?v=wDgQdr8ZkTw&list=PLaSAJFZNxXNG2HpJxD62eIHnYbyn1lsp_'),
(19, 'https://www.youtube.com/watch?v=wDgQdr8ZkTw&list=PLaSAJFZNxXNG2HpJxD62eIHnYbyn1lsp_'),
(20, 'https://www.youtube.com/watch?v=wDgQdr8ZkTw&list=PLaSAJFZNxXNG2HpJxD62eIHnYbyn1lsp_');

-- --------------------------------------------------------

--
-- Table structure for table `dirige`
--

CREATE TABLE `dirige` (
  `idOperador` int(11) NOT NULL,
  `idLider` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `empleado_rol`
--

CREATE TABLE `empleado_rol` (
  `idEmpleado` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `privilegios`
--

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `accion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `recurso_digital`
--

CREATE TABLE `recurso_digital` (
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `recurso_digital`
--

INSERT INTO `recurso_digital` (`url`) VALUES
('https://assets.entrepreneur.com/content/3x2/2000/1627801865-shutterstock-747539488.jpg'),
('https://cdn.businessinsider.es/sites/navi.axelspringer.es/public/styles/bi_570/public/media/image/2021/02/bi-2238511.jpg?itok=QqcsF0YZ'),
('https://lh3.googleusercontent.com/TfNN8HLZbAQhTIUkzCAJUipWqwbIzbpvI-TAffSvC8F3-yu5EMjeAq50vXC9EF6iXSxs7TE4zPlZErmy0VFmATJdxDau9VBYPqlT9rdBfIacyaEkBn4Du9uPHelJG6ic8OhHMIg'),
('https://m.media-amazon.com/images/I/51w7koDjFsL._AC_.jpg'),
('https://momentum-prod-uploads.s3.amazonaws.com/wp-content/uploads/2017/09/Captura-de-pantalla-2017-09-18-a-las-12.53.41.png'),
('https://storage.googleapis.com/natgas/eds/eds-gto-mexico-japon_large.jpg'),
('https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
('https://tierragamer.com/wp-content/uploads/2021/05/shrek.jpg'),
('https://www.ricardosalinas.com/blog/images/fotoblogene2709.png'),
('https://www.youtube.com/watch?v=0mYBSayCsH0'),
('https://www.youtube.com/watch?v=djV11Xbc914'),
('https://www.youtube.com/watch?v=dmcNbsLCpBQ'),
('https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
('https://www.youtube.com/watch?v=feA64wXhbjo'),
('https://www.youtube.com/watch?v=L_jWHffIx5E'),
('https://www.youtube.com/watch?v=mukiMaOSLEs&list=PL3817D41C7D841E23&index=2'),
('https://www.youtube.com/watch?v=NQSCKWfJlXs'),
('https://www.youtube.com/watch?v=r8xfzeD0ZK4'),
('https://www.youtube.com/watch?v=wDgQdr8ZkTw&list=PLaSAJFZNxXNG2HpJxD62eIHnYbyn1lsp_'),
('https://www.youtube.com/watch?v=wREBD2og5iY');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `idRol` int(3) NOT NULL,
  `descripcionRol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `idRol` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `tipo_indicador`
--

CREATE TABLE `tipo_indicador` (
  `TipoIndicadorID` int(8) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tipo_indicador`
--

INSERT INTO `tipo_indicador` (`TipoIndicadorID`, `Nombre`) VALUES
(1, 'NPS'),
(2, 'ENPS'),
(3, 'Reducción de CO2	\r\n'),
(4, 'Porcentaje Hombre/Mujeres		\r\n');

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
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`IdAnuncios`);

--
-- Indexes for table `anuncios_recurso_digital`
--
ALTER TABLE `anuncios_recurso_digital`
  ADD KEY `idAnuncios` (`idAnuncios`),
  ADD KEY `url` (`url`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indexes for table `area_empleado`
--
ALTER TABLE `area_empleado`
  ADD KEY `idArea` (`idArea`),
  ADD KEY `area_empleado_ibfk_2` (`idEmpleado`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`idBanner`);

--
-- Indexes for table `banners_recurso_digital`
--
ALTER TABLE `banners_recurso_digital`
  ADD KEY `idBanner` (`idBanner`),
  ADD KEY `url` (`url`);

--
-- Indexes for table `dirige`
--
ALTER TABLE `dirige`
  ADD KEY `idOperador` (`idOperador`),
  ADD KEY `idLider` (`idLider`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indexes for table `empleado_rol`
--
ALTER TABLE `empleado_rol`
  ADD KEY `index_idEmpleado` (`idEmpleado`),
  ADD KEY `index_idRol` (`idRol`);

--
-- Indexes for table `natgasblocks`
--
ALTER TABLE `natgasblocks`
  ADD PRIMARY KEY (`idNatgasBlocks`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indexes for table `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idPrivilegio`);

--
-- Indexes for table `recurso_digital`
--
ALTER TABLE `recurso_digital`
  ADD PRIMARY KEY (`url`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indexes for table `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD KEY `index_idRol` (`idRol`),
  ADD KEY `index_idPrivilegio` (`idPrivilegio`);

--
-- Indexes for table `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indexes for table `tipo_indicador`
--
ALTER TABLE `tipo_indicador`
  ADD PRIMARY KEY (`TipoIndicadorID`);

--
-- Indexes for table `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  ADD PRIMARY KEY (`idVacacionesLFT`);

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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `IdAnuncios` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `idArea` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `natgasblocks`
--
ALTER TABLE `natgasblocks`
  MODIFY `idNatgasBlocks` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  MODIFY `idSolicitud` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tipo_indicador`
--
ALTER TABLE `tipo_indicador`
  MODIFY `TipoIndicadorID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  MODIFY `idVacacionesLFT` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `valor_indicador`
--
ALTER TABLE `valor_indicador`
  MODIFY `ValorIndicadorID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anuncios_recurso_digital`
--
ALTER TABLE `anuncios_recurso_digital`
  ADD CONSTRAINT `anuncios_recurso_digital_ibfk_1` FOREIGN KEY (`idAnuncios`) REFERENCES `anuncios` (`IdAnuncios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anuncios_recurso_digital_ibfk_2` FOREIGN KEY (`url`) REFERENCES `recurso_digital` (`url`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `area_empleado`
--
ALTER TABLE `area_empleado`
  ADD CONSTRAINT `area_empleado_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `area_empleado_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);

--
-- Constraints for table `banners_recurso_digital`
--
ALTER TABLE `banners_recurso_digital`
  ADD CONSTRAINT `banners_recurso_digital_ibfk_1` FOREIGN KEY (`idBanner`) REFERENCES `banners` (`idBanner`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banners_recurso_digital_ibfk_2` FOREIGN KEY (`url`) REFERENCES `recurso_digital` (`url`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dirige`
--
ALTER TABLE `dirige`
  ADD CONSTRAINT `dirige_ibfk_1` FOREIGN KEY (`idOperador`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dirige_ibfk_2` FOREIGN KEY (`idLider`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empleado_rol`
--
ALTER TABLE `empleado_rol`
  ADD CONSTRAINT `fk_Empleado_Rol` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rol_Empleado` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `natgasblocks`
--
ALTER TABLE `natgasblocks`
  ADD CONSTRAINT `natgasblocks_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD CONSTRAINT `fk_Privilegio_Rol` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rol_Privilegio` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  ADD CONSTRAINT `solicitudvacaciones_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `valor_indicador`
--
ALTER TABLE `valor_indicador`
  ADD CONSTRAINT `valor_indicador_ibfk_1` FOREIGN KEY (`TipoIndicadorID`) REFERENCES `tipo_indicador` (`TipoIndicadorID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
