-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2025 at 06:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `title`, `description`, `created_at`, `completed`, `completed_at`) VALUES
(1, 'ddsf', 'vdvd', '2025-10-07 15:28:21', 1, '2025-10-07 13:17:24'),
(3, 'csd', 'csddsca', '2025-10-07 15:34:01', 1, '2025-10-07 13:17:27'),
(4, 'vfssvsd', 'sfdfsdfsdf', '2025-10-07 18:46:15', 1, '2025-10-07 13:17:33'),
(5, 'gdfgf', 'gdfgd', '2025-10-07 18:48:49', 1, '2025-10-07 13:22:27'),
(6, 'fsdfef', 'ffsd', '2025-10-07 18:48:55', 1, '2025-10-07 13:22:41'),
(7, 'fdsfsdf', 'sfddsf', '2025-10-07 18:48:57', 1, '2025-10-07 13:19:35'),
(8, 'sdfdfd', 'sfdfds', '2025-10-07 18:49:00', 1, '2025-10-07 13:19:32'),
(9, 'dsfdsfd', 'fsdf', '2025-10-07 18:49:03', 1, '2025-10-07 13:19:29'),
(10, 'sdfsd', 'sfdfs', '2025-10-07 18:49:09', 1, '2025-10-07 13:19:26'),
(11, 'fdsfsd', 'sdfsdfsdfsd', '2025-10-07 18:49:18', 1, '2025-10-07 13:19:23'),
(12, 'dasdas', 'sdasds', '2025-10-07 18:52:01', 1, '2025-10-07 13:22:36'),
(13, 'svsvs', 'vvdsd', '2025-10-07 18:52:09', 1, '2025-10-07 13:22:34'),
(14, 'dvdsffddvdf', 'vdvdsdd', '2025-10-07 18:52:19', 1, '2025-10-07 13:22:31'),
(15, 'vvfv', 'vsdvfsd', '2025-10-07 18:54:30', 1, '2025-10-07 13:53:25'),
(16, 'vdvfdvfdvfd', 'vdfvdf', '2025-10-07 19:05:37', 1, '2025-10-07 14:11:44'),
(17, 'ffvdfvdf', 'vdfvd', '2025-10-07 19:05:43', 1, '2025-10-07 14:11:53'),
(18, 'feferfrefrfre', 'fererfeferer', '2025-10-07 19:31:02', 1, '2025-10-07 14:11:56'),
(19, 'csdfdfsd', 'fsdfsdfsdf', '2025-10-07 19:31:56', 1, '2025-10-07 14:11:50'),
(20, 'hfgfggjhhg', 'sddfsdfsdf', '2025-10-07 19:32:14', 1, '2025-10-07 14:11:47'),
(21, 'Help Saman', 'Saman need help with his software project', '2025-10-07 19:49:50', 1, '2025-10-07 16:21:27'),
(22, 'Play Cricket', 'Plan the soft ball cricket match on next sunday', '2025-10-07 19:50:40', 1, '2025-10-07 16:21:24'),
(23, 'Takehome Assignment', 'Finish the mid - term assignment ', '2025-10-07 19:51:14', 1, '2025-10-07 16:21:23'),
(24, 'Clean home ', 'Need to clean the bedroom', '2025-10-07 19:51:43', 1, '2025-10-07 16:21:20'),
(25, 'Buy Books ', 'Buy books for the next school year', '2025-10-07 19:52:12', 1, '2025-10-07 16:21:19'),
(26, 'Help Saman', 'Saman need help with his software Project', '2025-10-07 21:55:22', 0, NULL),
(27, 'Play Cricket ', 'Plan the soft ball cricket match on next sunday', '2025-10-07 21:56:00', 0, NULL),
(28, 'Takehome Assignment', 'Finish the mid-term assignment', '2025-10-07 21:56:33', 0, NULL),
(29, 'Clean home', 'Need to clean the bedroom', '2025-10-07 21:56:54', 0, NULL),
(30, 'Buy Books', 'Buy books for the next school year', '2025-10-07 21:57:17', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
