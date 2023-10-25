-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 25 Okt 2023 pada 06.49
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struktur dari tabel `produk`
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
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `barcode`, `nama`, `harga`, `satuan`, `stok`, `img`) VALUES
(1, '8998866107938', 'POSH DEO ROLL ON 50ML/WHITENING', 12400, 'pcs', 1, NULL),
(2, '3', 'MIE GORENG', 2850, 'pcs', 9999, NULL),
(3, '4', 'amsil gelas', 20100, 'pcs', 999, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `waktu` int(255) NOT NULL,
  `total` int(255) NOT NULL,
  `kembalian` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
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
(77, 1698198606, 22000, 28000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
