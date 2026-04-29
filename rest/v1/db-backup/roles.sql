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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_aid` int(11) NOT NULL,
  `role_is_active` tinyint(1) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `role_description` varchar(255) NOT NULL,
  `role_created` datetime NOT NULL,
  `role_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_aid`, `role_is_active`, `role_name`, `role_description`, `role_created`, `role_updated`) VALUES
(1, 1, 'Backend Developer', 'A backend developer builds and maintains the server-side logic, databases, and APIs that power web applications, focusing on data storage, security, and performance.', '2026-04-28 09:39:51', '2026-04-28 09:39:51'),
(2, 1, 'Frontend Developer', 'A Front-End Developer creates the user-facing part of websites and applications, focusing on layout, design, and interactivity using HTML, CSS, and JavaScript.', '2026-04-28 09:40:18', '2026-04-28 10:46:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
