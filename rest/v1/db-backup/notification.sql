-- phpMyAdmin SQL Dump
-- Database: `viter_ftcd_v1`

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `notification` (
  `noti_aid` int(11) NOT NULL,
  `noti_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `noti_name` varchar(100) NOT NULL,
  `noti_email` varchar(150) NOT NULL,
  `noti_phone` varchar(30) NOT NULL,
  `noti_purpose` varchar(100) NOT NULL,
  `noti_created` datetime NOT NULL,
  `noti_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `notification` (`noti_aid`, `noti_is_active`, `noti_name`, `noti_email`, `noti_phone`, `noti_purpose`, `noti_created`, `noti_updated`) VALUES
(1, 1, 'Q', 'q@a.com', '', 'For New Donor', '2026-04-29 08:00:00', '2026-04-29 08:00:00'),
(2, 1, 'Q', 'xx@ccc.com', '', 'For Donation Receipt', '2026-04-29 08:00:00', '2026-04-29 08:00:00'),
(3, 1, 'Sad', 'asda@gmail.com', '', 'For Donation Receipt', '2026-04-29 08:00:00', '2026-04-29 08:00:00'),
(4, 1, 'X', 'xx@ccc.com', '', 'For New Donor', '2026-04-29 08:00:00', '2026-04-29 08:00:00'),
(5, 1, 'X', 'xx@ccc.com', '', 'For Donation Receipt', '2026-04-29 08:00:00', '2026-04-29 08:00:00');

ALTER TABLE `notification`
  ADD PRIMARY KEY (`noti_aid`);

ALTER TABLE `notification`
  MODIFY `noti_aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
