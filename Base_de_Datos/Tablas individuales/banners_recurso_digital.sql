-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 05:48 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners_recurso_digital`
--
ALTER TABLE `banners_recurso_digital`
  ADD KEY `idBanner` (`idBanner`),
  ADD KEY `url` (`url`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners_recurso_digital`
--
ALTER TABLE `banners_recurso_digital`
  ADD CONSTRAINT `banners_recurso_digital_ibfk_1` FOREIGN KEY (`idBanner`) REFERENCES `banners` (`idBanner`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banners_recurso_digital_ibfk_2` FOREIGN KEY (`url`) REFERENCES `recurso_digital` (`url`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
