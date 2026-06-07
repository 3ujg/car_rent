-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2026 at 07:24 PM
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
-- Database: `cardb`
--
CREATE DATABASE IF NOT EXISTS `cardb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cardb`;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL,
  `engine` varchar(100) DEFAULT NULL,
  `fuel_type` varchar(50) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `price_per_day` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('available','rented','maintenance') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `year`, `registration_number`, `engine`, `fuel_type`, `transmission`, `seats`, `price_per_day`, `description`, `image`, `status`, `created_at`) VALUES
(1, 'Kia', 'Sportage', 2016, 'VWX234', '1.5 Hybrid', 'Hybrid', 'Automatic', 5, 102.94, 'massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(2, 'BMW', 'Octavia', 2021, 'ABC123', '2.0 Turbo', 'Diesel', 'Manual', 7, 127.59, 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(3, 'BMW', 'Golf', 2025, 'STU901', '2.0 TDI', 'Hybrid', 'Manual', 3, 45.31, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(4, 'BMW', 'Golf', 2021, 'STU901', '2.0 TDI', 'Electric', 'Manual', 4, 81.37, 'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum', 'https://example.com/image1.jpg', 'rented', '0000-00-00 00:00:00'),
(5, 'Skoda', 'Sportage', 2012, 'DEF456', '1.5 Hybrid', 'Petrol', 'Automatic', 6, 87.83, 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(6, 'Toyota', 'E-Class', 2022, 'JKL012', '1.5 Hybrid', 'Electric', 'Manual', 6, 31.56, 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(7, 'Ford', 'Golf', 2020, 'VWX234', '1.5 Hybrid', 'Hybrid', 'Manual', 2, 73.41, 'tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(8, 'Volkswagen', 'Focus', 2020, 'DEF456', '2.0 Turbo', 'Hybrid', 'Manual', 8, 112.34, 'neque sapien placerat ante nulla justo aliquam quis turpis eget', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(9, 'Mercedes-Benz', 'Sportage', 2017, 'JKL012', '3.0 Diesel', 'Hybrid', 'Automatic', 7, 98.10, 'platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(10, 'Volkswagen', 'E-Class', 2018, 'GHI789', '3.0 Diesel', 'Electric', 'Automatic', 5, 211.80, 'in tempus sit amet sem fusce consequat nulla nisl nunc nisl', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(11, 'Toyota', 'Octavia', 2015, 'BCD890', '2.0 TDI', 'Diesel', 'Manual', 2, 81.81, 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(12, 'Hyundai', 'Octavia', 2021, 'BCD890', '1.5 Hybrid', 'Diesel', 'Manual', 8, 68.83, 'a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(13, 'Skoda', 'Focus', 2012, 'BCD890', '3.0 Diesel', 'Electric', 'Automatic', 6, 183.48, 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(14, 'Kia', 'E-Class', 2014, 'GHI789', '2.0 TDI', 'Petrol', 'Manual', 4, 78.89, 'proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(15, 'Toyota', '3 Series', 2021, 'ABC123', '2.0 Turbo', 'Hybrid', 'Automatic', 2, 202.37, 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(16, 'Skoda', 'A4', 2017, 'STU901', '2.0 Turbo', 'Petrol', 'Manual', 6, 146.25, 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(17, 'Hyundai', 'Focus', 2022, 'STU901', '1.5 Hybrid', 'Petrol', 'Manual', 6, 103.79, 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(18, 'Mercedes-Benz', 'A4', 2014, 'JKL012', '2.0 TDI', 'Electric', 'Automatic', 5, 219.09, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(19, 'Hyundai', 'Focus', 2022, 'VWX234', '3.0 Diesel', 'Hybrid', 'Automatic', 3, 177.54, 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(20, 'Kia', 'Focus', 2017, 'STU901', '2.0 Turbo', 'Electric', 'Manual', 7, 177.48, 'ut nulla sed accumsan felis ut at dolor quis odio', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(21, 'Volkswagen', 'XC90', 2017, 'YZA567', '1.5 Hybrid', 'Petrol', 'Automatic', 8, 100.25, 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(22, 'Ford', 'XC90', 2024, 'GHI789', '3.0 Diesel', 'Electric', 'Automatic', 8, 173.19, 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(23, 'Mercedes-Benz', 'Octavia', 2020, 'PQR678', '1.5 Hybrid', 'Petrol', 'Automatic', 6, 131.88, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(24, 'Hyundai', 'Camry', 2013, 'PQR678', '2.0 TDI', 'Electric', 'Automatic', 4, 91.77, 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(25, 'Skoda', 'Camry', 2025, 'STU901', '2.0 TDI', 'Hybrid', 'Manual', 3, 159.01, 'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(26, 'Ford', 'Tucson', 2019, 'PQR678', '2.0 Turbo', 'Petrol', 'Automatic', 5, 170.77, 'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(27, 'Ford', 'Sportage', 2016, 'YZA567', '1.5 Hybrid', 'Electric', 'Manual', 3, 93.81, 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(28, 'Toyota', 'E-Class', 2019, 'JKL012', '3.0 Diesel', 'Diesel', 'Manual', 4, 136.62, 'cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(29, 'Toyota', 'XC90', 2017, 'JKL012', '2.0 TDI', 'Hybrid', 'Manual', 6, 48.84, 'tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(30, 'BMW', 'XC90', 2023, 'YZA567', '2.0 Turbo', 'Diesel', 'Manual', 3, 89.92, 'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(31, 'Volvo', 'E-Class', 2024, 'VWX234', '1.5 Hybrid', 'Petrol', 'Manual', 2, 114.55, 'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 'https://example.com/image1.jpg', 'rented', '0000-00-00 00:00:00'),
(32, 'Skoda', 'XC90', 2014, 'ABC123', '3.0 Diesel', 'Electric', 'Automatic', 6, 175.37, 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(33, 'Hyundai', '3 Series', 2017, 'VWX234', '2.0 Turbo', 'Electric', 'Manual', 3, 147.87, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(34, 'Volvo', 'Tucson', 2012, 'GHI789', '2.0 Turbo', 'Petrol', 'Automatic', 7, 128.92, 'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(35, 'Volvo', '3 Series', 2020, 'STU901', '2.0 Turbo', 'Petrol', 'Automatic', 6, 118.18, 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(36, 'Ford', 'A4', 2017, 'STU901', '2.0 Turbo', 'Diesel', 'Automatic', 6, 29.72, 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(37, 'Toyota', 'Camry', 2023, 'YZA567', '2.0 TDI', 'Electric', 'Automatic', 2, 89.54, 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(38, 'Toyota', 'XC90', 2024, 'JKL012', '2.0 TDI', 'Petrol', 'Automatic', 6, 188.26, 'nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(39, 'Audi', '3 Series', 2020, 'BCD890', '1.5 Hybrid', 'Electric', 'Automatic', 6, 225.96, 'odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(40, 'Volkswagen', 'Camry', 2015, 'ABC123', '3.0 Diesel', 'Diesel', 'Automatic', 2, 138.48, 'varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(41, 'Volkswagen', 'Golf', 2015, 'YZA567', '2.0 TDI', 'Electric', 'Automatic', 4, 114.74, 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(42, 'Volvo', 'Focus', 2012, 'GHI789', '1.5 Hybrid', 'Hybrid', 'Manual', 2, 238.86, 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(43, 'Ford', '3 Series', 2020, 'ABC123', '2.0 TDI', 'Petrol', 'Manual', 3, 216.40, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(44, 'Audi', '3 Series', 2025, 'STU901', '1.5 Hybrid', 'Electric', 'Automatic', 3, 161.75, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(45, 'Toyota', 'XC90', 2014, 'BCD890', '2.0 Turbo', 'Diesel', 'Manual', 5, 136.52, 'primis in faucibus orci luctus et ultrices posuere cubilia curae', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(46, 'Kia', 'A4', 2016, 'STU901', '2.0 Turbo', 'Petrol', 'Manual', 6, 169.53, 'posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(47, 'Skoda', 'Tucson', 2014, 'STU901', '3.0 Diesel', 'Electric', 'Automatic', 3, 60.88, 'a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 'https://example.com/image1.jpg', 'rented', '0000-00-00 00:00:00'),
(48, 'Hyundai', '3 Series', 2012, 'DEF456', '1.5 Hybrid', 'Hybrid', 'Automatic', 4, 38.43, 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 'https://example.com/image1.jpg', 'rented', '0000-00-00 00:00:00'),
(49, 'Skoda', 'Sportage', 2021, 'GHI789', '2.0 TDI', 'Diesel', 'Automatic', 3, 231.94, 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(50, 'Ford', 'Tucson', 2018, 'GHI789', '1.5 Hybrid', 'Hybrid', 'Manual', 6, 150.23, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(51, 'Kia', 'Sportage', 2017, 'STU901', '1.5 Hybrid', 'Hybrid', 'Automatic', 8, 39.79, 'tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(52, 'Toyota', 'E-Class', 2025, 'ABC123', '2.0 TDI', 'Electric', 'Manual', 4, 131.87, 'felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(53, 'Skoda', 'Golf', 2022, 'DEF456', '3.0 Diesel', 'Petrol', 'Automatic', 6, 158.74, 'proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(54, 'BMW', 'Sportage', 2022, 'STU901', '2.0 TDI', 'Petrol', 'Manual', 6, 94.66, 'nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(55, 'Toyota', 'Octavia', 2018, 'ABC123', '2.0 Turbo', 'Petrol', 'Automatic', 8, 153.88, 'odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(56, 'BMW', 'Camry', 2022, 'YZA567', '3.0 Diesel', 'Hybrid', 'Automatic', 4, 127.56, 'dui nec nisi volutpat eleifend donec ut dolor morbi vel', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(57, 'Hyundai', 'Focus', 2017, 'ABC123', '2.0 Turbo', 'Petrol', 'Manual', 4, 68.75, 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(58, 'Toyota', 'Sportage', 2025, 'JKL012', '2.0 TDI', 'Electric', 'Manual', 6, 171.35, 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(59, 'Toyota', '3 Series', 2022, 'VWX234', '3.0 Diesel', 'Hybrid', 'Automatic', 2, 245.84, 'ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(60, 'Ford', 'Golf', 2024, 'STU901', '3.0 Diesel', 'Hybrid', 'Manual', 7, 238.41, 'nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(61, 'Ford', 'A4', 2023, 'BCD890', '1.5 Hybrid', 'Electric', 'Manual', 3, 90.66, 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(62, 'Toyota', 'XC90', 2019, 'DEF456', '1.5 Hybrid', 'Petrol', 'Manual', 3, 124.17, 'ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(63, 'Audi', '3 Series', 2014, 'YZA567', '1.5 Hybrid', 'Electric', 'Automatic', 3, 119.31, 'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(64, 'Skoda', 'XC90', 2019, 'ABC123', '3.0 Diesel', 'Electric', 'Manual', 3, 228.90, 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(65, 'Hyundai', 'Tucson', 2019, 'STU901', '3.0 Diesel', 'Petrol', 'Manual', 2, 194.26, 'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(66, 'Hyundai', '3 Series', 2019, 'MNO345', '3.0 Diesel', 'Diesel', 'Manual', 7, 69.37, 'ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(67, 'Volvo', 'XC90', 2015, 'GHI789', '2.0 Turbo', 'Diesel', 'Manual', 6, 190.90, 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(68, 'Kia', 'Sportage', 2018, 'STU901', '3.0 Diesel', 'Diesel', 'Automatic', 8, 83.72, 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(69, 'Kia', 'Tucson', 2025, 'JKL012', '1.5 Hybrid', 'Hybrid', 'Manual', 6, 122.44, 'consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(70, 'Audi', 'A4', 2016, 'MNO345', '1.5 Hybrid', 'Hybrid', 'Automatic', 3, 228.10, 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(71, 'Skoda', 'Tucson', 2018, 'DEF456', '2.0 TDI', 'Hybrid', 'Manual', 2, 151.56, 'in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(72, 'Audi', 'XC90', 2014, 'DEF456', '2.0 Turbo', 'Electric', 'Automatic', 7, 229.55, 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(73, 'Kia', 'A4', 2025, 'BCD890', '2.0 Turbo', 'Diesel', 'Manual', 6, 239.78, 'blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(74, 'Volkswagen', 'Camry', 2012, 'YZA567', '3.0 Diesel', 'Electric', 'Manual', 8, 126.49, 'massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(75, 'Kia', 'XC90', 2021, 'MNO345', '3.0 Diesel', 'Petrol', 'Automatic', 8, 186.76, 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(76, 'Mercedes-Benz', 'Octavia', 2024, 'STU901', '2.0 Turbo', 'Diesel', 'Automatic', 4, 48.91, 'faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(77, 'Volkswagen', 'Tucson', 2025, 'GHI789', '2.0 Turbo', 'Electric', 'Manual', 8, 192.88, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(78, 'Volkswagen', 'Focus', 2025, 'PQR678', '2.0 TDI', 'Electric', 'Manual', 2, 143.88, 'phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(79, 'Audi', 'E-Class', 2021, 'ABC123', '2.0 TDI', 'Electric', 'Manual', 4, 93.71, 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(80, 'Audi', 'Focus', 2015, 'MNO345', '3.0 Diesel', 'Petrol', 'Manual', 6, 85.36, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at', 'https://example.com/image1.jpg', 'rented', '0000-00-00 00:00:00'),
(81, 'Volvo', 'XC90', 2015, 'JKL012', '2.0 Turbo', 'Diesel', 'Manual', 2, 187.74, 'congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(82, 'BMW', 'A4', 2018, 'PQR678', '1.5 Hybrid', 'Diesel', 'Manual', 4, 86.92, 'maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(83, 'Volkswagen', 'Golf', 2013, 'PQR678', '1.5 Hybrid', 'Petrol', 'Automatic', 3, 67.36, 'quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 'https://example.com/image1.jpg', 'rented', '0000-00-00 00:00:00'),
(84, 'Hyundai', '3 Series', 2023, 'DEF456', '3.0 Diesel', 'Petrol', 'Manual', 4, 228.27, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(85, 'Audi', 'E-Class', 2023, 'GHI789', '2.0 TDI', 'Petrol', 'Automatic', 4, 118.97, 'turpis a pede posuere nonummy integer non velit donec diam', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(86, 'Hyundai', 'Focus', 2015, 'PQR678', '2.0 Turbo', 'Hybrid', 'Automatic', 3, 217.75, 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(87, 'Kia', 'XC90', 2019, 'YZA567', '1.5 Hybrid', 'Diesel', 'Automatic', 7, 77.61, 'iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(88, 'Volkswagen', 'Camry', 2013, 'GHI789', '1.5 Hybrid', 'Diesel', 'Automatic', 4, 153.13, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(89, 'Volvo', 'E-Class', 2020, 'DEF456', '2.0 TDI', 'Petrol', 'Automatic', 7, 129.05, 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 'https://example.com/image1.jpg', 'maintenance', '0000-00-00 00:00:00'),
(90, 'Volvo', 'Sportage', 2020, 'GHI789', '1.5 Hybrid', 'Petrol', 'Automatic', 8, 240.17, 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis', 'https://example.com/image2.jpg', 'available', '0000-00-00 00:00:00'),
(91, 'Volkswagen', 'A4', 2025, 'MNO345', '3.0 Diesel', 'Diesel', 'Manual', 4, 193.56, 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(92, 'Mercedes-Benz', 'Sportage', 2016, 'YZA567', '3.0 Diesel', 'Hybrid', 'Manual', 2, 188.55, 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat', 'https://example.com/image2.jpg', 'rented', '0000-00-00 00:00:00'),
(93, 'Hyundai', 'A4', 2015, 'ABC123', '1.5 Hybrid', 'Electric', 'Automatic', 8, 159.69, 'quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 'https://example.com/image3.jpg', 'available', '0000-00-00 00:00:00'),
(94, 'Ford', 'Sportage', 2024, 'JKL012', '1.5 Hybrid', 'Hybrid', 'Manual', 8, 173.90, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(95, 'Toyota', 'Tucson', 2022, 'YZA567', '2.0 Turbo', 'Diesel', 'Automatic', 6, 181.89, 'tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at', 'https://example.com/image2.jpg', 'maintenance', '0000-00-00 00:00:00'),
(96, 'Ford', 'E-Class', 2017, 'GHI789', '1.5 Hybrid', 'Petrol', 'Automatic', 6, 89.59, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(97, 'Volkswagen', 'Camry', 2016, 'GHI789', '2.0 Turbo', 'Diesel', 'Manual', 5, 217.76, 'sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in', 'https://example.com/image3.jpg', 'maintenance', '0000-00-00 00:00:00'),
(98, 'Volkswagen', 'XC90', 2013, 'GHI789', '1.5 Hybrid', 'Hybrid', 'Manual', 6, 242.90, 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue', 'https://example.com/image3.jpg', 'rented', '0000-00-00 00:00:00'),
(99, 'BMW', 'Octavia', 2016, 'STU901', '3.0 Diesel', 'Petrol', 'Automatic', 2, 226.85, 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus', 'https://example.com/image1.jpg', 'available', '0000-00-00 00:00:00'),
(100, 'Kia', 'Camry', 2018, 'VWX234', '1.5 Hybrid', 'Hübriid', 'Automatic', 5, 29.35, 'sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra', 'https://example.com/image1.jpg', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','active','cancelled','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `car_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`) VALUES
(1, 1, 1, '0000-00-00', '0000-00-00', 220.00, 'cancelled', '2026-06-06 21:00:00'),
(2, 2, 2, '0000-00-00', '0000-00-00', 419.76, 'pending', '2026-06-06 21:00:00'),
(3, 3, 3, '0000-00-00', '0000-00-00', 143.57, 'active', '2026-06-06 21:00:00'),
(4, 4, 4, '0000-00-00', '0000-00-00', 104.22, 'active', '2026-06-06 21:00:00'),
(5, 5, 5, '0000-00-00', '0000-00-00', 145.50, 'cancelled', '2026-06-06 21:00:00'),
(6, 6, 6, '0000-00-00', '0000-00-00', 278.22, 'active', '2026-06-06 21:00:00'),
(7, 7, 7, '0000-00-00', '0000-00-00', 244.86, 'active', '2026-06-06 21:00:00'),
(8, 8, 8, '0000-00-00', '0000-00-00', 307.74, 'completed', '2026-06-06 21:00:00'),
(9, 9, 9, '0000-00-00', '0000-00-00', 389.75, 'active', '2026-06-06 21:00:00'),
(10, 10, 10, '0000-00-00', '0000-00-00', 381.58, 'completed', '2026-06-06 21:00:00'),
(11, 11, 11, '0000-00-00', '0000-00-00', 458.39, 'completed', '2026-06-06 21:00:00'),
(12, 12, 12, '0000-00-00', '0000-00-00', 302.09, 'cancelled', '2026-06-06 21:00:00'),
(13, 13, 13, '0000-00-00', '0000-00-00', 489.30, 'cancelled', '2026-06-06 21:00:00'),
(14, 14, 14, '0000-00-00', '0000-00-00', 447.69, 'cancelled', '2026-06-06 21:00:00'),
(15, 15, 15, '0000-00-00', '0000-00-00', 118.97, 'completed', '2026-06-06 21:00:00'),
(16, 16, 16, '0000-00-00', '0000-00-00', 177.16, 'pending', '2026-06-06 21:00:00'),
(17, 17, 17, '0000-00-00', '0000-00-00', 98.04, 'cancelled', '2026-06-06 21:00:00'),
(18, 18, 18, '0000-00-00', '0000-00-00', 202.78, 'cancelled', '2026-06-06 21:00:00'),
(19, 19, 19, '0000-00-00', '0000-00-00', 444.97, 'pending', '2026-06-06 21:00:00'),
(20, 20, 20, '0000-00-00', '0000-00-00', 209.79, 'cancelled', '2026-06-06 21:00:00'),
(21, 21, 21, '0000-00-00', '0000-00-00', 166.56, 'active', '2026-06-06 21:00:00'),
(22, 22, 22, '0000-00-00', '0000-00-00', 466.99, 'active', '2026-06-06 21:00:00'),
(23, 23, 23, '0000-00-00', '0000-00-00', 329.24, 'completed', '2026-06-06 21:00:00'),
(24, 24, 24, '0000-00-00', '0000-00-00', 72.23, 'active', '2026-06-06 21:00:00'),
(25, 25, 25, '0000-00-00', '0000-00-00', 177.44, 'pending', '2026-06-06 21:00:00'),
(26, 26, 26, '0000-00-00', '0000-00-00', 338.52, 'cancelled', '2026-06-06 21:00:00'),
(27, 27, 27, '0000-00-00', '0000-00-00', 326.04, 'pending', '2026-06-06 21:00:00'),
(28, 28, 28, '0000-00-00', '0000-00-00', 88.46, 'completed', '2026-06-06 21:00:00'),
(29, 29, 29, '0000-00-00', '0000-00-00', 244.83, 'active', '2026-06-06 21:00:00'),
(30, 30, 30, '0000-00-00', '0000-00-00', 297.46, 'pending', '2026-06-06 21:00:00'),
(31, 31, 31, '0000-00-00', '0000-00-00', 290.91, 'active', '2026-06-06 21:00:00'),
(32, 32, 32, '0000-00-00', '0000-00-00', 136.59, 'completed', '2026-06-06 21:00:00'),
(33, 33, 33, '0000-00-00', '0000-00-00', 273.59, 'pending', '2026-06-06 21:00:00'),
(34, 34, 34, '0000-00-00', '0000-00-00', 65.50, 'cancelled', '2026-06-06 21:00:00'),
(35, 35, 35, '0000-00-00', '0000-00-00', 111.12, 'active', '2026-06-06 21:00:00'),
(36, 36, 36, '0000-00-00', '0000-00-00', 191.03, 'completed', '2026-06-06 21:00:00'),
(37, 37, 37, '0000-00-00', '0000-00-00', 90.59, 'pending', '2026-06-06 21:00:00'),
(38, 38, 38, '0000-00-00', '0000-00-00', 236.81, 'active', '2026-06-06 21:00:00'),
(39, 39, 39, '0000-00-00', '0000-00-00', 97.92, 'cancelled', '2026-06-06 21:00:00'),
(40, 40, 40, '0000-00-00', '0000-00-00', 251.97, 'completed', '2026-06-06 21:00:00'),
(41, 41, 41, '0000-00-00', '0000-00-00', 426.33, 'completed', '2026-06-06 21:00:00'),
(42, 42, 42, '0000-00-00', '0000-00-00', 236.81, 'completed', '2026-06-06 21:00:00'),
(43, 43, 43, '0000-00-00', '0000-00-00', 307.54, 'active', '2026-06-06 21:00:00'),
(44, 44, 44, '0000-00-00', '0000-00-00', 240.94, 'cancelled', '2026-06-06 21:00:00'),
(45, 45, 45, '0000-00-00', '0000-00-00', 483.50, 'cancelled', '2026-06-06 21:00:00'),
(46, 46, 46, '0000-00-00', '0000-00-00', 69.02, 'pending', '2026-06-06 21:00:00'),
(47, 47, 47, '0000-00-00', '0000-00-00', 135.81, 'active', '2026-06-06 21:00:00'),
(48, 48, 48, '0000-00-00', '0000-00-00', 389.54, 'pending', '2026-06-06 21:00:00'),
(49, 49, 49, '0000-00-00', '0000-00-00', 59.92, 'pending', '2026-06-06 21:00:00'),
(50, 50, 50, '0000-00-00', '0000-00-00', 478.49, 'cancelled', '2026-06-06 21:00:00'),
(51, 51, 51, '0000-00-00', '0000-00-00', 121.12, 'cancelled', '2026-06-06 21:00:00'),
(52, 52, 52, '0000-00-00', '0000-00-00', 153.63, 'completed', '2026-06-06 21:00:00'),
(53, 53, 53, '0000-00-00', '0000-00-00', 200.94, 'pending', '2026-06-06 21:00:00'),
(54, 54, 54, '0000-00-00', '0000-00-00', 193.66, 'active', '2026-06-06 21:00:00'),
(55, 55, 55, '0000-00-00', '0000-00-00', 491.49, 'cancelled', '2026-06-06 21:00:00'),
(56, 56, 56, '0000-00-00', '0000-00-00', 266.66, 'cancelled', '2026-06-06 21:00:00'),
(57, 57, 57, '0000-00-00', '0000-00-00', 268.99, 'completed', '2026-06-06 21:00:00'),
(58, 58, 58, '0000-00-00', '0000-00-00', 476.92, 'active', '2026-06-06 21:00:00'),
(59, 59, 59, '0000-00-00', '0000-00-00', 415.41, 'active', '2026-06-06 21:00:00'),
(60, 60, 60, '0000-00-00', '0000-00-00', 84.41, 'pending', '2026-06-06 21:00:00'),
(61, 61, 61, '0000-00-00', '0000-00-00', 450.37, 'active', '2026-06-06 21:00:00'),
(62, 62, 62, '0000-00-00', '0000-00-00', 88.46, 'active', '2026-06-06 21:00:00'),
(63, 63, 63, '0000-00-00', '0000-00-00', 210.72, 'completed', '2026-06-06 21:00:00'),
(64, 64, 64, '0000-00-00', '0000-00-00', 126.11, 'pending', '2026-06-06 21:00:00'),
(65, 65, 65, '0000-00-00', '0000-00-00', 164.72, 'active', '2026-06-06 21:00:00'),
(66, 66, 66, '0000-00-00', '0000-00-00', 317.19, 'cancelled', '2026-06-06 21:00:00'),
(67, 67, 67, '0000-00-00', '0000-00-00', 434.04, 'cancelled', '2026-06-06 21:00:00'),
(68, 68, 68, '0000-00-00', '0000-00-00', 93.72, 'cancelled', '2026-06-06 21:00:00'),
(69, 69, 69, '0000-00-00', '0000-00-00', 483.67, 'cancelled', '2026-06-06 21:00:00'),
(70, 70, 70, '0000-00-00', '0000-00-00', 111.44, 'active', '2026-06-06 21:00:00'),
(71, 71, 71, '0000-00-00', '0000-00-00', 300.58, 'completed', '2026-06-06 21:00:00'),
(72, 72, 72, '0000-00-00', '0000-00-00', 445.37, 'completed', '2026-06-06 21:00:00'),
(73, 73, 73, '0000-00-00', '0000-00-00', 199.50, 'active', '2026-06-06 21:00:00'),
(74, 74, 74, '0000-00-00', '0000-00-00', 421.44, 'active', '2026-06-06 21:00:00'),
(75, 75, 75, '0000-00-00', '0000-00-00', 149.13, 'completed', '2026-06-06 21:00:00'),
(76, 76, 76, '0000-00-00', '0000-00-00', 218.08, 'pending', '2026-06-06 21:00:00'),
(77, 77, 77, '0000-00-00', '0000-00-00', 469.38, 'pending', '2026-06-06 21:00:00'),
(78, 78, 78, '0000-00-00', '0000-00-00', 383.28, 'cancelled', '2026-06-06 21:00:00'),
(79, 79, 79, '0000-00-00', '0000-00-00', 147.01, 'pending', '2026-06-06 21:00:00'),
(80, 80, 80, '0000-00-00', '0000-00-00', 164.18, 'cancelled', '2026-06-06 21:00:00'),
(81, 81, 81, '0000-00-00', '0000-00-00', 67.26, 'active', '2026-06-06 21:00:00'),
(82, 82, 82, '0000-00-00', '0000-00-00', 437.73, 'active', '2026-06-06 21:00:00'),
(83, 83, 83, '0000-00-00', '0000-00-00', 338.29, 'completed', '2026-06-06 21:00:00'),
(84, 84, 84, '0000-00-00', '0000-00-00', 413.04, 'active', '2026-06-06 21:00:00'),
(85, 85, 85, '0000-00-00', '0000-00-00', 431.95, 'pending', '2026-06-06 21:00:00'),
(86, 86, 86, '0000-00-00', '0000-00-00', 76.54, 'cancelled', '2026-06-06 21:00:00'),
(87, 87, 87, '0000-00-00', '0000-00-00', 481.81, 'cancelled', '2026-06-06 21:00:00'),
(88, 88, 88, '0000-00-00', '0000-00-00', 61.50, 'completed', '2026-06-06 21:00:00'),
(89, 89, 89, '0000-00-00', '0000-00-00', 498.46, 'completed', '2026-06-06 21:00:00'),
(90, 90, 90, '0000-00-00', '0000-00-00', 100.95, 'cancelled', '2026-06-06 21:00:00'),
(91, 91, 91, '0000-00-00', '0000-00-00', 162.41, 'pending', '2026-06-06 21:00:00'),
(92, 92, 92, '0000-00-00', '0000-00-00', 247.75, 'cancelled', '2026-06-06 21:00:00'),
(93, 93, 93, '0000-00-00', '0000-00-00', 198.13, 'cancelled', '2026-06-06 21:00:00'),
(94, 94, 94, '0000-00-00', '0000-00-00', 237.66, 'cancelled', '2026-06-06 21:00:00'),
(95, 95, 95, '0000-00-00', '0000-00-00', 426.13, 'active', '2026-06-06 21:00:00'),
(96, 96, 96, '0000-00-00', '0000-00-00', 135.61, 'pending', '2026-06-06 21:00:00'),
(97, 97, 97, '0000-00-00', '0000-00-00', 385.48, 'cancelled', '2026-06-06 21:00:00'),
(98, 98, 98, '0000-00-00', '0000-00-00', 147.81, 'pending', '2026-06-06 21:00:00'),
(99, 99, 99, '0000-00-00', '0000-00-00', 367.64, 'cancelled', '2026-06-06 21:00:00'),
(100, 100, 100, '0000-00-00', '0000-00-00', 358.64, 'pending', '2026-06-06 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES
(1, 'user', 'Hayyim', 'Brammer', 'hbrammer0@w3.org', '8901330058', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(2, 'user', 'Kitty', 'Ericsson', 'kericsson1@furl.net', '8912493998', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(3, 'admin', 'Niel', 'Kissick', 'nkissick2@technorati.com', '2059972467', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(4, 'user', 'Elvyn', 'Lenoir', 'elenoir3@histats.com', '9262731966', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(5, 'admin', 'Milena', 'Megroff', 'mmegroff4@yolasite.com', '6914907619', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(6, 'user', 'Natividad', 'Valentine', 'nvalentine5@engadget.com', '4406751035', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(7, 'user', 'Cinda', 'Rigglesford', 'crigglesford6@elegantthemes.com', '6044206031', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(8, 'user', 'Rubina', 'Dudgeon', 'rdudgeon7@biblegateway.com', '8437729669', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(9, 'user', 'Kriste', 'Fairman', 'kfairman8@examiner.com', '6757549783', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(10, 'user', 'Helena', 'Paulat', 'hpaulat9@blogger.com', '2752656082', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(11, 'user', 'Linell', 'Portt', 'lportta@furl.net', '1716686232', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(12, 'user', 'Frank', 'Watsham', 'fwatshamb@whitehouse.gov', '9556522005', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(13, 'user', 'Henriette', 'Giannassi', 'hgiannassic@miitbeian.gov.cn', '9571072569', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(14, 'user', 'Hatti', 'Longo', 'hlongod@biglobe.ne.jp', '1186425352', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(15, 'user', 'Lanie', 'Ovell', 'lovelle@auda.org.au', '8277964995', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(16, 'user', 'Blakeley', 'Chansonne', 'bchansonnef@europa.eu', '5601759696', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(17, 'user', 'Gregor', 'Dybbe', 'gdybbeg@pbs.org', '2169833611', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(18, 'user', 'Netti', 'Swyre', 'nswyreh@tripadvisor.com', '3065959338', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(19, 'user', 'Sibyl', 'Korous', 'skorousi@webeden.co.uk', '2535909411', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(20, 'user', 'Jarrett', 'Gallaher', 'jgallaherj@g.co', '7497827552', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(21, 'user', 'Ricardo', 'Walch', 'rwalchk@accuweather.com', '2535579971', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(22, 'user', 'Cord', 'Croxall', 'ccroxalll@mapquest.com', '9339021301', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(23, 'user', 'Bayard', 'Franschini', 'bfranschinim@reddit.com', '5581380960', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(24, 'user', 'Riva', 'Paddy', 'rpaddyn@fastcompany.com', '5246378421', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(25, 'user', 'Dorene', 'Poulett', 'dpouletto@ca.gov', '7551259559', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(26, 'user', 'Keene', 'Vatcher', 'kvatcherp@wiley.com', '8036538023', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(27, 'user', 'Caryn', 'Millwall', 'cmillwallq@goo.ne.jp', '6147051392', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(28, 'user', 'Dinah', 'Habercham', 'dhaberchamr@bloglines.com', '1516702132', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(29, 'user', 'Johnnie', 'Tupling', 'jtuplings@cam.ac.uk', '7399637842', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(30, 'user', 'Bernadine', 'Alexandre', 'balexandret@exblog.jp', '6831405922', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(31, 'user', 'Agnesse', 'Burchill', 'aburchillu@java.com', '4155128076', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(32, 'user', 'Guido', 'Orridge', 'gorridgev@bloglovin.com', '9613484029', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(33, 'user', 'Cam', 'Whoston', 'cwhostonw@feedburner.com', '6623650921', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(34, 'user', 'Jaclin', 'Tims', 'jtimsx@ehow.com', '1689938539', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(35, 'user', 'Barry', 'Downage', 'bdownagey@mtv.com', '2529798396', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(36, 'user', 'Trumann', 'Leale', 'tlealez@twitter.com', '7998638922', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(37, 'user', 'Lonnie', 'Train', 'ltrain10@disqus.com', '9621258966', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(38, 'user', 'Trudey', 'Clemenzi', 'tclemenzi11@gmpg.org', '3721369663', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(39, 'admin', 'Isabeau', 'Vaughan', 'ivaughan12@webs.com', '5509747924', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(40, 'user', 'Immanuel', 'Woolsey', 'iwoolsey13@about.com', '1447827850', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(41, 'user', 'Randall', 'Lebreton', 'rlebreton14@hugedomains.com', '5125452568', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(42, 'user', 'Angus', 'Colwell', 'acolwell15@mapquest.com', '2478030368', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(43, 'user', 'Tuckie', 'Bagley', 'tbagley16@arizona.edu', '7326443299', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(44, 'user', 'Ram', 'Showell', 'rshowell17@addtoany.com', '5902652916', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(45, 'user', 'Tova', 'Rieme', 'trieme18@yahoo.com', '5652247140', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(46, 'user', 'Nelle', 'Tuxsell', 'ntuxsell19@skyrock.com', '2167168614', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(47, 'user', 'Gayleen', 'Tape', 'gtape1a@sun.com', '5168107410', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(48, 'admin', 'Dianne', 'Giercke', 'dgiercke1b@scribd.com', '7247780102', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(49, 'user', 'Wallie', 'Slad', 'wslad1c@arstechnica.com', '1923032315', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(50, 'user', 'Billi', 'Chillistone', 'bchillistone1d@sfgate.com', '2888639777', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(51, 'user', 'Herminia', 'Winser', 'hwinser1e@nytimes.com', '8799409823', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(52, 'user', 'Jesse', 'Tetsall', 'jtetsall1f@seattletimes.com', '2384287322', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(53, 'user', 'Ewan', 'Lowe', 'elowe1g@nature.com', '4392224372', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(54, 'user', 'Prince', 'Wield', 'pwield1h@fotki.com', '5216924551', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(55, 'user', 'Renae', 'Gregan', 'rgregan1i@prweb.com', '4296792099', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(56, 'user', 'Anna-diane', 'Erdis', 'aerdis1j@hhs.gov', '1308846344', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(57, 'user', 'Vanya', 'Skett', 'vskett1k@toplist.cz', '5334170828', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(58, 'user', 'Ennis', 'Jandel', 'ejandel1l@reuters.com', '4636368939', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(59, 'user', 'Haze', 'Stollsteiner', 'hstollsteiner1m@imdb.com', '7943591934', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(60, 'user', 'Paulina', 'Clothier', 'pclothier1n@imageshack.us', '2127332106', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(61, 'user', 'Berke', 'Bough', 'bbough1o@youtu.be', '3049428077', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(62, 'user', 'Humfrid', 'Gowrich', 'hgowrich1p@theglobeandmail.com', '2373319691', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(63, 'user', 'Emelina', 'Laphorn', 'elaphorn1q@blogger.com', '1176361990', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(64, 'user', 'Noel', 'Rothera', 'nrothera1r@elpais.com', '6889363067', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(65, 'user', 'Orelle', 'Kenrat', 'okenrat1s@blogger.com', '8296718510', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(66, 'user', 'Baldwin', 'Jirik', 'bjirik1t@weather.com', '3285644773', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(67, 'user', 'Christian', 'Folan', 'cfolan1u@ustream.tv', '2297745617', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(68, 'user', 'Raddy', 'Drayn', 'rdrayn1v@delicious.com', '1861922776', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(69, 'admin', 'Zacharia', 'Gover', 'zgover1w@admin.ch', '8502754831', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(70, 'user', 'Benjamin', 'Comelli', 'bcomelli1x@gov.uk', '3265104379', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(71, 'user', 'Alyse', 'Keyse', 'akeyse1y@aboutads.info', '8204282238', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(72, 'user', 'Elyse', 'Gilhooley', 'egilhooley1z@thetimes.co.uk', '3724855984', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(73, 'user', 'Hendrik', 'Lighterness', 'hlighterness20@nih.gov', '2131690497', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(74, 'user', 'Florette', 'Chaperling', 'fchaperling21@rediff.com', '6483035045', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(75, 'user', 'Brear', 'Thackwray', 'bthackwray22@ucla.edu', '4988727598', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(76, 'user', 'Davita', 'Keeble', 'dkeeble23@godaddy.com', '7766359895', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(77, 'user', 'Zacharie', 'Billyeald', 'zbillyeald24@hexun.com', '8956769861', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(78, 'user', 'Clare', 'Smyley', 'csmyley25@europa.eu', '4448158464', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(79, 'admin', 'Zeke', 'O\'Mailey', 'zomailey26@amazon.com', '5386625201', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(80, 'user', 'Josiah', 'Garmston', 'jgarmston27@nytimes.com', '9317862824', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(81, 'user', 'Rickie', 'Hinsche', 'rhinsche28@hc360.com', '3043376730', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(82, 'user', 'Louie', 'Martins', 'lmartins29@lulu.com', '3571635300', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(83, 'user', 'Howey', 'Gaythwaite', 'hgaythwaite2a@myspace.com', '3156337666', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(84, 'user', 'Udale', 'Pecha', 'upecha2b@smh.com.au', '1038189611', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(85, 'user', 'Nate', 'Ors', 'nors2c@ocn.ne.jp', '6389610618', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(86, 'admin', 'Callie', 'Mallia', 'cmallia2d@i2i.jp', '1283610082', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(87, 'admin', 'Gael', 'Grieger', 'ggrieger2e@people.com.cn', '6743162282', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(88, 'user', 'Steffane', 'Muccino', 'smuccino2f@theguardian.com', '9251169359', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(89, 'user', 'Cosme', 'Leander', 'cleander2g@sun.com', '4058294001', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(90, 'user', 'Lauritz', 'Woodrup', 'lwoodrup2h@hubpages.com', '1023864295', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(91, 'user', 'Ashlen', 'Randlesome', 'arandlesome2i@cisco.com', '1859060534', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(92, 'user', 'Clementine', 'Tregunna', 'ctregunna2j@yellowbook.com', '9352258883', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(93, 'user', 'Marja', 'Hush', 'mhush2k@opera.com', '7367899111', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(94, 'user', 'Blondelle', 'Tyreman', 'btyreman2l@admin.ch', '5426204802', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(95, 'user', 'Neila', 'Zollner', 'nzollner2m@reference.com', '3538644584', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(96, 'user', 'Karita', 'Plaster', 'kplaster2n@craigslist.org', '3991007175', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(97, 'user', 'Antoinette', 'Juniper', 'ajuniper2o@constantcontact.com', '4927158624', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(98, 'user', 'Darnell', 'Lowman', 'dlowman2p@fc2.com', '5195266726', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(99, 'user', 'Leonerd', 'Silberschatz', 'lsilberschatz2q@moonfruit.com', '2918387235', 'hashed_password_placeholder', '0000-00-00 00:00:00'),
(100, 'user', 'Benedetto', 'Sabbins', 'bsabbins2r@wikispaces.com', '4452976483', '$2y$10$xJ6imk0CKE2Klh3Ro.wvHuCx5aCGGaIPKIHosxtdVu1cTcw3Qn682', '0000-00-00 00:00:00'),
(101, 'admin', 'sss', 'sss', 'sss@gmail.com', '55555555', '$2y$10$psoU68WooPcFewEP81nZ6OQHUhSC5l7.TWBfXrHGHCdMuwLfwKqWK', '2026-06-07 16:32:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
