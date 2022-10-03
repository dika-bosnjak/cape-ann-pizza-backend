-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 03, 2022 at 05:03 PM
-- Server version: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Veg'),
(2, 'Non-Veg');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `ingredients` varchar(350) DEFAULT NULL,
  `picture_link` varchar(350) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `rating`, `price`, `description`, `ingredients`, `picture_link`, `category_id`) VALUES
(1, 'Capricciosa 1', 5, 10.5, 'Description Test 1', 'tomato puree, mozzarella, cremini mushrooms, artichoke hearts, black olives', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDAVJ3XGdLctr-QKNf6bSlVj01XH6nDgtBZA&usqp=CAU', 2),
(2, 'Veggie', 3, 12.5, 'Description 2', 'Fresh tomatoes, onions, arugula, kale, eggplants, bell peppers, spinach, zucchini, mushrooms', 'https://www.twopeasandtheirpod.com/wp-content/uploads/2021/03/Veggie-Pizza-8.jpg', 2),
(4, 'Margherita', 5, 9.5, 'Description Test ', 'tomato puree, mozzarella, cremini mushrooms, artichoke hearts, black olives', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDAVJ3XGdLctr-QKNf6bSlVj01XH6nDgtBZA&usqp=CAU', 2),
(5, 'Margherita Test', 5, 10.5, 'Description 5', 'tomato puree, mozzarella, cremini mushrooms, artichoke hearts, black olives', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDAVJ3XGdLctr-QKNf6bSlVj01XH6nDgtBZA&usqp=CAU', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
