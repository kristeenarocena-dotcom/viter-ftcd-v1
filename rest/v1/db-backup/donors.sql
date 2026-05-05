-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2026 at 08:28 AM
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
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `donor_aid` int(11) NOT NULL,
  `donor_is_active` tinyint(1) NOT NULL,
  `donor_full_name` varchar(255) NOT NULL,
  `donor_email` varchar(128) NOT NULL,
  `donor_contact` varchar(50) NOT NULL,
  `donor_address` varchar(128) NOT NULL,
  `donor_city` varchar(100) NOT NULL,
  `donor_state` varchar(100) NOT NULL,
  `donor_country` varchar(100) NOT NULL,
  `donor_zip` varchar(20) NOT NULL,
  `donor_created` datetime NOT NULL,
  `donor_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`donor_aid`, `donor_is_active`, `donor_full_name`, `donor_email`, `donor_contact`, `donor_address`, `donor_city`, `donor_state`, `donor_country`, `donor_zip`, `donor_created`, `donor_updated`) VALUES
(1, 1, 'Kristeen Arocena', 'teenaro@gmail.com', '09516968998', 'Brgy Talangan', 'Nagcarlan', 'Laguna', 'Philippines', '4002', '2026-04-27 12:30:10', '2026-04-27 13:13:27'),
(2, 1, 'Fae Tubo', 'fae@gmail.com', '0999999999', 'Brgy. Bautista', 'San Pablo', 'Laguna', 'Philippines', '4002', '2026-04-27 12:34:52', '2026-04-27 12:34:52'),
(3, 0, 'Sebastian Mojica', 'seb@gmail.com', '0999999999', 'Brgy. Dyan Lang', 'San Pablo', 'Laguna', 'Philippines', '4002', '2026-04-27 13:11:50', '2026-04-27 13:11:50'),
(4, 0, 'Khent Geo Adelino', 'khent@gmail.com', '09999999999', 'Brgy. Doon', 'Medyo Maasim', 'Laguna', 'Philippines', '4002', '2026-04-27 13:12:53', '2026-04-27 13:13:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`donor_aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `donor_aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
