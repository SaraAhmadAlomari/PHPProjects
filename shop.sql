-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2023 at 05:59 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  `visibillity` tinyint(4) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(4) NOT NULL DEFAULT 0,
  `allow_ads` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `name`, `description`, `parent`, `ordering`, `visibillity`, `allow_comments`, `allow_ads`) VALUES
(18, 'Books', 'pdf books', 0, 0, 0, 1, 0),
(19, 'Computers', '', 0, 0, 0, 0, 1),
(20, 'Video Games', '', 0, 0, 0, 0, 0),
(21, 'Toys&Games', '', 0, 0, 0, 0, 0),
(22, 'History Books', '', 18, 0, 0, 0, 0),
(23, 'Novels', '', 18, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `comment_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `comment`, `status`, `comment_date`, `item_id`, `user_id`) VALUES
(100, 'Good book', 1, '2023-12-04', 50, 36);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `add_data` date NOT NULL,
  `country_made` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `rating` smallint(6) NOT NULL,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `member_ID` int(11) NOT NULL,
  `cat_ID` int(11) NOT NULL,
  `tags` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_ID`, `name`, `description`, `add_data`, `country_made`, `price`, `status`, `rating`, `approve`, `image`, `member_ID`, `cat_ID`, `tags`) VALUES
(49, 'Greer Lankton', 'Sketchbook, September 1977', '2023-12-04', '--', '4$', '1', 0, 0, '930512_Screenshot 2023-12-04 150527.png', 39, 18, ''),
(50, 'Trevor Paglen', 'From the Archives of Peter Merlin, Aviation Archaeologist', '2023-12-04', '--', '6$', '2', 0, 0, '684043_Screenshot 2023-12-04 150719.png', 39, 18, ''),
(51, 'SAMSUNG Galaxy Tab A8 10.5” 32GB', ' Android Tablet, LCD Screen, Kids Content, Smart Switch, Expandable Memory, Long Lasting Battery, Fast Charging', '2023-12-04', 'jordan', '200$', '1', 0, 1, '690601_61krikJxTmL._AC_SX679_.jpg', 37, 19, 'SAMSUNG,Tab '),
(52, 'Apple 2020 MacBook Air Laptop M1', 'Retina Display, 8GB RAM, 256GB SSD Storage, Backlit Keyboard, FaceTime HD Camera, Touch ID. Works with iPhone/iPad;', '2023-12-04', '--', '800$', '1', 0, 1, '62711_71jG+e7roXL._AC_SX679_.jpg', 37, 19, 'Apple ,MacBookAir, SpaceGray'),
(53, ' Mario Kart™ 8Deluxe Bundle', '8 Deluxe Bundle (Full Game Download + 3 Mo. Nintendo Switch Online Membership Included)', '2023-12-04', '--', '300$', '3', 0, 1, '303990_811vxk7WqNL._SX522_.jpg', 38, 20, 'BestSeller'),
(54, 'MARVEL’S SPIDER-MAN ', ' PS5 Launch Edition', '2023-12-04', '--', '150$', '1', 0, 1, '922652_81VGpLvXQuL._SX522_.jpg', 36, 20, 'BestSeller'),
(55, 'Taco Cat Goat Cheese Pizza', 'PLAY IT ANY TIME ANY PLACE- Convenient take anywhere size game.', '2023-12-04', 'jordan', '30$', '1', 0, 1, '662015_61B7mux9lIL._AC_SX679_.jpg', 36, 21, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL COMMENT 'to identify user',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'username to login',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'password to login',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupID` int(11) NOT NULL DEFAULT 0 COMMENT 'identify user group',
  `trustStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'seller rank',
  `regStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'user approval',
  `RegDate` date DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `email`, `fullname`, `groupID`, `trustStatus`, `regStatus`, `RegDate`, `avatar`) VALUES
(3, 'sara', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'sara100@gmail.com', 'Sara Ahmad alomari', 1, 0, 1, NULL, ''),
(36, 'ali100', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'ali@gmail.com', 'ali omari', 0, 0, 1, '2023-12-04', '12968_—Pngtree—career office business boy_4592078.png'),
(37, 'mohammed', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'moh@gmail.com', 'mohammed Ali', 0, 0, 1, '2023-12-04', '440818_1.png'),
(38, 'dema', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'dema@gmail.com', 'dema ali', 0, 0, 1, '2023-12-04', '564634_2.png'),
(39, 'layla', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'l@gmail.com', 'layla mohammed', 0, 0, 1, '2023-12-04', '339372_Screenshot 2023-12-04 145705.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_ID`),
  ADD KEY `member_ID` (`member_ID`),
  ADD KEY `items_ibfk_2` (`cat_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'to identify user', AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`userID`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`member_ID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`cat_ID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
