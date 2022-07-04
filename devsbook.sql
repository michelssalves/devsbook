-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 17-Mar-2022 às 20:17
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `devsbook`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `postcomments`
--

DROP TABLE IF EXISTS `postcomments`;
CREATE TABLE IF NOT EXISTS `postcomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_post` int NOT NULL,
  `id_user` int NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `postcomments`
--

INSERT INTO `postcomments` (`id`, `id_post`, `id_user`, `created_at`, `body`) VALUES
(1, 1, 1, '2022-03-05 22:30:43', 'teste'),
(2, 7, 1, '2022-03-16 23:31:55', 'dsadsa'),
(3, 6, 1, '2022-03-16 23:32:03', 'dddddddd'),
(4, 11, 1, '2022-03-17 00:44:32', 'fsdfds'),
(5, 12, 1, '2022-03-17 00:44:34', 'gfdg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postlikes`
--

DROP TABLE IF EXISTS `postlikes`;
CREATE TABLE IF NOT EXISTS `postlikes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_post` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `postlikes`
--

INSERT INTO `postlikes` (`id`, `id_post`, `id_user`, `created_at`) VALUES
(3, 7, 1, '2022-03-07 22:05:47'),
(4, 1, 1, '2022-03-07 22:07:00'),
(5, 6, 1, '2022-03-16 23:31:59'),
(6, 12, 1, '2022-03-17 00:44:25'),
(7, 11, 1, '2022-03-17 00:44:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `type`, `created_at`, `body`) VALUES
(1, 1, 'text', '2022-03-01 11:51:02', 'dsadsad'),
(2, 1, 'text', '2022-03-01 11:51:07', 'ddds        dsadsa'),
(3, 1, 'text', '2022-03-01 12:59:07', 'abacate meu'),
(4, 1, 'text', '2022-03-01 13:37:24', 'asdasdasdcccc\r\nsdasdas'),
(5, 1, 'text', '2022-03-01 14:05:54', 'cavalo de troia'),
(6, 1, 'text', '2022-03-01 14:05:59', 'mosquetao'),
(7, 1, 'text', '2022-03-06 17:20:20', 'dsadsadsdasdas'),
(8, 1, 'text', '2022-03-16 23:49:30', 'dfsadsadsad'),
(9, 1, 'body', '2022-03-17 00:17:50', 'dddd'),
(10, 1, 'body', '2022-03-17 00:17:56', 'qqqqqqqqqqqq'),
(11, 1, 'text', '2022-03-17 00:20:32', 'gggggg'),
(12, 1, 'text', '2022-03-17 00:43:41', 'wwww'),
(13, 1, 'photo', '2022-03-17 00:53:22', '38266594b275164e5954037aa63b8bc8.jpg'),
(14, 1, 'photo', '2022-03-17 00:53:28', '3953b1a1afa7f0fce831b9e2a377a7d0.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `userrelations`
--

DROP TABLE IF EXISTS `userrelations`;
CREATE TABLE IF NOT EXISTS `userrelations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `userrelations`
--

INSERT INTO `userrelations` (`id`, `user_from`, `user_to`) VALUES
(2, 1, 2),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `birthdate` date NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `work` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default.jpg',
  `cover` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'cover.jpg',
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `birthdate`, `city`, `work`, `avatar`, `cover`, `token`) VALUES
(1, 'michelssalves@gmail.com', '$2y$10$0uJY4w/HkA8nLdiWJsLrOOkppnFLGZIgTNm6F6yzqL290S3wtXHnG', 'Michel Silas Scabia Alves', '1993-07-11', 'ALMIRANTE TAMANDARE', 'Programador', '2769eb5e39a36e502be8565ef597d522.jpg', '13a01ce6f769ccf220201c092a07b99a.jpg', '92b97af3462f21b5ac535ae54f33ccc9'),
(2, 'yaeda.mayumi@gmail.com', '$2y$10$SOd21I/7F5ImC7zkKp.wpewNIyrqPPVvZMMq0GBvSXbtVEabE7ZPu', 'Mayumi Yaeda', '1994-07-01', NULL, NULL, 'default.jpg', 'cover.jpg', 'f7707df5f4de67bfd43119f5dc1c5b35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
