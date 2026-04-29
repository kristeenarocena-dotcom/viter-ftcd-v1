-- phpMyAdmin SQL Dump
-- Database: `viter_ftcd_v1`

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `designation` (
  `des_aid` int(11) NOT NULL,
  `des_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `des_name` varchar(100) NOT NULL,
  `des_category_id` int(11) NOT NULL,
  `des_created` datetime NOT NULL,
  `des_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `designation` (`des_aid`, `des_is_active`, `des_name`, `des_category_id`, `des_created`, `des_updated`) VALUES
(1, 1, 'Classroom', 1, '2026-04-29 09:00:00', '2026-04-29 09:00:00'),
(2, 1, 'Meal For Christmas', 1, '2026-04-29 09:00:00', '2026-04-29 09:00:00');

ALTER TABLE `designation`
  ADD PRIMARY KEY (`des_aid`),
  ADD KEY `des_category_id` (`des_category_id`);

ALTER TABLE `designation`
  MODIFY `des_aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `designation`
  ADD CONSTRAINT `designation_ibfk_1` FOREIGN KEY (`des_category_id`) REFERENCES `category` (`cat_aid`);

COMMIT;
