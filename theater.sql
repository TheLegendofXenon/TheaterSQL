-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2020 at 07:46 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theater`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditorium`
--

CREATE TABLE `auditorium` (
  `AuditID` int(11) NOT NULL,
  `ScreenType` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auditorium`
--

INSERT INTO `auditorium` (`AuditID`, `ScreenType`, `Capacity`) VALUES
(1, 'Dolby', 100),
(2, 'IMAX', 250),
(3, 'ReaID 3D', 150),
(4, 'RPX', 100),
(5, 'Dolby', 150),
(6, 'RPX', 120),
(7, '2D', 250),
(8, 'ReaID 3D', 200),
(9, 'IMAX', 150),
(10, '2D', 230);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNumber` bigint(11) NOT NULL,
  `LoginName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustID`, `Name`, `Email`, `PhoneNumber`, `LoginName`, `Password`) VALUES
(1, 'Gaylord Balcom', 'tamstouch@gmail.com', 7273947596, 'gaylor5674', 'timetogoMa1'),
(2, 'Micheal Tansill', 'cgrimleyg@aol.com', 4839848924, 'mtanre4739', 'thatswhyihateyou34'),
(3, 'Shannon Halstead', 'cgrimsley@hotmail.com', 7490365285, 'gregbraun@gamil.com', 'fuiwehftimetogo'),
(4, 'Jim Russell', 'tommy@gmail.com', 8485038445, 'birdman@gmail.com', 'nfuerhfhdwiw3456'),
(5, 'Karen Gibbs', 'piggylady@gmail.com', 5947593345, 'fremontcone@gmail.com', 'vnekshakeitoff'),
(6, 'Sawsan Toma', 'thegodfater@gmail.com', 4983905739, 'leatherpants@gmail.com', 'giurehgitakemyheart'),
(7, 'Valeri Pletnew', 'uncleborya@aol.com', 4658035284, 'tonia_love', 'coachman!court'),
(8, 'Shawn Nybo', 'gryme1@gmail.com', 7194699083, 'sjackson6734', 'jpsmith5467'),
(9, 'Daniel Castle', 'jamesbig@gmail.com', 7438956732, 'marciaperez', 'emestily@try'),
(10, 'Tammy Thomas', 'whiteset@gmail.com', 5473972274, 'kristinarosa', 'daddytretan'),
(11, 'Brian Pattick', 'brain@gmail.com', 7273456789, 'brian_brain', 'Password'),
(12, 'Nathan Drake', 'nathandrake@gmail.com', 7271234567, 'UnchartedBoi', 'PS4_100%');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerview`
-- (See below for the actual view)
--
CREATE TABLE `customerview` (
`CustID` int(11)
,`Name` varchar(50)
,`Email` varchar(50)
,`PhoneNumber` bigint(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNumber` bigint(11) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `DateOfHire` date NOT NULL,
  `LoginName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Discount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `Name`, `Email`, `PhoneNumber`, `Salary`, `DateOfHire`, `LoginName`, `Password`, `Discount`) VALUES
(0, 'Online Supporter', 'online_supporter@gmail.com', 8123467890, '12000.00', '2000-01-01', 'supporter', 'Supporter', '0.00'),
(1, 'Billy Hatcher', 'bobj@a.metrocast.net', 3729874783, '18000.00', '2016-03-01', 'zaleski784', 'cfkjsithisishard', '10.00'),
(2, 'Jodi De Bord', 'whitest@hotmail.com', 4783903611, '36000.00', '2018-10-14', 'augusta4i49', 'nfwenfei383', '20.00'),
(3, 'Angela Woods', 'kmbrrkc@aol.com', 2694034853, '15000.00', '2018-05-01', 'burlingtondefei', 'feiwhfioewhfioe332', '10.00'),
(4, 'Yvonne Zorrila', 'jasonmoore@gmail.com', 3249823002, '28000.00', '2010-07-05', 'cantonselma', 'fenfg933', '15.00'),
(5, 'Douglas Knox', 'wzaza004@gmail.com', 8403985067, '27000.00', '2019-08-01', 'deutchcircle', 'fewnflkwe', '10.00'),
(6, 'Kimberly Ruffin', 'hawntawn@gmail.com', 4303250934, '14000.00', '2017-05-13', 'cantonselna', 'fweijfopow', '20.00'),
(7, 'Kristine Rosa', 'tjdca@aol.com', 2043423402, '21000.00', '2013-07-01', 'glasscup493', 'nviwgnoiwj', '15.00'),
(8, 'Steve Dady', 'toscameshon@gmail.com', 8093268789, '18000.00', '2017-05-12', 'fennhighstreet', 'nsngfoiwhgi', '10.00'),
(9, 'Damon Walker', 'laceyk@hotmail.com', 9246093849, '18500.00', '2019-10-10', 'nonobbeachwood', 'vmvopaj', '15.00'),
(10, 'Tammy Thomas', 'cassh@gmail.com', 3959346785, '22000.00', '2018-12-12', 'overridefeen', 'nveuraniov', '20.00'),
(11, 'Helen Pattrick', 'helen@gmail.com', 7345689023, '10000.00', '2020-04-28', 'helen123', 'helen123456', '5.00'),
(12, 'Vikki Laws', 'vikki@gmail.com', 7273569876, '10000.00', '2020-04-28', 'vikki_laws', 'password', '5.00'),
(13, 'Taylor Swift', 'taylor@gmail.com', 8134567890, '10000.00', '2020-04-28', 'taylor_swift', 'password', '5.00'),
(15, 'Andrew Ryan', 'andrewryan@gmail.com', 7277654321, '10000.00', '2020-04-29', 'MayorOfRapture', 'bioshock100%', '5.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeeview`
-- (See below for the actual view)
--
CREATE TABLE `employeeview` (
`EmpID` int(11)
,`Name` varchar(50)
,`Email` varchar(50)
,`PhoneNumber` bigint(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`MovieID`, `Title`, `Category`, `Length`) VALUES
(1, 'The Way Back', 'Drama', '01:48:00'),
(2, 'Blumhouse\'s Fantasy Island', 'Horror', '01:49:00'),
(3, 'Sonic The Hedgehog', 'Animation', '01:38:00'),
(4, 'Like a boss', 'Comedy', '01:23:00'),
(5, 'Bloodshot', 'Action', '01:49:00'),
(6, 'Impractical Joker: The Movie', 'Comedy', '01:33:00'),
(7, 'The Call Of The Wind', 'Adventure', '01:50:00'),
(8, 'The Gentlemen', 'Action', '01:53:00'),
(9, 'Jumanji: The Next Level', 'Action', '02:02:00'),
(10, 'Onward', 'Animation', '01:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `movieshowtime`
--

CREATE TABLE `movieshowtime` (
  `ShowID` int(11) NOT NULL,
  `MovieID` int(11) NOT NULL,
  `Assigned` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `movieshowtime`
--

INSERT INTO `movieshowtime` (`ShowID`, `MovieID`, `Assigned`, `Date`, `Time`) VALUES
(1, 5, 9, '2020-04-16', '10:15:00'),
(2, 6, 8, '2020-04-17', '14:00:00'),
(3, 7, 3, '2020-04-18', '18:25:00'),
(4, 1, 10, '2020-04-17', '09:35:00'),
(5, 4, 4, '2020-04-19', '11:45:00'),
(6, 6, 9, '2020-04-18', '14:55:00'),
(7, 10, 2, '2020-04-19', '15:55:00'),
(8, 2, 7, '2020-04-20', '10:10:00'),
(9, 3, 2, '2020-04-19', '22:45:00'),
(10, 8, 9, '2020-04-20', '21:35:00'),
(11, 6, 2, '2020-04-20', '08:25:00'),
(12, 3, 1, '2020-04-20', '16:35:00'),
(13, 7, 7, '2020-04-21', '10:25:00'),
(14, 2, 6, '2020-04-21', '19:25:00'),
(15, 8, 9, '2020-04-21', '09:45:00'),
(16, 1, 1, '2020-04-23', '09:45:00'),
(17, 9, 9, '2020-04-21', '22:20:00'),
(18, 3, 4, '2020-04-20', '11:10:00'),
(19, 10, 2, '2020-04-23', '23:15:00'),
(20, 8, 1, '2020-04-22', '18:30:00'),
(21, 6, 4, '2020-05-01', '19:00:00'),
(22, 7, 2, '2020-05-01', '09:15:00'),
(23, 5, 6, '2020-04-29', '21:18:00'),
(24, 7, 2, '2020-04-29', '15:25:00'),
(25, 10, 2, '2020-04-28', '11:45:00'),
(26, 8, 2, '2020-04-29', '10:36:00'),
(27, 3, 4, '2020-04-29', '14:35:00'),
(28, 6, 10, '2020-05-03', '18:45:00'),
(29, 2, 3, '2020-05-04', '23:15:00'),
(30, 7, 9, '2020-05-08', '19:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TicketID` int(11) NOT NULL,
  `BuysTicket` int(11) NOT NULL,
  `SellsTicket` int(11) NOT NULL,
  `ShowID` int(11) NOT NULL,
  `RowNumber` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TicketID`, `BuysTicket`, `SellsTicket`, `ShowID`, `RowNumber`, `Price`, `PaymentMethod`) VALUES
(1, 4, 3, 3, 'A10', '12.00', 'Cash'),
(2, 9, 5, 5, 'J15', '9.00', 'Visa'),
(3, 5, 2, 7, 'K10', '10.00', 'Master'),
(4, 7, 8, 9, 'L12', '11.00', 'Giftcard'),
(5, 1, 7, 4, 'G7', '10.50', 'Cash'),
(6, 5, 9, 7, 'F15', '11.00', 'Cash'),
(7, 7, 10, 1, 'D8', '12.00', 'Visa'),
(8, 9, 6, 5, 'H16', '8.80', 'Master'),
(9, 5, 1, 10, 'M8', '11.50', 'Cash'),
(10, 2, 4, 9, 'M12', '10.75', 'Giftcard'),
(11, 5, 7, 20, 'J5', '13.00', 'Visa'),
(12, 6, 7, 17, 'H2', '12.75', 'Giftcard'),
(13, 4, 4, 18, 'F14', '9.55', 'Visa'),
(14, 7, 8, 23, 'D16', '11.67', 'Visa'),
(15, 1, 4, 26, 'H10', '10.45', 'Cash'),
(16, 9, 4, 16, 'G16', '10.40', 'Master'),
(17, 10, 7, 16, 'J18', '9.85', 'Giftcard'),
(18, 9, 5, 20, 'K15', '8.95', 'Cash'),
(19, 3, 1, 17, 'J15', '9.73', 'Visa'),
(20, 2, 7, 14, 'D10', '8.75', 'Master'),
(21, 2, 4, 18, 'K8', '9.58', 'Cash'),
(22, 7, 8, 29, 'J8', '10.50', 'Visa'),
(23, 4, 8, 25, 'K17', '11.34', 'Master'),
(24, 2, 6, 25, 'L15', '11.11', 'Giftcard'),
(25, 9, 10, 28, 'K10', '8.99', 'Master'),
(26, 6, 4, 17, 'K6', '8.95', 'Visa'),
(27, 5, 8, 10, 'F18', '11.35', 'Giftcard'),
(28, 2, 7, 27, 'L19', '10.45', 'Master'),
(29, 4, 8, 16, 'L22', '11.56', 'Cash'),
(30, 7, 9, 26, 'G22', '12.15', 'Cash'),
(31, 11, 0, 16, 'M22', '12.00', 'Cash'),
(32, 11, 0, 12, 'G16', '12.00', 'Visa'),
(33, 11, 0, 16, 'F16', '12.00', 'Master');

-- --------------------------------------------------------

--
-- Table structure for table `watched`
--

CREATE TABLE `watched` (
  `WatchID` int(11) NOT NULL,
  `CustID` int(11) DEFAULT NULL,
  `MovieID` int(11) DEFAULT NULL,
  `NumOfTimes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `watched`
--

INSERT INTO `watched` (`WatchID`, `CustID`, `MovieID`, `NumOfTimes`) VALUES
(1, 12, 10, 5);

-- --------------------------------------------------------

--
-- Structure for view `customerview`
--
DROP TABLE IF EXISTS `customerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`TheLastofXenon`@`localhost` SQL SECURITY DEFINER VIEW `customerview`  AS  select `customer`.`CustID` AS `CustID`,`customer`.`Name` AS `Name`,`customer`.`Email` AS `Email`,`customer`.`PhoneNumber` AS `PhoneNumber` from `customer` ;

-- --------------------------------------------------------

--
-- Structure for view `employeeview`
--
DROP TABLE IF EXISTS `employeeview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`TheLastofXenon`@`localhost` SQL SECURITY DEFINER VIEW `employeeview`  AS  select `employee`.`EmpID` AS `EmpID`,`employee`.`Name` AS `Name`,`employee`.`Email` AS `Email`,`employee`.`PhoneNumber` AS `PhoneNumber` from `employee` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditorium`
--
ALTER TABLE `auditorium`
  ADD PRIMARY KEY (`AuditID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `movieshowtime`
--
ALTER TABLE `movieshowtime`
  ADD PRIMARY KEY (`ShowID`),
  ADD KEY `AuditID` (`Assigned`),
  ADD KEY `MovieID` (`MovieID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TicketID`),
  ADD KEY `ShowID` (`ShowID`),
  ADD KEY `CustID` (`BuysTicket`),
  ADD KEY `EmpID` (`SellsTicket`);

--
-- Indexes for table `watched`
--
ALTER TABLE `watched`
  ADD PRIMARY KEY (`WatchID`),
  ADD KEY `CustID` (`CustID`),
  ADD KEY `MovieID` (`MovieID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `MovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movieshowtime`
--
ALTER TABLE `movieshowtime`
  MODIFY `ShowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `TicketID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `watched`
--
ALTER TABLE `watched`
  MODIFY `WatchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movieshowtime`
--
ALTER TABLE `movieshowtime`
  ADD CONSTRAINT `movieshowtime_ibfk_1` FOREIGN KEY (`Assigned`) REFERENCES `auditorium` (`AuditID`),
  ADD CONSTRAINT `movieshowtime_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`BuysTicket`) REFERENCES `employee` (`EmpID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ShowID`) REFERENCES `movieshowtime` (`ShowID`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`BuysTicket`) REFERENCES `customer` (`CustID`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`SellsTicket`) REFERENCES `employee` (`EmpID`);

--
-- Constraints for table `watched`
--
ALTER TABLE `watched`
  ADD CONSTRAINT `watched_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`),
  ADD CONSTRAINT `watched_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
