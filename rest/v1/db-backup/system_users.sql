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
-- Table structure for table `system_users`
--

CREATE TABLE `system_users` (
  `sysuser_aid` int(11) NOT NULL,
  `sysuser_is_active` tinyint(1) NOT NULL,
  `sysuser_full_name` varchar(255) NOT NULL,
  `sysuser_email` varchar(128) NOT NULL,
  `sysuser_role_id` int(11) NOT NULL,
  `sysuser_created` datetime NOT NULL,
  `sysuser_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_users`
--

INSERT INTO `system_users` (`sysuser_aid`, `sysuser_is_active`, `sysuser_full_name`, `sysuser_email`, `sysuser_role_id`, `sysuser_created`, `sysuser_updated`) VALUES
(1, 1, 'Kristeen Arocena', 'teenaro@gmail.com', 2, '2026-04-28 09:43:21', '2026-04-28 09:43:21'),
(4, 1, 'Khent Adelino', 'khent@gmail.com', 1, '2026-04-28 10:47:13', '2026-04-28 10:47:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `system_users`
--
ALTER TABLE `system_users`
  ADD PRIMARY KEY (`sysuser_aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `system_users`
--
ALTER TABLE `system_users`
  MODIFY `sysuser_aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
