-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2023 at 04:22 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(25) NOT NULL,
  `satuan` varchar(8) NOT NULL,
  `stok` int(10) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `barcode`, `nama`, `harga`, `satuan`, `stok`, `img`) VALUES
(1, '8998866107938', 'POSH DEO ROLL ON 50ML/WHITENING', 12400, 'pcs', 2, NULL),
(2, '8998866200301', 'SEDAAP MIE GORENG 90g', 2850, 'pcs', 9999, NULL),
(3, '8999999706180', 'PEPSODENT WHITE/JUMB 190g', 20100, 'pcs', 999, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `waktu` int(255) NOT NULL,
  `total` int(255) NOT NULL,
  `kembalian` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `waktu`, `total`, `kembalian`) VALUES
(54, 1698152936, 31000, 0),
(55, 1698152978, 61500, 38500),
(56, 1698154122, 16500, 3500),
(57, 1698154866, 16500, 3500),
(58, 1698154933, 27500, 972500),
(59, 1698155039, 49500, 500),
(60, 1698155043, 49500, 500),
(61, 1698155043, 49500, 500),
(62, 1698155043, 49500, 500),
(63, 1698155044, 49500, 500),
(64, 1698155044, 49500, 500),
(65, 1698155044, 49500, 500),
(66, 1698155180, 16500, 6833),
(67, 1698155551, 16500, 3500),
(68, 1698155624, 44000, 6000),
(69, 1698155640, 22000, 28000),
(70, 1698156467, 22000, 18000),
(71, 1698156630, 5500, 34500),
(72, 1698156811, 49500, 500),
(73, 1698157301, 33000, 17000),
(74, 1698157356, 33000, 17000),
(75, 1698157708, 5500, 54500),
(76, 1698158056, 5500, 84500),
(77, 1698198606, 22000, 28000),
(78, 1698228138, 14000, 6000),
(79, 1698232083, 82000, 18000),
(80, 1698240610, 14000, 6000),
(81, 1698243213, 41000, 9000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
