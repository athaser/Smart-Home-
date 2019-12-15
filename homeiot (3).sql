-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2018 at 11:32 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homeiot`
--

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `RoomId` int(11) NOT NULL,
  `RoomName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RoomType` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`RoomId`, `RoomName`, `RoomType`, `UserId`) VALUES
(32, 'room2', 4, 1),
(55, 'testview', 4, 1),
(59, 'ajan', 1, 1),
(61, 'το δωματιο μου', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomtypes`
--

CREATE TABLE `roomtypes` (
  `roomtypeid` int(11) NOT NULL,
  `roomtype` varchar(150) CHARACTER SET greek COLLATE greek_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtypes`
--

INSERT INTO `roomtypes` (`roomtypeid`, `roomtype`) VALUES
(1, 'Bedroom'),
(2, 'Living Room'),
(3, 'Kitchen'),
(4, 'WC');

-- --------------------------------------------------------

--
-- Table structure for table `sensorhistory`
--

CREATE TABLE `sensorhistory` (
  `SensorHistoryId` int(11) NOT NULL,
  `Value` float NOT NULL,
  `Log_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SensorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sensorhistory`
--

INSERT INTO `sensorhistory` (`SensorHistoryId`, `Value`, `Log_timestamp`, `SensorId`) VALUES
(1, 1, '2018-02-15 17:35:59', 76),
(2, 1, '2018-02-15 19:44:52', 77),
(3, 1, '2018-02-15 19:53:20', 78),
(4, 1, '2018-02-15 19:56:12', 137),
(5, 1, '2018-02-15 20:28:09', 119),
(6, 0, '2018-02-15 20:29:38', 119),
(7, 1, '2018-02-15 20:34:13', 119),
(8, 0, '2018-02-15 20:36:23', 119),
(9, 1, '2018-02-15 20:37:23', 119),
(10, 0, '2018-02-15 20:38:51', 119),
(11, 1, '2018-02-15 20:39:01', 119),
(15, 0, '2018-02-15 20:51:27', 76),
(16, 0, '2018-02-15 20:59:00', 119),
(17, 1, '2018-02-15 20:59:13', 119),
(18, 0, '2018-02-15 20:59:32', 119),
(19, 1, '2018-02-15 21:00:23', 119),
(20, 0, '2018-02-15 21:00:25', 119),
(21, 0, '2018-02-15 21:00:42', 77),
(22, 1, '2018-02-15 21:00:44', 77),
(23, 1, '2018-02-15 21:01:51', 139),
(24, 0, '2018-02-15 21:01:56', 139),
(25, 1, '2018-02-15 21:02:16', 139),
(26, 0, '2018-02-15 21:02:34', 139),
(27, 1, '2018-02-15 21:02:38', 139),
(28, 0, '2018-02-15 21:02:48', 139),
(29, 0, '2018-02-15 21:02:57', 137),
(30, 1, '2018-02-15 21:03:01', 140),
(31, 1, '2018-02-15 21:03:08', 138),
(32, 1, '2018-02-15 21:04:13', 146),
(33, 20, '2018-02-15 21:04:56', 145),
(34, 33, '2018-02-15 21:05:14', 145),
(35, 33.4, '2018-02-15 21:05:24', 145),
(36, 33.4132, '2018-02-15 21:05:46', 145),
(37, 1, '2018-02-15 22:06:23', 119),
(38, 0, '2018-02-15 22:06:30', 119);

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE `sensors` (
  `SensorId` int(11) NOT NULL,
  `SensorName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SensorType` int(11) NOT NULL,
  `Value` float NOT NULL,
  `RoomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`SensorId`, `SensorName`, `SensorType`, `Value`, `RoomId`) VALUES
(76, '', 6, 0, 32),
(77, '', 8, 1, 32),
(78, '', 4, 1, 32),
(119, '', 6, 0, 55),
(120, '', 3, 0, 55),
(137, '', 6, 0, 59),
(138, '', 8, 1, 59),
(139, '', 4, 0, 59),
(140, '', 7, 1, 59),
(144, '', 2, 0, 61),
(145, '', 3, 33.4132, 61),
(146, '', 4, 1, 61),
(147, '', 5, 0, 61);

--
-- Triggers `sensors`
--
DELIMITER $$
CREATE TRIGGER `trigger_sensor` AFTER UPDATE ON `sensors` FOR EACH ROW BEGIN
if OLD.Value<>NEW.Value THEN
insert into sensorhistory(value,SensorId) VALUES(NEW.Value,NEW.SensorId);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_sensor_del` BEFORE DELETE ON `sensors` FOR EACH ROW BEGIN
##delete from  sensorhistory where sensorhistory.SensorId=OLD.SensorId;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sensortypes`
--

CREATE TABLE `sensortypes` (
  `Sensortypeid` int(11) NOT NULL,
  `Sensor_name` varchar(120) CHARACTER SET greek NOT NULL,
  `is_actuator` tinyint(4) NOT NULL,
  `img_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensortypes`
--

INSERT INTO `sensortypes` (`Sensortypeid`, `Sensor_name`, `is_actuator`, `img_name`) VALUES
(1, 'Temperature', 0, 'therm'),
(2, 'Humidity', 0, 'humidity'),
(3, 'Power', 0, 'watt'),
(4, 'Light 1', 1, 'light'),
(5, 'Light 2', 1, 'light'),
(6, 'Light 3', 1, 'light'),
(7, 'Air Condition', 1, 'fan'),
(8, 'TV', 1, 'tv');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `Email`, `Pass`) VALUES
(1, 'vas', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'vas2', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomId`),
  ADD KEY `FK_rooms_userid` (`UserId`),
  ADD KEY `FK_rooms_rmtype` (`RoomType`);

--
-- Indexes for table `roomtypes`
--
ALTER TABLE `roomtypes`
  ADD PRIMARY KEY (`roomtypeid`);

--
-- Indexes for table `sensorhistory`
--
ALTER TABLE `sensorhistory`
  ADD PRIMARY KEY (`SensorHistoryId`),
  ADD KEY `fk_history_sensor` (`SensorId`);

--
-- Indexes for table `sensors`
--
ALTER TABLE `sensors`
  ADD PRIMARY KEY (`SensorId`),
  ADD KEY `FK_sensors_roomid` (`RoomId`),
  ADD KEY `FK_sensors_senstype` (`SensorType`);

--
-- Indexes for table `sensortypes`
--
ALTER TABLE `sensortypes`
  ADD PRIMARY KEY (`Sensortypeid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `RoomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `roomtypes`
--
ALTER TABLE `roomtypes`
  MODIFY `roomtypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sensorhistory`
--
ALTER TABLE `sensorhistory`
  MODIFY `SensorHistoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sensors`
--
ALTER TABLE `sensors`
  MODIFY `SensorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `sensortypes`
--
ALTER TABLE `sensortypes`
  MODIFY `Sensortypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK_rooms_rmtype` FOREIGN KEY (`RoomType`) REFERENCES `roomtypes` (`roomtypeid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_rooms_userid` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sensorhistory`
--
ALTER TABLE `sensorhistory`
  ADD CONSTRAINT `fk_history_sensor` FOREIGN KEY (`SensorId`) REFERENCES `sensors` (`SensorId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sensors`
--
ALTER TABLE `sensors`
  ADD CONSTRAINT `FK_sensors_roomid` FOREIGN KEY (`RoomId`) REFERENCES `rooms` (`RoomId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sensors_senstype` FOREIGN KEY (`SensorType`) REFERENCES `sensortypes` (`Sensortypeid`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
