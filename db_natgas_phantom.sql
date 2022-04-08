-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2022 a las 16:11:57
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
-- Base de datos: `db_natgas_phantom`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarSolVacAdmin` ()  SELECT *
FROM solicitudvacaciones
WHERE solicitudAceptadaEstatus = 1 OR solicitudAceptadaEstatus = 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarSolVacLider` (IN `U_idLider` INT)  SELECT *
FROM SOLICITUDVACACIONES
WHERE solicitudAceptadaEstatus IS NULL AND idEmpleado IN (SELECT idOperador
													FROM DIRIGE D
													WHERE idLider = U_idLider)$$

DELIMITER ;

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

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`idAdmin`, `nombre`, `apellidoMaterno`, `apellidoPaterno`, `noTelefono`, `email`) VALUES
(90456, 'Said', 'Trujillo', 'Ortigoza', '4427854565', 'admin1@natgas.com.mx'),
(90457, 'Alvin', 'Estrada', 'Gomez', '4425644578', 'alvinistrador@natgas.com.mx'),
(90458, 'Mortimer', 'Derteano', 'Ardor', '4427654565', 'mortderardor@natgas.com.mx'),
(90459, 'Elba', 'Surero', 'Rojas', '4425678908', 'esurero@natgas.com.mx'),
(90460, 'Lola', 'Mento', 'Gomez', '4424568976', 'lolamento@nagas.com.mx');

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

--
-- Volcado de datos para la tabla `anuncios`
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
-- Estructura de tabla para la tabla `anuncios_recurso_digital`
--

CREATE TABLE `anuncios_recurso_digital` (
  `idAnuncios` int(3) NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `anuncios_recurso_digital`
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
(3, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
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
(3, 'https://storage.googleapis.com/natgas/eds/eds-qro-5-febrero_large.jpg'),
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
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idArea` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `area`
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
-- Estructura de tabla para la tabla `area_empleado`
--

CREATE TABLE `area_empleado` (
  `idArea` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `area_empleado`
--

INSERT INTO `area_empleado` (`idArea`, `idEmpleado`, `fechaInicio`, `fechaFin`) VALUES
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
(8, 90521, '2019-02-06', NULL),
(10, 90920, '2020-02-06', NULL),
(5, 90122, '2019-02-06', NULL),
(7, 90155, '2019-02-02', NULL),
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
(8, 90521, '2019-02-06', NULL),
(10, 90920, '2020-02-06', NULL),
(5, 90122, '2019-02-06', NULL),
(7, 90155, '2019-02-02', NULL),
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
(8, 90521, '2019-02-06', NULL),
(10, 90920, '2020-02-06', NULL),
(5, 90122, '2019-02-06', NULL),
(7, 90155, '2019-02-02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `idBanner` int(3) NOT NULL,
  `expiracion` date NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `banners`
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
-- Estructura de tabla para la tabla `banners_recurso_digital`
--

CREATE TABLE `banners_recurso_digital` (
  `idBanner` int(3) NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `banners_recurso_digital`
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
(20, 'https://www.youtube.com/watch?v=wDgQdr8ZkTw&list=PLaSAJFZNxXNG2HpJxD62eIHnYbyn1lsp_'),
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
(20, 'https://www.youtube.com/watch?v=wDgQdr8ZkTw&list=PLaSAJFZNxXNG2HpJxD62eIHnYbyn1lsp_'),
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
-- Estructura de tabla para la tabla `dirige`
--

CREATE TABLE `dirige` (
  `idOperador` int(11) NOT NULL,
  `idLider` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dirige`
--

INSERT INTO `dirige` (`idOperador`, `idLider`, `fechaInicio`, `fechaFin`) VALUES
(90976, 90920, '2019-10-15', NULL),
(90920, 90961, '2019-03-12', NULL),
(90972, 90978, '2019-03-12', NULL),
(90976, 90978, '2019-03-12', NULL),
(90541, 90978, '2020-03-18', NULL),
(90977, 90978, '2018-03-14', NULL),
(90155, 90958, '0000-00-00', NULL),
(90976, 90987, '2014-03-27', NULL),
(90958, 90122, '2018-03-21', NULL),
(90920, 90978, '2022-03-01', NULL),
(90972, 40201, '2019-03-19', NULL),
(90987, 90541, '2019-03-26', NULL),
(90122, 90978, '2022-03-08', NULL),
(90958, 90987, '2022-03-02', NULL),
(90961, 90978, '2014-03-19', NULL),
(90155, 90978, '2022-03-08', NULL),
(90984, 90978, '2022-03-23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(8) NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `token` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidoPaterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidoMaterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaNac` date NOT NULL,
  `fechaIngr` date DEFAULT NULL,
  `numTelefonico` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidadNatgasBlocks` int(1) DEFAULT NULL,
  `antiguedad` int(2) DEFAULT NULL,
  `vacacionesTotales` int(2) DEFAULT NULL,
  `numVacacionesLey` int(2) DEFAULT NULL,
  `numVacacionesPremio` int(2) DEFAULT NULL,
  `plaza` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `email`, `token`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fechaNac`, `fechaIngr`, `numTelefonico`, `cantidadNatgasBlocks`, `antiguedad`, `vacacionesTotales`, `numVacacionesLey`, `numVacacionesPremio`, `plaza`) VALUES
(40201, 'pilar1999@natgas.com.mx', '', 'Pilar', 'Garcia', 'Torrez', '1999-01-24', '2019-02-06', '4423743823', 5, 3, 14, 14, 0, 'QRO'),
(90122, 'samperjes@natgas.com.mx', '', 'Jesus', 'Samper', 'Luna', '1999-01-24', '2019-02-06', '4422289412', 5, 3, 14, 14, 0, 'QRO'),
(90155, 'jfortiz@natgas.com.mx', '', 'José Francisco ', 'Ortiz', 'Diaz', '1999-01-24', '2019-02-02', '4428787113', 5, 3, 14, 14, 0, 'QRO'),
(90421, 'AMLedesma@natgas.com.mx', '', 'Andres', 'Martinez', 'Ledesma', '2001-01-05', '2021-02-06', '4422267512', 2, 1, 10, 10, 0, 'CDMX'),
(90521, 'aleubeda@natgas.com.mx', '', 'Alejandra ', 'Ubeda', 'Beltran', '2000-01-05', '2019-02-06', '4422267202', 5, 3, 14, 14, 0, 'QRO'),
(90541, 'Octaviusjuar@natgas.com.mx', '', 'Octavio', 'Juarez', 'Sanchez', '1999-05-21', '2019-02-06', '4422267468', 5, 3, 14, 14, 0, 'QRO'),
(90920, 'davidcardenas@natgas.com.mx', '', 'David', 'Cardenas', 'Soza', '1997-01-20', '2020-02-06', '4422262049', 5, 2, 12, 12, 0, 'QRO'),
(90954, 'aavila@natgas.com.mx \r\n', '', 'Adriana ', 'Avila ', 'Hernandez ', '1999-01-06', '2019-02-07', '4423743857', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90958, 'larenas@natgas.com.mx \r\n', '', 'Luis Fernando ', 'Arenas', 'Gomez ', '1999-01-07', '2019-02-08', '4433562535', 5, 3, 14, 14, 0, 'AGS\r\n'),
(90961, 'kbarcenas@natgas.com.mx \r\n', '', 'Karen Cristell ', 'Barcenas ', 'Corona ', '1999-01-09', '2019-02-10', '4429876543', 5, 3, 14, 14, 0, 'QRO'),
(90967, 'parroyo@natgas.com.mx \r\n', '', 'Pablo Estefano ', 'Arroyo', 'Garrido ', '1999-01-04', '2019-02-05', '4422781765', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90972, 'pfranco@natgas.com.mx \r\n', '', 'Paola ', 'Franco ', 'Ramirez ', '1999-01-08', '2019-02-09', '4435678876', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90976, 'fayala@natgas.com.mx \r\n', '', 'Brenda Fabiola ', 'Ayala', 'Mauricio ', '1999-01-05', '2019-02-06', '4422738746', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90977, 'belroseZac@natgas.com.mx', '', 'Zacarias', 'Belrose', 'Garrido ', '1999-09-25', '2019-02-06', '4422289765', 5, 3, 14, 14, 0, 'QRO'),
(90978, 'jcpineda@natgas.com.mx\r\n', '', 'Juan Carlos ', 'Pineda ', 'Adaya', '1999-01-02', '2019-02-03', '4428787690', 5, 3, 14, 14, 0, 'QRO'),
(90984, 'mvillanueva@natgas.com.mx\r\n', '', 'Marco Alejandro ', 'Villanueva ', 'Suarez ', '1999-01-10', '2019-02-11', '4421787645', 5, 3, 14, 14, 0, 'QRO\r\n'),
(90987, 'orodriguez@natgas.com.mx \r\n', '', 'Oscar Daniel ', 'Rodriguez ', 'Amador ', '1999-01-03', '2019-02-04', '4422289879', 5, 3, 14, 14, 0, 'GDL\r\n'),
(91901, 'pabloarroyo@natgas.com.mx', '$2a$12$3vYe6evSjTJJstBQuWzZs.xKZzDjOIQppQZrPUswliNs2zHjxkYyu', 'Pablo', 'Arroyo', 'Hernández', '1996-07-02', NULL, '4425481294', NULL, NULL, NULL, NULL, NULL, NULL),
(91902, 'jmendoza@natgas.com.mx', '$2a$12$kBmXMaFFsQqXz2I7RSqMbOgwGie/lMpG6sZZV8AQoqH61icgTaJIy', 'Jorge', 'Mendoza', 'Pérez', '1990-07-09', NULL, '4425672839', NULL, NULL, NULL, NULL, NULL, NULL),
(91903, 'asalinas@natgas.com.mx', '$2a$12$KNCeR3Ccw63R773cPa5In.KAamnqFcMAdqOOWePpL5H9z2SJsqBjO', 'Alejandro', 'Salinas', 'Trejo', '1995-06-12', NULL, '4425081492', NULL, NULL, NULL, NULL, NULL, NULL),
(91904, 'drodríguez@natgas.com.mx', '$2a$12$ou7Vdd7zkM0w03HNzHK4Pen0cI6J7DTmoOwi9j0zfiuFJUU4IEpq.', 'Diego', 'Rodríguez', 'Palacio', '1996-11-05', NULL, '4441345678', NULL, NULL, NULL, NULL, NULL, NULL),
(95500, 'A01610836@itesm.mx', '$2a$12$6rLIDVrrQU4bgnC.aAMnquM5bhIjayvV2kCInvFoHtjRKy5cNMovO', 'Miguel Weiping', 'Tang', 'Feng', '2000-11-30', NULL, '4443073141', NULL, NULL, NULL, NULL, NULL, NULL);

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

--
-- Volcado de datos para la tabla `empleado_rol`
--

INSERT INTO `empleado_rol` (`idEmpleado`, `idRol`, `fechaInicio`, `fechaFin`) VALUES
(91901, 2, '2011-04-12', '0000-00-00'),
(91902, 3, '2013-08-19', '0000-00-00'),
(91904, 1, '2019-12-15', '0000-00-00'),
(91903, 4, '2018-09-17', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `natgasblocks`
--

CREATE TABLE `natgasblocks` (
  `idNatgasBlocks` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaSolicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `natgasblocks`
--

INSERT INTO `natgasblocks` (`idNatgasBlocks`, `idEmpleado`, `fechaSolicitud`) VALUES
(1, 90967, '2022-02-09'),
(2, 90521, '2022-03-30'),
(3, 90958, '2022-03-31'),
(4, 90541, '2022-04-06'),
(7, 90972, '2022-03-21'),
(8, 40201, '2022-02-18'),
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
(21, 90421, '2022-03-30'),
(22, 90421, '2022-03-30'),
(23, 90961, '2022-04-13'),
(24, 90541, '2022-04-20'),
(25, 90987, '2022-04-20'),
(26, 90920, '2022-03-31'),
(30, 90155, '2022-04-26'),
(31, 90961, '2022-03-29'),
(32, 90972, '2022-03-08'),
(33, 90122, '2022-03-22'),
(34, 90421, '2022-04-22'),
(35, 90977, '2022-04-21'),
(36, 90976, '2022-05-11'),
(37, 90984, '2022-05-18'),
(38, 90521, '2022-04-06'),
(40, 90541, '2022-06-15'),
(42, 90421, '2022-01-19'),
(43, 90122, '2022-02-03'),
(45, 90541, '2022-03-14'),
(47, 90978, '2022-04-12'),
(48, 90984, '2022-05-18'),
(49, 90976, '2022-03-31'),
(50, 90521, '2022-04-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `accion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idPrivilegio`, `accion`) VALUES
(1, 'generalAdmin'),
(2, 'generalLider'),
(3, 'generalOperador'),
(4, 'generalPromJF'),
(5, 'solicitudVacacion'),
(6, 'anuncio'),
(7, 'solicitudNGB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_digital`
--

CREATE TABLE `recurso_digital` (
  `url` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `recurso_digital`
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
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(3) NOT NULL,
  `descripcionRol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `descripcionRol`) VALUES
(1, 'admin'),
(2, 'lider'),
(3, 'operador'),
(4, 'despachador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `idRol` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles_privilegios`
--

INSERT INTO `roles_privilegios` (`idRol`, `idPrivilegio`) VALUES
(1, 1),
(2, 1),
(2, 5),
(2, 7),
(2, 6),
(3, 3),
(3, 5),
(3, 7),
(3, 6),
(4, 4),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudvacaciones`
--

CREATE TABLE `solicitudvacaciones` (
  `idSolicitud` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idLider` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `fechaReanudacion` date NOT NULL,
  `fechaSolicitud` date NOT NULL DEFAULT current_timestamp(),
  `suplente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `solicitudAceptadaEstatus` tinyint(1) DEFAULT NULL,
  `Nota` text COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `solicitudvacaciones`
--

INSERT INTO `solicitudvacaciones` (`idSolicitud`, `idEmpleado`, `idLider`, `fechaInicio`, `fechaFin`, `fechaReanudacion`, `fechaSolicitud`, `suplente`, `solicitudAceptadaEstatus`, `Nota`) VALUES
(1, 90954, 0, '2022-04-15', '2022-04-19', '2022-04-20', '2022-03-29', '', NULL, NULL),
(2, 90521, 0, '2022-05-10', '2022-05-14', '2022-05-16', '2022-03-29', '', 0, ''),
(3, 90421, 0, '2022-02-08', '2022-03-11', '2022-03-14', '2022-02-03', '', 0, ''),
(4, 90977, 0, '2022-01-11', '2022-03-13', '2022-03-14', '2022-02-28', '', NULL, NULL),
(5, 90920, 0, '2022-07-02', '2022-07-08', '2022-07-11', '2022-03-29', '', 0, ''),
(8, 90976, 0, '2022-04-01', '2022-04-04', '2022-04-05', '2022-03-31', '', NULL, NULL),
(9, 90978, 0, '2022-04-11', '2022-03-18', '2022-03-21', '2022-03-29', '', 0, ''),
(10, 90155, 0, '2022-04-25', '2022-04-29', '2022-05-02', '2022-03-29', '', NULL, NULL),
(11, 90954, 0, '2022-03-02', '2022-03-04', '2022-03-07', '2022-03-01', '', 1, ''),
(12, 90421, 0, '2022-01-03', '2022-01-07', '2022-01-10', '2021-12-30', '', 1, ''),
(13, 90920, 0, '2022-02-17', '2022-02-21', '2022-02-22', '2022-02-14', '', NULL, NULL),
(15, 90976, 0, '2022-03-30', '2022-04-04', '2022-04-05', '2022-03-29', '', NULL, NULL),
(16, 90961, 0, '2022-02-14', '2022-02-16', '2022-02-17', '2022-02-01', '', 1, ''),
(17, 90984, 0, '2022-04-08', '2022-04-11', '2022-04-12', '2022-03-30', '', NULL, NULL),
(18, 90987, 0, '2021-12-16', '2021-12-21', '2021-12-22', '2021-12-13', '', NULL, NULL),
(19, 90972, 0, '2022-02-21', '2022-02-22', '2022-02-23', '2022-02-18', '', 0, ''),
(20, 90122, 0, '2022-01-28', '2022-01-28', '2022-01-31', '2022-01-24', '', NULL, NULL),
(21, 90961, 0, '2021-03-07', '2021-03-14', '2021-03-15', '2021-03-01', '', 1, ''),
(22, 90521, 0, '2021-03-10', '2021-03-16', '2021-03-18', '2021-03-04', '', 1, ''),
(23, 90421, 0, '2021-06-09', '2021-06-15', '2021-06-17', '2021-06-06', '', 1, ''),
(24, 90521, 0, '2021-03-10', '2021-03-16', '2021-03-18', '2021-03-04', '', 1, ''),
(25, 90920, 0, '2021-04-10', '2021-04-15', '2021-04-16', '2021-04-03', '', 1, ''),
(26, 90155, 0, '2022-02-02', '2022-02-08', '2022-02-10', '2022-01-30', '', 1, ''),
(27, 90920, 0, '2021-04-10', '2021-04-15', '2021-04-16', '2021-04-03', '', 1, ''),
(28, 90155, 0, '2022-02-02', '2022-02-08', '2022-02-10', '2022-01-30', '', 1, ''),
(29, 90541, 0, '2021-03-20', '2021-03-26', '2021-03-27', '2021-03-15', '', 1, ''),
(30, 90972, 0, '2021-07-08', '2021-07-14', '2021-07-15', '2021-07-02', '', 1, ''),
(31, 90421, 0, '2022-05-09', '2022-05-16', '2022-05-17', '2022-03-29', '', 0, ''),
(32, 90977, 0, '2022-06-22', '2022-06-29', '2022-06-30', '2022-03-29', '', 0, ''),
(35, 90967, 0, '2022-03-30', '2022-04-06', '2022-04-07', '2022-03-22', '', 0, ''),
(36, 90976, 0, '2022-04-12', '2022-04-19', '2022-04-20', '2022-03-29', '', 0, ''),
(37, 90976, 0, '2022-05-12', '2022-05-16', '2022-05-17', '2022-03-30', '', 0, ''),
(38, 90984, 0, '2022-03-08', '2022-03-15', '2022-03-16', '2022-03-01', '', 0, ''),
(39, 90920, 0, '2022-05-11', '2022-05-18', '2022-05-19', '2022-03-29', '', 0, ''),
(40, 90978, 0, '2022-03-29', '2022-04-04', '2022-04-05', '2022-03-22', '', 0, ''),
(41, 90521, 0, '2022-02-14', '2022-02-14', '2022-02-15', '2022-02-11', '', 1, ''),
(42, 90977, 0, '2022-01-12', '2022-01-12', '2022-01-13', '2022-01-10', '', 1, ''),
(43, 90541, 0, '2022-03-18', '2022-03-25', '2022-03-28', '2022-03-01', '', 0, ''),
(44, 40201, 0, '2022-02-28', '2022-03-02', '2022-03-03', '2022-02-23', '', 0, ''),
(45, 90958, 0, '2022-01-19', '2022-01-21', '2022-01-24', '2022-01-17', '', 0, ''),
(46, 90984, 0, '2022-03-31', '2022-04-11', '2022-04-12', '2022-05-18', '', 0, ''),
(47, 90967, 0, '2022-04-01', '2022-04-08', '2022-04-11', '2022-03-30', '', 0, ''),
(48, 90976, 0, '2022-06-02', '2022-06-08', '2022-06-09', '2022-05-03', '', 0, ''),
(49, 90987, 0, '2022-04-11', '2022-04-15', '2022-04-18', '2022-03-30', '', 0, ''),
(50, 40201, 0, '2022-06-15', '2022-06-20', '2022-06-21', '2022-04-14', '', 0, ''),
(60, 90954, 0, '2022-04-14', '2022-04-22', '0000-00-00', '2022-04-01', 'Miguel', NULL, NULL),
(61, 90954, 0, '2022-04-14', '2022-04-21', '0000-00-00', '2022-04-01', 'Miguel', NULL, NULL),
(62, 90954, 0, '2022-04-16', '2022-04-13', '0000-00-00', '2022-04-01', 'Ricardo', NULL, NULL),
(65, 90954, 0, '2022-04-07', '2022-04-15', '0000-00-00', '2022-04-01', 'Miguel', NULL, NULL),
(66, 90954, 0, '2022-04-14', '2022-04-29', '0000-00-00', '2022-04-01', 'okdosakdpoksadas', NULL, NULL),
(67, 90954, 0, '2022-04-03', '2022-04-11', '0000-00-00', '2022-04-01', 'hoyViernes', NULL, NULL),
(68, 90954, 0, '2022-04-05', '2022-04-12', '0000-00-00', '2022-04-01', 'viernerHoy', NULL, NULL),
(69, 90954, 0, '2022-04-12', '2022-04-27', '0000-00-00', '2022-04-01', 'viernesHoyHoy', NULL, NULL),
(70, 90954, 0, '2022-04-01', '2022-04-02', '0000-00-00', '2022-04-01', 'viernehasdsadsa', NULL, NULL),
(71, 90954, 0, '2022-07-01', '2022-08-01', '0000-00-00', '2022-04-01', 'dsadsa', NULL, NULL),
(72, 90954, 0, '2022-08-18', '2022-09-30', '0000-00-00', '2022-04-01', 'asd', NULL, NULL),
(73, 90954, 0, '2022-08-18', '2022-09-30', '0000-00-00', '2022-04-01', 'asd', NULL, NULL),
(74, 90954, 0, '2022-08-18', '2022-09-30', '0000-00-00', '2022-04-01', 'asd', NULL, NULL),
(75, 90954, 0, '2022-04-01', '2022-11-25', '0000-00-00', '2022-04-01', 'dasdasdwqewq', NULL, NULL),
(76, 90954, 0, '2022-11-01', '2023-02-01', '0000-00-00', '2022-04-01', 'eqwewq', NULL, NULL),
(77, 90954, 0, '2022-08-31', '2022-11-10', '0000-00-00', '2022-04-03', 'Miguel', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_indicador`
--

CREATE TABLE `tipo_indicador` (
  `TipoIndicadorID` int(8) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_indicador`
--

INSERT INTO `tipo_indicador` (`TipoIndicadorID`, `Nombre`) VALUES
(1, 'NPS'),
(2, 'ENPS'),
(3, 'Reducción de CO2	\r\n'),
(4, 'Porcentaje Hombre/Mujeres		\r\n');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_indicador`
--

CREATE TABLE `valor_indicador` (
  `ValorIndicadorID` int(8) NOT NULL,
  `TipoIndicadorID` int(8) NOT NULL,
  `Valor` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `valor_indicador`
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
  ADD KEY `idArea` (`idArea`),
  ADD KEY `area_empleado_ibfk_2` (`idEmpleado`);

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
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idLider` (`idLider`);

--
-- Indices de la tabla `tipo_indicador`
--
ALTER TABLE `tipo_indicador`
  ADD PRIMARY KEY (`TipoIndicadorID`);

--
-- Indices de la tabla `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  ADD PRIMARY KEY (`idVacacionesLFT`);

--
-- Indices de la tabla `valor_indicador`
--
ALTER TABLE `valor_indicador`
  ADD PRIMARY KEY (`ValorIndicadorID`),
  ADD KEY `valor_indicador_ibfk_1` (`TipoIndicadorID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90461;

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `IdAnuncios` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idArea` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `natgasblocks`
--
ALTER TABLE `natgasblocks`
  MODIFY `idNatgasBlocks` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  MODIFY `idSolicitud` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `tipo_indicador`
--
ALTER TABLE `tipo_indicador`
  MODIFY `TipoIndicadorID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vacacioneslft`
--
ALTER TABLE `vacacioneslft`
  MODIFY `idVacacionesLFT` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `valor_indicador`
--
ALTER TABLE `valor_indicador`
  MODIFY `ValorIndicadorID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  ADD CONSTRAINT `area_empleado_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `area_empleado_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_solicitudvacaciones_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudvacaciones_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valor_indicador`
--
ALTER TABLE `valor_indicador`
  ADD CONSTRAINT `valor_indicador_ibfk_1` FOREIGN KEY (`TipoIndicadorID`) REFERENCES `tipo_indicador` (`TipoIndicadorID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
