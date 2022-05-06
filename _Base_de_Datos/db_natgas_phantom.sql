-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2022 a las 08:14:34
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
-- Base de datos: `db_natgas_phantom`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AceptarRestarNGB` (IN `U_idqs` INT, IN `U_idNGB` INT)  MODIFIES SQL DATA
BEGIN
	
    UPDATE natgasblocks SET estatusNGB = 1 WHERE idNatgasBlocks = U_idNGB;
    
    UPDATE empleado SET cantidadNatgasBlocks = cantidadNatgasBlocks - 1 WHERE idEmpleado = U_idqs;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_Estatus_Vacas_Aceptar` (IN `U_idSolicitud` INT, IN `U_vacasUsadas` INT, IN `U_empleado` INT)  BEGIN
	UPDATE solicitudvacaciones    	
    SET solicitudAceptadaEstatus = 1
    WHERE idSolicitud = U_idSolicitud;
    
SET @vacPrem = 0;

SET @vacasUsadas = U_vacasUsadas;

SELECT numVacacionesPremio
INTO @vacPrem
FROM empleado
WHERE idEmpleado = U_empleado;

IF @vacPrem > 0 THEN
	IF @vacPrem >= U_vacasUsadas THEN
		UPDATE empleado
    	SET numVacacionesPremio = numVacacionesPremio -U_vacasUsadas
    	WHERE idEmpleado = U_empleado;
	ELSE
    	UPDATE empleado
        SET numVacacionesPremio = 0
      	WHERE idEmpleado = U_empleado;
        
        SET @vacasUsadas = @vacasUsadas - @vacPrem;
        
        UPDATE empleado
        SET numVacacionesLey = numVacacionesLey - @vacasUsadas
        WHERE idEmpleado = U_empleado;
	END IF;
ELSE 
	UPDATE empleado
    SET numVacacionesLey = numVacacionesLey - U_vacasUsadas
    WHERE idEmpleado = U_empleado;
END IF;
    	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar_Estatus_Vacas_Rechazar` (IN `U_idSolicitud` INT, IN `U_nota` TEXT)  UPDATE solicitudvacaciones   	
SET solicitudAceptadaEstatus = 0, Nota = U_nota
WHERE idSolicitud = U_idSolicitud$$

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
(10, 'Dirección Técnica '),
(11, 'Recursos Humanos');

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
(4, 91901, '2022-04-01', NULL),
(4, 16836, '2022-04-01', NULL),
(4, 91902, '2022-04-01', NULL),
(6, 91990, '2022-04-01', NULL),
(6, 91991, '2022-04-01', NULL),
(6, 91992, '2022-04-01', NULL),
(11, 91904, '2022-04-01', NULL),
(11, 91993, '2022-04-01', NULL),
(4, 91994, '2022-04-01', NULL);

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
(16836, 91901, '2022-04-01', NULL),
(91902, 91901, '2022-04-01', NULL),
(91903, 91902, '2022-04-01', NULL),
(91904, 91900, '2022-04-02', NULL),
(91990, 91991, '2022-04-01', NULL),
(91991, 91992, '2022-04-01', NULL),
(91993, 91900, '2022-04-01', NULL),
(91901, 91994, '2022-04-01', NULL);

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
(16836, 'A01610836@itesm.mx', '$2a$12$/u63aMaOyxrRhZEcckly5O6swTmyyxSro7RdWugov0XL94W/3yxJ2', 'Miguel Weiping', 'Tang', 'Feng', '2000-11-30', NULL, '4443073141', 5, NULL, 10, 8, 2, NULL),
(91900, 'ahernandez@natgas.com.mx', '$2a$12$zhxYc1RP.w5gzV6ZYP2v2ugfjkQnsZgOOHcRRcDPAzHhGcAIpOe1C', 'Alfonso', 'Hernández', 'Carrillo', '1984-11-29', NULL, '4441285948', 5, NULL, 10, 6, 4, NULL),
(91901, 'pabloarroyo@natgas.com.mx', '$2a$12$3vYe6evSjTJJstBQuWzZs.xKZzDjOIQppQZrPUswliNs2zHjxkYyu', 'Pablo', 'Arroyo', 'Hernández', '1996-07-02', NULL, '4425481294', 4, NULL, 12, 8, 1, NULL),
(91902, 'jmendoza@natgas.com.mx', '$2a$12$kBmXMaFFsQqXz2I7RSqMbOgwGie/lMpG6sZZV8AQoqH61icgTaJIy', 'Jorge', 'Mendoza', 'Pérez', '1990-07-09', NULL, '4425672839', 5, NULL, 12, 10, 2, NULL),
(91903, 'asalinas@natgas.com.mx', '$2a$12$KNCeR3Ccw63R773cPa5In.KAamnqFcMAdqOOWePpL5H9z2SJsqBjO', 'Alejandro', 'Salinas', 'Trejo', '1995-06-12', NULL, '4425081492', 5, NULL, 12, 12, NULL, NULL),
(91904, 'drodríguez@natgas.com.mx', '$2a$12$ou7Vdd7zkM0w03HNzHK4Pen0cI6J7DTmoOwi9j0zfiuFJUU4IEpq.', 'Diego', 'Rodríguez', 'Palacio', '1996-11-05', NULL, '4441345678', 5, NULL, 8, 6, 2, NULL),
(91990, 'pmartinez@natgas.com.mx', '$2a$12$d7R3QhwSvFz/i0ThlrLtwOyVZLE7DceFx15Fei.Wiw3nEa9SjCVZa', 'Pedro', 'Martinez', 'Bonilla', '1934-07-20', NULL, '2716482777', 5, NULL, 10, 8, 2, NULL),
(91991, 'rfernandez@natgas.com.mx', '$2a$12$O3csy4ihi0qm2uohUGtWM.cygoTP4tusYhqhglEzbJWAAxpMT62Xm', 'Rafael', 'Fernandez', 'Tijerino', '2022-04-06', NULL, '2847775999', 5, NULL, 10, 9, 1, NULL),
(91992, 'apsanchez@natgas.com.mx', '$2a$12$9JGkW8MCSkTgZQ3X8TOnnehIAuyhwPQKIQEIMhDqt10OsYSBFxi7y', 'Ana Paula', 'Sanchez', 'Molina', '2022-04-13', NULL, '5653786668', 5, NULL, 10, 7, 3, NULL),
(91993, 'mhernandez@natgas.com.mx', '$2a$12$3R2Zja8t4eumaq4ft53fU.fyAtlHB/Uo2HLt/SQfeVD.z2Bw.fYpy', 'Maria', 'Hernandez', 'Canales', '2022-04-10', NULL, '7653287978', 5, NULL, 10, 8, 2, NULL),
(91994, 'sgutierrez@natgas.com.mx', '$2a$12$RPE3R/ysrnKLWeuw3S6JTuIybiZA2Ne/wdB.Qa6HE9wvFNlmVeRui', 'Sebastian', 'Gutierrez', 'Mayorga', '2022-04-06', NULL, '9754345651', 5, NULL, 14, 10, 4, NULL);

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
(91900, 1, '2011-04-12', '0000-00-00'),
(91904, 2, '2021-08-19', '0000-00-00'),
(91901, 3, '2019-12-15', '0000-00-00'),
(91902, 4, '2018-09-17', '0000-00-00'),
(91903, 5, '2020-04-16', '0000-00-00'),
(16836, 4, '2022-04-11', '0000-00-00'),
(91990, 4, '2022-04-01', '0000-00-00'),
(91991, 3, '2022-04-01', '0000-00-00'),
(91992, 3, '2022-04-01', '0000-00-00'),
(91993, 2, '2022-04-01', '0000-00-00'),
(91994, 3, '2022-04-01', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `natgasblocks`
--

CREATE TABLE `natgasblocks` (
  `idNatgasBlocks` int(3) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaSolicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `fechaUsoNGB` date DEFAULT NULL,
  `estatusNGB` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `natgasblocks`
--

INSERT INTO `natgasblocks` (`idNatgasBlocks`, `idEmpleado`, `fechaSolicitud`, `fechaUsoNGB`, `estatusNGB`) VALUES
(52, 16836, '2022-04-01 06:00:00', '2022-04-02', NULL),
(56, 91902, '2022-04-06 05:00:00', '2022-04-07', NULL),
(61, 91900, '2022-04-03 06:00:00', '2022-04-04', 1),
(62, 91900, '2022-04-03 06:00:00', '2022-05-01', 1),
(66, 91900, '2022-04-15 02:45:25', '2022-04-20', 1),
(67, 91900, '2022-04-15 02:52:24', '2022-05-01', 1),
(69, 91901, '2022-04-15 04:43:00', '2022-04-15', 1);

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
(1, 'registrarVacacion'),
(2, 'consultarEstatusVacacion'),
(3, 'registrarEstatusVacacion'),
(4, 'registrarNGB'),
(5, 'registrarEstatusNGB'),
(6, 'consultarEstatusNGB'),
(7, 'consultarAnuncio');

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
(2, 'recursosHumanos'),
(3, 'lider'),
(4, 'operador'),
(5, 'despachador');

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
-- Estructura Stand-in para la vista `solicitudesngb`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `solicitudesngb` (
`idqs` int(11)
,`Quien_solicita` varchar(40)
,`qsApellidoPaterno` varchar(40)
,`qsApellidoMaterno` varchar(40)
,`Lider` varchar(40)
,`lApellidoPaterno` varchar(40)
,`lApellidoMaterno` varchar(40)
,`idNatgasBlocks` int(3)
,`fechaSolicitud` timestamp
,`fechaUsoNGB` date
,`estatusNGB` tinyint(1)
);

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
  `fechaSolicitud` date NOT NULL DEFAULT current_timestamp(),
  `suplente` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `solicitudAceptadaEstatus` tinyint(1) DEFAULT NULL,
  `Nota` text COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `solicitudvacaciones`
--

INSERT INTO `solicitudvacaciones` (`idSolicitud`, `idEmpleado`, `fechaInicio`, `fechaFin`, `fechaReanudacion`, `fechaSolicitud`, `suplente`, `solicitudAceptadaEstatus`, `Nota`) VALUES
(80, 91901, '2022-04-15', '2022-04-21', '2022-04-25', '2022-04-14', 'Miguel', 1, NULL),
(81, 91901, '2022-04-18', '2022-04-20', '2022-04-21', '2022-04-14', 'Ricardo', 1, NULL),
(82, 91901, '2022-04-25', '2022-04-27', '2022-04-28', '2022-04-14', 'Andres', 0, NULL),
(85, 91993, '2022-04-15', '2022-04-19', '2022-04-20', '2022-04-14', 'Ricardo', 1, NULL),
(86, 91993, '2022-04-18', '2022-04-20', '2022-04-21', '2022-04-14', 'Miguel', 0, 'Por floja'),
(87, 91993, '2022-04-25', '2022-04-27', '2022-04-28', '2022-04-14', 'Andres', 0, NULL);

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

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewlider`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewlider` (
`idEmpleado` int(11)
,`fechaUsoNGB` date
,`fechaSolicitud` timestamp
,`idLider` int(11)
,`Lider` varchar(40)
,`lApellidoPaterno` varchar(40)
,`lApellidoMaterno` varchar(40)
,`idNGB` int(3)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewquiensolicita`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewquiensolicita` (
`idEmpleado` int(11)
,`fechaUsoNGB` date
,`fechaSolicitud` timestamp
,`idLider` int(11)
,`Quien_Solicita` varchar(40)
,`qsApellidoPaterno` varchar(40)
,`qsApellidoMaterno` varchar(40)
,`idNGB` int(3)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `solicitudesngb`
--
DROP TABLE IF EXISTS `solicitudesngb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `solicitudesngb`  AS SELECT `vqs`.`idEmpleado` AS `idqs`, `vqs`.`Quien_Solicita` AS `Quien_solicita`, `vqs`.`qsApellidoPaterno` AS `qsApellidoPaterno`, `vqs`.`qsApellidoMaterno` AS `qsApellidoMaterno`, `vl`.`Lider` AS `Lider`, `vl`.`lApellidoPaterno` AS `lApellidoPaterno`, `vl`.`lApellidoMaterno` AS `lApellidoMaterno`, `ngb`.`idNatgasBlocks` AS `idNatgasBlocks`, `ngb`.`fechaSolicitud` AS `fechaSolicitud`, `ngb`.`fechaUsoNGB` AS `fechaUsoNGB`, `ngb`.`estatusNGB` AS `estatusNGB` FROM ((`viewquiensolicita` `vqs` join `viewlider` `vl`) join `natgasblocks` `ngb`) WHERE `vqs`.`idNGB` = `vl`.`idNGB` AND `ngb`.`idNatgasBlocks` = `vqs`.`idNGB` AND `ngb`.`idNatgasBlocks` = `vl`.`idNGB` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewlider`
--
DROP TABLE IF EXISTS `viewlider`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewlider`  AS   (select `ngb`.`idEmpleado` AS `idEmpleado`,`ngb`.`fechaUsoNGB` AS `fechaUsoNGB`,`ngb`.`fechaSolicitud` AS `fechaSolicitud`,`d`.`idLider` AS `idLider`,`e`.`nombre` AS `Lider`,`e`.`apellidoPaterno` AS `lApellidoPaterno`,`e`.`apellidoMaterno` AS `lApellidoMaterno`,`ngb`.`idNatgasBlocks` AS `idNGB` from ((`natgasblocks` `ngb` join `dirige` `d`) join `empleado` `e`) where `ngb`.`idEmpleado` = `d`.`idOperador` and `e`.`idEmpleado` = `d`.`idLider`)  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewquiensolicita`
--
DROP TABLE IF EXISTS `viewquiensolicita`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewquiensolicita`  AS   (select `ngb`.`idEmpleado` AS `idEmpleado`,`ngb`.`fechaUsoNGB` AS `fechaUsoNGB`,`ngb`.`fechaSolicitud` AS `fechaSolicitud`,`d`.`idLider` AS `idLider`,`e`.`nombre` AS `Quien_Solicita`,`e`.`apellidoPaterno` AS `qsApellidoPaterno`,`e`.`apellidoMaterno` AS `qsApellidoMaterno`,`ngb`.`idNatgasBlocks` AS `idNGB` from ((`natgasblocks` `ngb` join `dirige` `d`) join `empleado` `e`) where `ngb`.`idEmpleado` = `d`.`idOperador` and `e`.`idEmpleado` = `ngb`.`idEmpleado`)  ;

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
  ADD KEY `idEmpleado` (`idEmpleado`);

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
  MODIFY `idArea` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `idBanner` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `natgasblocks`
--
ALTER TABLE `natgasblocks`
  MODIFY `idNatgasBlocks` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `solicitudvacaciones`
--
ALTER TABLE `solicitudvacaciones`
  MODIFY `idSolicitud` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

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
  ADD CONSTRAINT `natgasblocks_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `natgasblocks_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_solicitudvacaciones_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valor_indicador`
--
ALTER TABLE `valor_indicador`
  ADD CONSTRAINT `valor_indicador_ibfk_1` FOREIGN KEY (`TipoIndicadorID`) REFERENCES `tipo_indicador` (`TipoIndicadorID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
