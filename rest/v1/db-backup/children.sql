-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2026 at 05:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viter_ftcd_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `children_aid` int(11) NOT NULL,
  `children_is_active` tinyint(1) NOT NULL,
  `children_full_name` varchar(255) NOT NULL,
  `children_birth_date` date NOT NULL,
  `children_my_story` text NOT NULL,
  `children_donation_limit` decimal(10,0) NOT NULL,
  `children_is_resident` tinyint(1) NOT NULL,
  `children_created` datetime NOT NULL,
  `children_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`children_aid`, `children_is_active`, `children_full_name`, `children_birth_date`, `children_my_story`, `children_donation_limit`, `children_is_resident`, `children_created`, `children_updated`) VALUES
(1, 0, 'Ratten Padilla', '2022-01-12', 'Ratten is a cheerful and kind-hearted boy currently living in an orphanage. Despite his situation, he loves to smile and enjoys playing with other children.', 300, 1, '2026-04-28 08:14:50', '2026-04-28 08:16:46'),
(2, 1, 'Khent Geo Adelino', '2024-02-02', 'Khent is a gentle and shy child living in an orphanage. She may be quiet at first, but she has a warm smile and a caring nature once she feels comfortable. Your support can help Sofia build a brighter future and feel the love and care every child deserves.', 500, 0, '2026-04-28 08:16:12', '2026-04-28 08:16:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`children_aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `children_aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
