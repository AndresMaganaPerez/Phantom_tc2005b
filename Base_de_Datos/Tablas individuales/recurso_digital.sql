-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 02:29 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recurso_digital`
--
ALTER TABLE `recurso_digital`
  ADD PRIMARY KEY (`url`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
