-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 29, 2025 at 09:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

-- Admin email - admin@hotel.com
-- Admin password - admin123

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `service_id` int(22) NOT NULL,
  `guests` int(11) DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `totalamount` int(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `special_request` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `service_id`, `guests`, `check_in`, `check_out`, `totalamount`, `phone`, `special_request`, `status`, `created_at`) VALUES
(1, 2, 0, 2, '2025-09-14 00:00:00', '2025-09-15 00:00:00', 0, '4690875', 'I want comfortable environment with delicious food', 'Pending', '2025-09-04 04:35:33'),
(2, 2, 6, 2, '2025-09-25 00:00:00', '2025-09-26 00:00:00', 0, '4690875', 'hope your services is good', 'Confirmed', '2025-09-05 04:13:25'),
(3, 2, 7, 1, '2025-09-19 00:00:00', '2025-09-19 00:00:00', 0, '6804565', 'no', 'Confirmed', '2025-09-05 06:26:00'),
(4, 2, 8, 1, '2025-09-26 00:00:00', '2025-09-26 00:00:00', 0, '4690875', 'no', 'Confirmed', '2025-09-05 07:20:10'),
(5, 2, 10, 1, '2025-09-24 00:00:00', '2025-09-24 00:00:00', 0, '4690875', 'give privacy', 'Pending', '2025-09-05 08:21:15'),
(7, 2, 6, 2, '2025-09-18 15:00:00', '2025-09-22 15:00:00', 4800, '6495', 'no', 'Confirmed', '2025-09-05 08:58:53'),
(8, 2, 8, 2, '2025-09-20 12:00:00', '2025-09-20 14:39:00', 46778, '8475859', '', 'Confirmed', '2025-09-18 07:07:39'),
(9, 2, 14, 4, '2025-09-25 06:00:00', '2025-09-26 09:00:00', 800, '8475859', 'play ground must be clean and for drinking water and fresh juice available ', 'Confirmed', '2025-09-23 04:07:42'),
(10, 4, 11, 2, '2025-09-30 12:00:00', '2025-10-03 16:59:00', 8000, '8475859', 'maintain cleaness', 'Pending', '2025-09-29 07:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `email`, `message`) VALUES
('', '', ''),
('', '', ''),
('rohit', 'rohit@gmail.com', 'nice place'),
('uzair', 'uzaire@gmail.com', 'amazing food');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `amount`, `payment_date`, `status`) VALUES
(1, 2, 1200.00, '2025-09-05 06:21:07', 'Pending'),
(2, 3, 2456.00, '2025-09-05 06:27:14', 'Pending'),
(3, 4, 46778.00, '2025-09-05 07:21:31', 'confirmed'),
(4, 7, 1200.00, '2025-09-12 13:01:07', 'confirmed'),
(5, 9, 400.00, '2025-09-23 04:09:58', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_type` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `category`, `price`, `created_at`) VALUES
(6, 'rooms', 'Suite', 1200.00, '2025-09-04 11:54:20'),
(7, 'spa', 'Pedicure', 2456.00, '2025-09-04 12:12:27'),
(8, 'sports', 'Swimming', 46778.00, '2025-09-04 12:16:44'),
(9, 'gym', 'Gym', 35678.00, '2025-09-04 12:19:12'),
(11, 'rooms', 'Deluxe', 2000.00, '2025-09-05 12:58:17'),
(12, 'rooms', 'Family', 4000.00, '2025-09-06 04:02:55'),
(14, 'sports', 'football', 400.00, '2025-09-06 07:57:33'),
(15, 'banquet', 'party', 40000.00, '2025-09-29 07:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `block`) VALUES
(1, 'ruchi', 'ruchi@gmail.com', '$2y$10$n.4yacJDcmnSFRZRXB3YSu2P7gKG0OIs5krWzC5AR3Qnx8SAghZcG', 0),
(2, 'naman', 'naman@gmail.com', '$2y$10$uF8cyySE0bJLX9HjPkSZRec057B5UGxuEONEN7EntgxF4IcEXtXWu', 0),
(3, 'jay', 'jay@gmail.com', '$2y$10$TQ.RV9NBZLxXINSiD/HcgeLeopj0AWlL9zqQd79N9DeTsykezeIDC', 0),
(4, 'rohit sharma', 'rohit@gmail.com', '$2y$10$7fCS2BTBcRJJHX9TKe/GsuFanIxffD3F1nthd2M2IwPhmghsM1rlm', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
