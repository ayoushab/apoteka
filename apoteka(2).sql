-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 10:21 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apoteka`
--

-- --------------------------------------------------------

--
-- Table structure for table `firma`
--

CREATE TABLE `firma` (
  `firma_id` int(10) NOT NULL,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `drzava` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `god_osnovana` int(4) NOT NULL,
  `br_tel_kompanije` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `firma`
--

INSERT INTO `firma` (`firma_id`, `naziv`, `drzava`, `god_osnovana`, `br_tel_kompanije`) VALUES
(1, 'Galenika a.d.', 'Srbija', 1945, 2147483647),
(2, 'Zdravlje a.d.', 'Srbija', 1953, 2147483647),
(3, 'Ufar d.o.o. /Sandoz Pharmaceuticals d.d.', 'Srbija', 1947, 381877533),
(4, 'PharmaSwiss d.o.o. ', 'Svajcarska', 1924, 308240604),
(5, 'Alvogen d.o.o', 'Austrija', 1933, 349083498),
(6, 'Hemofarm a.d', 'Makedonija', 1972, 387862089),
(7, 'Bosnalijek d.d.', 'Bosna', 1945, 2147483647),
(8, 'Dr Falk Pharma GmbH', 'Turska', 1897, 452653967),
(9, 'Abbott Biologicais B.V.', 'Nemacka', 1899, 452763063),
(10, 'Pharmanova', 'Madarska', 1978, 26797037);

-- --------------------------------------------------------

--
-- Table structure for table `lek`
--

CREATE TABLE `lek` (
  `lek_id` int(10) NOT NULL,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cena` int(45) NOT NULL,
  `kolicina` int(45) NOT NULL,
  `datum_proizvoda` datetime NOT NULL,
  `datum_isteka` datetime NOT NULL,
  `firma` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lek`
--

INSERT INTO `lek` (`lek_id`, `naziv`, `cena`, `kolicina`, `datum_proizvoda`, `datum_isteka`, `firma`) VALUES
(1, 'Nolpaza', 350, 80, '2019-06-15 00:00:00', '2024-06-08 00:00:00', 'Pharmanova'),
(2, 'Sabax', 280, 59, '2019-06-15 00:00:00', '2024-06-08 00:00:00', 'Pharmanova'),
(3, 'Isosorb', 300, 82, '2021-06-28 00:00:00', '2024-01-27 00:00:00', 'Zdravlje a.d.'),
(4, 'Tensec', 550, 231, '2021-01-07 00:00:00', '2024-04-30 00:00:00', 'Hemofarm a.d'),
(5, 'Nipam', 850, 3, '2021-01-16 00:00:00', '2024-04-30 00:00:00', 'Bosnalijek d.d.'),
(6, 'Ksalol', 670, 91, '2019-06-15 00:00:00', '2024-06-08 00:00:00', 'Pharmanova'),
(7, 'Cardogrel', 1750, 81, '2019-06-15 00:00:00', '2024-06-08 00:00:00', 'Pharmanova'),
(8, 'Bisoprolol', 1320, 32, '2021-06-11 00:00:00', '2024-06-23 00:00:00', 'PharmaSwiss d.o.o. '),
(9, 'Ciprofloxacin', 2530, 64, '2021-06-11 00:00:00', '2024-06-23 00:00:00', 'Alvogen d.o.o'),
(10, 'Ursofalk', 860, 88, '2021-06-11 00:00:00', '2023-06-23 00:00:00', 'Dr Falk Pharma GmbH'),
(11, 'Duphalac', 735, 26, '2020-09-30 00:00:00', '2023-06-23 00:00:00', 'Abbott Biologicais B.V.');

-- --------------------------------------------------------

--
-- Table structure for table `racun`
--

CREATE TABLE `racun` (
  `racun_id` int(10) NOT NULL,
  `kolicina` int(45) NOT NULL,
  `datum` datetime NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `firma_id` int(10) DEFAULT NULL,
  `lek_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `br_tel` int(25) NOT NULL,
  `korisnicko_ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pol` enum('M','Z') COLLATE utf8_unicode_ci NOT NULL,
  `uloga` enum('admin','apotekar') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `ime`, `prezime`, `br_tel`, `korisnicko_ime`, `password`, `pol`, `uloga`) VALUES
(1, 'Ajsa', 'Bisevac', 645436118, 'ajsa', '123', 'Z', 'apotekar'),
(2, 'Sena', 'Nicevic', 66284794, 'sena', 'sena123', 'Z', 'admin'),
(3, 'Neko', 'Nekic', 6783968, 'Neko', '[C@30193459', 'M', 'apotekar'),
(4, 'Admin', 'Adminkovic', 12345678, 'admin', 'admin', 'Z', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firma_id`);

--
-- Indexes for table `lek`
--
ALTER TABLE `lek`
  ADD PRIMARY KEY (`lek_id`);

--
-- Indexes for table `racun`
--
ALTER TABLE `racun`
  ADD PRIMARY KEY (`racun_id`),
  ADD KEY `fk_racun_lek_id_idx` (`lek_id`),
  ADD KEY `fk_racun_firma_id_idx` (`firma_id`),
  ADD KEY `fk_racun_user_id_idx` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firma`
--
ALTER TABLE `firma`
  MODIFY `firma_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lek`
--
ALTER TABLE `lek`
  MODIFY `lek_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `racun`
--
ALTER TABLE `racun`
  MODIFY `racun_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `racun`
--
ALTER TABLE `racun`
  ADD CONSTRAINT `fk_racun_firma_id` FOREIGN KEY (`firma_id`) REFERENCES `firma` (`firma_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racun_lek_id` FOREIGN KEY (`lek_id`) REFERENCES `lek` (`lek_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racun_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
