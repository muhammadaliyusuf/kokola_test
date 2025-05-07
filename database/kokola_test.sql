-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2025 at 05:41 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kokola_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_plant`
--

CREATE TABLE `m_plant` (
  `id` int(11) NOT NULL,
  `kode` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_plant`
--

INSERT INTO `m_plant` (`id`, `kode`, `name`) VALUES
(1, 'BE', 'Bromo Emulsion'),
(2, 'IJ', 'Ijen'),
(3, 'MH', 'Mahameru'),
(4, 'MR', 'Merapi'),
(5, 'BS', 'Bromo Synthetic'),
(6, 'SM', 'Semeru'),
(7, 'TD', 'Tidar'),
(8, 'TE', 'Tengger'),
(9, 'RJ', 'Rinjani'),
(10, 'PI', 'Kerinci');

-- --------------------------------------------------------

--
-- Table structure for table `m_plant_product`
--

CREATE TABLE `m_plant_product` (
  `id` int(11) NOT NULL,
  `id_plant` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `file_url` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_plant_product`
--

INSERT INTO `m_plant_product` (`id`, `id_plant`, `id_product`, `file_url`) VALUES
(1, 1, 17, NULL),
(2, 1, 65, NULL),
(3, 1, 9, NULL),
(4, 1, 64, NULL),
(5, 1, 14, NULL),
(6, 1, 24, NULL),
(7, 1, 11, NULL),
(8, 1, 16, NULL),
(9, 1, 18, NULL),
(10, 1, 39, NULL),
(11, 1, 66, NULL),
(12, 1, 40, NULL),
(13, 1, 55, NULL),
(14, 1, 63, NULL),
(15, 1, 46, NULL),
(16, 1, 53, NULL),
(17, 1, 49, NULL),
(18, 1, 44, NULL),
(19, 5, 28, NULL),
(20, 5, 42, NULL),
(21, 5, 31, NULL),
(22, 5, 54, NULL),
(23, 2, 36, NULL),
(24, 2, 68, NULL),
(25, 2, 23, NULL),
(26, 2, 43, NULL),
(27, 2, 74, NULL),
(28, 2, 1, NULL),
(29, 2, 20, NULL),
(30, 2, 54, NULL),
(31, 2, 8, NULL),
(32, 2, 4, NULL),
(33, 2, 61, NULL),
(34, 2, 19, NULL),
(35, 2, 5, NULL),
(36, 2, 6, NULL),
(37, 2, 3, NULL),
(38, 2, 44, NULL),
(39, 2, 2, NULL),
(40, 3, 41, NULL),
(41, 4, 52, NULL),
(42, 4, 9, NULL),
(43, 4, 12, NULL),
(44, 4, 35, NULL),
(45, 4, 45, NULL),
(46, 4, 76, NULL),
(47, 4, 10, NULL),
(48, 4, 71, NULL),
(49, 4, 27, NULL),
(50, 4, 37, NULL),
(51, 4, 57, NULL),
(52, 4, 50, NULL),
(53, 4, 25, NULL),
(54, 4, 73, NULL),
(55, 4, 32, NULL),
(56, 4, 58, NULL),
(57, 4, 56, NULL),
(58, 4, 48, NULL),
(59, 6, 28, NULL),
(60, 6, 34, NULL),
(61, 6, 77, NULL),
(62, 6, 26, NULL),
(63, 6, 21, NULL),
(64, 6, 33, NULL),
(65, 6, 75, NULL),
(66, 6, 30, NULL),
(67, 6, 15, NULL),
(68, 6, 38, NULL),
(69, 6, 54, NULL),
(70, 7, 29, NULL),
(71, 7, 13, NULL),
(73, 8, 22, NULL),
(74, 8, 51, NULL),
(75, 8, 69, NULL),
(76, 8, 67, NULL),
(77, 8, 72, NULL),
(78, 8, 47, NULL),
(79, 8, 75, NULL),
(80, 8, 73, NULL),
(81, 8, 59, NULL),
(82, 8, 60, NULL),
(83, 8, 68, NULL),
(84, 8, 61, NULL),
(85, 8, 70, NULL),
(86, 8, 7, NULL),
(87, 8, 62, NULL),
(88, 6, 78, NULL),
(89, 8, 84, NULL),
(90, 7, 79, NULL),
(91, 7, 80, NULL),
(92, 7, 81, NULL),
(93, 7, 82, NULL),
(94, 7, 83, NULL),
(95, 9, 107, NULL),
(96, 9, 108, NULL),
(97, 9, 109, NULL),
(98, 9, 110, NULL),
(99, 9, 111, NULL),
(100, 9, 112, NULL),
(101, 9, 113, NULL),
(102, 9, 114, NULL),
(103, 9, 115, NULL),
(104, 9, 116, NULL),
(105, 9, 117, NULL),
(106, 9, 118, NULL),
(107, 9, 119, NULL),
(108, 9, 120, NULL),
(109, 9, 121, NULL),
(110, 9, 122, NULL),
(111, 9, 123, NULL),
(112, 9, 124, NULL),
(113, 9, 125, NULL),
(114, 9, 126, NULL),
(115, 9, 127, NULL),
(116, 9, 128, NULL),
(117, 9, 129, NULL),
(118, 9, 130, NULL),
(119, 9, 131, NULL),
(120, 9, 132, NULL),
(121, 9, 133, NULL),
(122, 9, 134, NULL),
(123, 9, 135, NULL),
(124, 9, 136, NULL),
(125, 9, 137, NULL),
(126, 9, 138, NULL),
(127, 9, 139, NULL),
(128, 9, 140, NULL),
(129, 9, 141, NULL),
(130, 9, 142, NULL),
(131, 9, 143, NULL),
(132, 9, 144, NULL),
(133, 9, 145, NULL),
(134, 9, 146, NULL),
(135, 9, 147, NULL),
(136, 9, 148, NULL),
(137, 9, 149, NULL),
(138, 9, 150, NULL),
(139, 9, 151, NULL),
(140, 9, 152, NULL),
(141, 9, 153, NULL),
(142, 9, 154, NULL),
(143, 9, 155, NULL),
(144, 9, 156, NULL),
(145, 9, 157, NULL),
(146, 9, 158, NULL),
(147, 9, 159, NULL),
(148, 9, 160, NULL),
(149, 9, 161, NULL),
(150, 9, 162, NULL),
(151, 9, 163, NULL),
(152, 9, 164, NULL),
(153, 9, 165, NULL),
(154, 9, 166, NULL),
(155, 9, 167, NULL),
(156, 9, 168, NULL),
(157, 9, 169, NULL),
(158, 9, 170, NULL),
(159, 9, 171, NULL),
(160, 9, 172, NULL),
(161, 9, 173, NULL),
(162, 9, 174, NULL),
(163, 9, 175, NULL),
(164, 9, 176, NULL),
(165, 9, 177, NULL),
(166, 9, 178, NULL),
(167, 9, 179, NULL),
(168, 9, 180, NULL),
(169, 9, 181, NULL),
(170, 9, 182, NULL),
(171, 9, 183, NULL),
(172, 10, 184, NULL),
(173, 10, 185, NULL),
(174, 10, 186, NULL),
(175, 10, 187, NULL),
(176, 10, 188, NULL),
(177, 10, 189, NULL),
(178, 10, 190, NULL),
(179, 10, 191, NULL),
(180, 10, 192, NULL),
(181, 10, 193, NULL),
(182, 10, 194, NULL),
(183, 10, 195, NULL),
(184, 10, 196, NULL),
(185, 10, 197, NULL),
(186, 10, 198, NULL),
(187, 10, 199, NULL),
(188, 10, 200, NULL),
(189, 10, 201, NULL),
(190, 10, 202, NULL),
(191, 10, 203, NULL),
(192, 10, 204, NULL),
(193, 10, 205, NULL),
(194, 10, 206, NULL),
(195, 10, 207, NULL),
(196, 10, 208, NULL),
(197, 10, 209, NULL),
(198, 10, 210, NULL),
(199, 10, 211, NULL),
(200, 10, 212, NULL),
(201, 10, 213, NULL),
(202, 10, 214, NULL),
(203, 10, 215, NULL),
(204, 10, 216, NULL),
(205, 10, 217, NULL),
(206, 10, 218, NULL),
(207, 10, 219, NULL),
(208, 10, 220, NULL),
(209, 10, 221, NULL),
(210, 10, 222, NULL),
(211, 10, 223, NULL),
(212, 10, 224, NULL),
(213, 6, 42, NULL),
(214, 6, 230, NULL),
(215, 3, 5, NULL),
(216, 3, 8, NULL),
(217, 5, 232, NULL),
(218, 6, 232, NULL),
(219, 8, 233, NULL),
(220, 1, 1, NULL),
(221, 1, 184, NULL),
(222, 8, 235, NULL),
(223, 7, 235, NULL),
(224, 6, 235, NULL),
(225, 8, 105, NULL),
(226, 1, 236, NULL),
(227, 8, 106, NULL),
(228, 1, 240, NULL),
(229, 8, 245, NULL),
(230, 8, 244, NULL),
(231, 3, 246, NULL),
(232, 7, 247, NULL),
(233, 9, 248, NULL),
(234, 2, 249, NULL),
(235, 7, 250, NULL),
(236, 3, 251, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_product`
--

CREATE TABLE `m_product` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_product`
--

INSERT INTO `m_product` (`id`, `name`, `description`) VALUES
(1, '1800', NULL),
(2, '2860', NULL),
(3, '4210', NULL),
(4, '4220', NULL),
(5, '4300', NULL),
(6, '4320', NULL),
(7, '7500', NULL),
(8, 'ABRO', NULL),
(9, 'AGEM', NULL),
(10, 'AGWA', NULL),
(11, 'AQEM', NULL),
(12, 'AREM', NULL),
(13, 'ARTH', NULL),
(14, 'AVAL', NULL),
(15, 'AVBR', NULL),
(16, 'AVDA', NULL),
(17, 'AVEM', NULL),
(18, 'AVEX', NULL),
(19, 'AVFL', NULL),
(20, 'AVFO', NULL),
(21, 'AVHA', NULL),
(22, 'AVLE', NULL),
(23, 'AVNO', NULL),
(24, 'AVON', NULL),
(25, 'AVPL', NULL),
(26, 'AVRL', NULL),
(27, 'AVRO', NULL),
(28, 'AVSY', NULL),
(29, 'AVTH', NULL),
(30, 'AVVE', NULL),
(31, 'AVZI', NULL),
(32, 'BERO', NULL),
(33, 'BESY', NULL),
(34, 'BEZI', NULL),
(35, 'BOPL', NULL),
(36, 'BOVE', NULL),
(37, 'DJRO', NULL),
(38, 'DJSY', NULL),
(39, 'EVEM', NULL),
(40, 'FREM', NULL),
(41, 'GIMO', NULL),
(42, 'GLSY', NULL),
(43, 'HODE', NULL),
(44, 'INEM', NULL),
(45, 'JAEM', NULL),
(46, 'LEAL', NULL),
(47, 'LECO', NULL),
(48, 'LEWA', NULL),
(49, 'LEWS', NULL),
(50, 'MALE', NULL),
(51, 'NOBI', NULL),
(52, 'NODR', NULL),
(53, 'NOEM', NULL),
(54, 'NOLU', NULL),
(55, 'NOMD', NULL),
(56, 'NOME', NULL),
(57, 'NOSE', NULL),
(58, 'NOWA', NULL),
(59, 'PLCC', NULL),
(60, 'PLCH', NULL),
(61, 'PLSY', NULL),
(62, 'PLUN', NULL),
(63, 'SGAL', NULL),
(64, 'SGEM', NULL),
(65, 'SPAN', NULL),
(66, 'SPEM', NULL),
(67, 'SU41', NULL),
(68, 'SULA', NULL),
(69, 'SUSP', NULL),
(70, 'VADE', NULL),
(71, 'VILE', NULL),
(72, 'VIPA', NULL),
(73, 'VIPL', NULL),
(74, 'WOWO', NULL),
(75, 'YOME', NULL),
(76, 'YORO', NULL),
(77, 'YOSY', NULL),
(78, 'YOMEYZE', NULL),
(79, 'ARTHA', NULL),
(80, 'ARTHASP', NULL),
(81, 'AVTHASP', NULL),
(82, 'AVTHENA', NULL),
(83, 'AVTHSUP', NULL),
(84, 'YOMELOO', NULL),
(105, 'BAS', NULL),
(106, 'AVKI', NULL),
(107, 'AC115', NULL),
(108, 'AC125', NULL),
(109, 'AC126', NULL),
(110, 'AC136', NULL),
(111, 'BD510G', NULL),
(112, 'CB2033', NULL),
(113, 'CB2240', NULL),
(114, 'CB2333', NULL),
(115, 'CB2540', NULL),
(116, 'GIL40', NULL),
(117, 'GIL9950', NULL),
(118, 'K420', NULL),
(119, 'KK15', NULL),
(120, 'KK16', NULL),
(121, 'KK16S', NULL),
(122, 'KK17', NULL),
(123, 'KK21', NULL),
(124, 'KK22', NULL),
(125, 'KK251', NULL),
(126, 'KK252', NULL),
(127, 'KK252GP', NULL),
(128, 'KK254GP', NULL),
(129, 'KK257', NULL),
(130, 'KK257A', NULL),
(131, 'KK257GP', NULL),
(132, 'KK258', NULL),
(133, 'KK260', NULL),
(134, 'KK263', NULL),
(135, 'KK263GP', NULL),
(136, 'KK264', NULL),
(137, 'KK265', NULL),
(138, 'KK266', NULL),
(139, 'KK27', NULL),
(140, 'KK270', NULL),
(141, 'KK282', NULL),
(142, 'KK282GP', NULL),
(143, 'KK288GP', NULL),
(144, 'KK30', NULL),
(145, 'KK300', NULL),
(146, 'KK32', NULL),
(147, 'KK33', NULL),
(148, 'KK42', NULL),
(149, 'KK42LV', NULL),
(150, 'KK47', NULL),
(151, 'KK49', NULL),
(152, 'KK49A', NULL),
(153, 'KK58', NULL),
(154, 'KK59', NULL),
(155, 'KK64', NULL),
(156, 'KK66', NULL),
(157, 'KK70', NULL),
(158, 'KK72', NULL),
(159, 'KK76', NULL),
(160, 'KK78', NULL),
(161, 'KK79', NULL),
(162, 'KK80', NULL),
(163, 'KK82', NULL),
(164, 'KK84', NULL),
(165, 'KK85', NULL),
(166, 'KK87', NULL),
(167, 'LEMDOS', NULL),
(168, 'LEMDOSB', NULL),
(169, 'MKC67', NULL),
(170, 'NCB65', NULL),
(171, 'NCB65', NULL),
(172, 'REAC249', NULL),
(173, 'REKK256', NULL),
(174, 'REKK256T', NULL),
(175, 'REKK257', NULL),
(176, 'REKK257T', NULL),
(177, 'REKK282', NULL),
(178, 'RES60', NULL),
(179, 'RES60B', NULL),
(180, 'RES60C', NULL),
(181, 'REX70', NULL),
(182, 'SL90', NULL),
(183, 'TCS60', NULL),
(184, 'KABRO', NULL),
(185, 'KALUM', NULL),
(186, 'KARTH', NULL),
(187, 'KASTH', NULL),
(188, 'KATH0', NULL),
(189, 'KATH5', NULL),
(190, 'KAVNO', NULL),
(191, 'KAVPA', NULL),
(192, 'KAVRL', NULL),
(193, 'KAVSY', NULL),
(194, 'KBEZI', NULL),
(195, 'KBOPO', NULL),
(196, 'KDJSY', NULL),
(197, 'KENTH', NULL),
(198, 'KEPHA', NULL),
(199, 'KEPRE', NULL),
(200, 'KEVEM', NULL),
(201, 'KGLSY', NULL),
(202, 'KHASY', NULL),
(203, 'KINCO', NULL),
(204, 'KMABR', NULL),
(205, 'KNOLU', NULL),
(206, 'KPLCC', NULL),
(207, 'KPLFL', NULL),
(208, 'KPLHA', NULL),
(209, 'KPLSY', NULL),
(210, 'KPOLO', NULL),
(211, 'KPOPU', NULL),
(212, 'KPOWC', NULL),
(213, 'KSATH', NULL),
(214, 'KSPEM', NULL),
(215, 'KSU21', NULL),
(216, 'KSU41', NULL),
(217, 'KSULA', NULL),
(218, 'KSUTH', NULL),
(219, 'KTAME', NULL),
(220, 'KWOWO', NULL),
(221, 'KYOPR', NULL),
(222, 'KYOSY', NULL),
(223, 'KZISY', NULL),
(224, 'TWC20', NULL),
(225, 'EVKI', NULL),
(226, 'AVBI', NULL),
(227, 'KK278', NULL),
(228, 'KK18', NULL),
(229, 'KK258GP', NULL),
(230, 'PAK MUH', NULL),
(231, 'EYYO', NULL),
(232, 'TEST', NULL),
(233, 'TEST', NULL),
(234, 'ASD', NULL),
(235, 'qwer', NULL),
(236, 'SUFF', NULL),
(237, 'NVSN', NULL),
(238, 'BBGG', NULL),
(239, 'GAGA', NULL),
(240, 'ASAS', NULL),
(241, 'ASQW', NULL),
(242, 'ASQQ', NULL),
(243, 'qweas', NULL),
(244, 'sad', NULL),
(245, 'bnm', NULL),
(246, 'BMBM', NULL),
(247, 'ZXCV', NULL),
(248, 'ASDF', NULL),
(249, 'POIU', NULL),
(250, 'CVBN', NULL),
(251, 'MHMR', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_plant`
--
ALTER TABLE `m_plant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_plant_product`
--
ALTER TABLE `m_plant_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_plant` (`id_plant`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `m_product`
--
ALTER TABLE `m_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_plant`
--
ALTER TABLE `m_plant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `m_plant_product`
--
ALTER TABLE `m_plant_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `m_product`
--
ALTER TABLE `m_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_plant_product`
--
ALTER TABLE `m_plant_product`
  ADD CONSTRAINT `m_plant_product_ibfk_1` FOREIGN KEY (`id_plant`) REFERENCES `m_plant` (`id`),
  ADD CONSTRAINT `m_plant_product_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `m_product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
