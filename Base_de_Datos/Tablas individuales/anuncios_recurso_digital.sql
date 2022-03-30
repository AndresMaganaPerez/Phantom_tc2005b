-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 05:47 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anuncios_recurso_digital`
--
ALTER TABLE `anuncios_recurso_digital`
  ADD KEY `idAnuncios` (`idAnuncios`),
  ADD KEY `url` (`url`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anuncios_recurso_digital`
--
ALTER TABLE `anuncios_recurso_digital`
  ADD CONSTRAINT `anuncios_recurso_digital_ibfk_1` FOREIGN KEY (`idAnuncios`) REFERENCES `anuncios` (`IdAnuncios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anuncios_recurso_digital_ibfk_2` FOREIGN KEY (`url`) REFERENCES `recurso_digital` (`url`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
