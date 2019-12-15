-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 30 Ιαν 2018 στις 17:09:50
-- Έκδοση διακομιστή: 10.1.19-MariaDB
-- Έκδοση PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `homeiot`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `rooms`
--

CREATE TABLE `rooms` (
  `RoomId` int(11) NOT NULL,
  `RoomName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RoomType` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `TemperatureExists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `HumidityExists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `LuminocityExists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Temperature` float NOT NULL,
  `Humidity` float NOT NULL,
  `Luminocity` float NOT NULL,
  `Switch1Exists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch2Exists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch3Exists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch4Exists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch5Exists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch6Exists` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch1` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch2` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch3` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch4` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch5` enum('false','true') COLLATE utf8_unicode_ci NOT NULL,
  `Switch6` enum('false','true') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `rooms`
--

INSERT INTO `rooms` (`RoomId`, `RoomName`, `RoomType`, `id`, `TemperatureExists`, `HumidityExists`, `LuminocityExists`, `Temperature`, `Humidity`, `Luminocity`, `Switch1Exists`, `Switch2Exists`, `Switch3Exists`, `Switch4Exists`, `Switch5Exists`, `Switch6Exists`, `Switch1`, `Switch2`, `Switch3`, `Switch4`, `Switch5`, `Switch6`) VALUES
(1, 'roomname', '1', 1, 'false', 'true', 'false', 0, 0, 0, 'true', 'false', 'false', 'true', 'false', '', 'false', 'false', 'false', 'false', 'false', 'false'),
(2, 'room', '2', 1, '', '', '', 0, 0, 0, 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(3, 'room3', '3', 1, '', '', '', 0, 0, 0, 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(4, 'ok?', '1', 1, '', 'false', '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 'roomname', '1', 1, 'false', 'true', 'false', 0, 0, 0, 'true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(6, 'roomname', '1', 1, 'false', 'true', 'false', 0, 0, 0, 'true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(7, 'roomname', '1', 1, 'false', 'true', 'false', 0, 0, 0, 'true', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`id`, `Email`, `Pass`) VALUES
(1, 'vas', '12345');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomId`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `rooms`
--
ALTER TABLE `rooms`
  MODIFY `RoomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
