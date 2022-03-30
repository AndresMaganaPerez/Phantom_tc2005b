-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 02:21 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`IdAnuncios`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `IdAnuncios` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
