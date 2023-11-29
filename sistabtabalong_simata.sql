-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 29 Nov 2023 pada 05.20
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
-- Database: `sistabtabalong_simata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoriProduk`
--

CREATE TABLE `kategoriProduk` (
  `idKategori` int(11) NOT NULL,
  `namaKategori` varchar(255) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoriProduk`
--

INSERT INTO `kategoriProduk` (`idKategori`, `namaKategori`, `icon`, `color`) VALUES
(5, 'Rokok', 'bxs-brush', 'primary'),
(6, 'Bahan & peralatan mandi', 'bxs-bath', 'warning'),
(7, 'Makanan ringan', 'bxs-chalkboard', 'success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `persenKeuntungan`
--

CREATE TABLE `persenKeuntungan` (
  `id` int(11) NOT NULL,
  `profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `persenKeuntungan`
--

INSERT INTO `persenKeuntungan` (`id`, `profit`) VALUES
(1, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(25) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `idKategori` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `barcode`, `nama`, `harga`, `satuan`, `stok`, `idKategori`, `img`) VALUES
(79, '8999999580742', 'REXONA MEN ROLL 45ML/SPORT DEFENSE', 15400, 'pcs', 441, 6, '8999999580742.jpg'),
(80, '8996129803504', 'CLEO 550 ML', 2300, 'pcs', 468, 7, '8996129803504.jpg'),
(81, '8998866107938', 'POSH ROLL ON WHITENING 50 ML', 14300, 'pcs', 0, 6, '8998866107938.jpg'),
(82, '8998866200301', 'SEDAAP GORENG 90GR', 2700, 'pcs', 13, 7, '8998866200301.jpg'),
(83, '8999909096004', 'ROKOK SAMPOERNA A-MILD 16', 28600, 'pcs', 498, 5, '8999909096004.png'),
(84, '8999999706180', 'PEPSODENT 190gr', 8600, 'pcs', 194, 6, '8999999706180.jpg'),
(85, '8999988906126', 'LASEGAR TWIST 320ML/LEMON', 4500, 'pcs', 483, 7, '8999988906126.jpg'),
(92, '8992388145027', 'NU TEA YOGURT 450 ml', 5000, 'pcs', 80, 7, '8992388145027.jpg'),
(93, '8996001600269', 'LE MINERALE 600ML', 2300, 'pcs', 34, 7, '8996001600269.jpg'),
(99, '8996001600375', 'LE MINERALE 330 ml', 2300, 'pcs', 70, 7, '8996001600375.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuanProduk`
--

CREATE TABLE `satuanProduk` (
  `id` int(11) NOT NULL,
  `namaSatuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `satuanProduk`
--

INSERT INTO `satuanProduk` (`id`, `namaSatuan`) VALUES
(1, 'pcs'),
(2, 'kg'),
(3, 'lusin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `id` int(255) NOT NULL,
  `codeTamu` int(6) DEFAULT NULL,
  `statusTamu` int(11) NOT NULL,
  `mengatasnamakan` varchar(20) DEFAULT NULL,
  `namaTamu` varchar(128) NOT NULL,
  `alamatTamu` varchar(255) NOT NULL,
  `ditemui` varchar(128) DEFAULT NULL,
  `tanggalBerkunjung` date NOT NULL,
  `keperluanTamu` varchar(255) NOT NULL,
  `gambar` varchar(128) DEFAULT NULL,
  `tamuMasuk` varchar(255) NOT NULL,
  `tamuKeluar` varchar(255) DEFAULT NULL,
  `kepuasanTamu` int(11) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL,
  `diwakilkan` varchar(255) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`id`, `codeTamu`, `statusTamu`, `mengatasnamakan`, `namaTamu`, `alamatTamu`, `ditemui`, `tanggalBerkunjung`, `keperluanTamu`, `gambar`, `tamuMasuk`, `tamuKeluar`, `kepuasanTamu`, `pesan`, `diwakilkan`, `ket`, `created_at`) VALUES
(24, NULL, 1, 'Personal', 'testing', 'testing', 'Kepala Badan', '2023-06-23', 'testing', '1687482502.jpg', '1687482525', NULL, NULL, 'oke silahkan masuk. sambil dinkawal', NULL, 'tamu diterima oleh Kepala Badan', '2023-06-23 09:08:45'),
(26, NULL, 1, 'Personal', 'pa hermansyah', 'kecamantan muara harus', 'Kepala Badan', '2023-07-18', 'adayang perlu di sampaikan terkait kekeluargaan', '1689644426.jpg', '1689644470', NULL, NULL, 'terima aja.. ', NULL, 'tamu diterima oleh Kepala Badan', '2023-07-18 09:41:10'),
(27, NULL, 1, 'Personal', 'pa ikus', 'tanjung', 'Kepala Badan', '2023-07-18', 'kakawanan', 'tidak ada', '1689649129', NULL, NULL, '', NULL, 'tamu diterima oleh Kepala Badan', '2023-07-18 10:58:49'),
(29, NULL, 1, 'Organisasi', 'pt cont', 'tabalong', 'Kepala Badan', '2023-07-31', 'kordinasi aja jar(sudah janjian) ', '1690771044.jpg', '1690771134', NULL, NULL, 'silahkan masuk.. sudah janjian juga..', NULL, 'tamu diterima oleh Kepala Badan', '2023-07-31 10:38:54'),
(39, NULL, 3, 'Personal', 'hadi rusadi', 'tanjung', 'Kepala Badan', '2023-09-10', 'minjam duit 100 dulu', '1694333433.jpg', '1694333461', NULL, NULL, NULL, NULL, 'tamu otomatis ditolak oleh sistem', '2023-09-10 10:11:01');

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
(77, 1698198606, 22000, 28000),
(78, 1698228138, 14000, 6000),
(79, 1698232083, 82000, 18000),
(80, 1698240610, 14000, 6000),
(81, 1698243213, 41000, 9000),
(82, 1698736055, 19000, 1000),
(83, 1698759176, 22500, 7500),
(84, 1698807133, 27500, 2500),
(85, 1698833946, 22500, 7500),
(86, 1698834883, 142000, 8000),
(87, 1698893322, 266500, 33500),
(88, 1698893323, 266500, 33500),
(89, 1698893324, 266500, 33500),
(90, 1698893501, 22500, 7500),
(91, 1698893556, 3500, 1500),
(92, 1698896256, 22500, 27500),
(93, 1698896272, 44500, 5500),
(94, 1698896285, 22500, 7500),
(95, 1698896286, 22500, 7500),
(96, 1699862249, 500, 0),
(97, 1699863235, 26000, 0),
(98, 1699928649, 4000, 1000),
(99, 1699928651, 4000, 1000),
(100, 1699929681, 13000, 37000),
(101, 1700015728, 26000, 4000),
(102, 1700040268, 127500, 372500),
(103, 1700632317, 2000, 0),
(104, 1700733443, 32000, 18000),
(105, 1700742663, 70500, 29500),
(106, 1700742686, 28500, 1500),
(107, 1700744979, 58500, 1500),
(108, 1700745244, 85500, 14500),
(109, 1700746582, 38000, 12000),
(110, 1700865873, 70000, 0),
(111, 1700974806, 5500, 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `ditemui` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `jabatan` varchar(128) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `ditemui`, `name`, `username`, `jabatan`, `nip`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(83, 1, 'Drs. H. Nanang Mulkani, M.Si', 'kaban', 'Kepala Badan', '197203061992031004', 'pppp11.png', '$2y$10$M5a8zmn8zuMStXAjXlsSE.01RINHcFuOGrcVEdQtC4UiHwZCAO7n2', 3, 1, 1678887171),
(90, 0, 'Hadi Rusadi', 'hadi', 'SATPAM', '', 'ku.jpg', '$2y$10$auz.UV6axG1gYjS9nUmA7.LVRsdKQ2tLDvupQHaJxFXl.P9/rjdyy', 2, 1, 1),
(129, 1, 'H. Cecep Komarudin Perceka, SE, ME', 'admim', 'Sekretaris', '197012282000031005', 'default.jpg', '$2y$10$kRhR0.jBHJlTa4lXdwlCHO8L9r7pKgAWinCfxnTUYm0JVFzNRNzXS', 3, 1, 1678887171),
(130, 1, 'H. Rahmadani, S. Sos', 'pp', 'Kabid. Pendataan dan Pelayanan', '196703111992031005', 'default.jpg', '$2y$10$kRhR0.jBHJlTa4lXdwlCHO8L9r7pKgAWinCfxnTUYm0JVFzNRNzXS', 4, 1, 1678887425),
(131, 1, 'Irwansyah Budiman, SE, MM', 'dal', 'Kabid. Penagihan dan Pengendalian', '198404142008041001', 'default.jpg', '$2y$10$kRhR0.jBHJlTa4lXdwlCHO8L9r7pKgAWinCfxnTUYm0JVFzNRNzXS', 4, 1, 1678887899),
(133, 1, 'Lyna Holwati, S.STP, M.Si', 'tap', 'Kabid. Penetapan dan Pengelolaan Data', '197203291993011005', 'default.jpg', '$2y$10$kRhR0.jBHJlTa4lXdwlCHO8L9r7pKgAWinCfxnTUYm0JVFzNRNzXS', 4, 1, 1679360439),
(139, 0, 'hamsinah', 'hamsinah', 'Arsiparis', '', 'default.jpg', '$2y$10$QxNvi1Oy1xY.ocQgISqvZutHwRh7fhwHXW3dVkkJ4YzvzKCF.jQNq', 2, 1, 1),
(159, 0, 'admin', 'admin', '', '', 'IMG_20231124_094027-removebg-preview.png', '$2y$10$FZZT.gKodEaD6yLffMohE.y7c/7B/8.Y4TenNBVAB6CylMtGSi2Fu', 1, 1, 1694744275),
(163, 0, 'Muhammad Alwi', 'alwi', 'SATPAM', '', 'default.jpg', '$2y$10$QA/1fdXoiz.lqrN9Hx2VG.92xwY8wySssQXdXk4AdiL1I..zB.9yC', 2, 1, 1696213495),
(164, NULL, 'Maidi', 'maidi', 'Kasir', NULL, '7.png', '$2y$10$QxNvi1Oy1xY.ocQgISqvZutHwRh7fhwHXW3dVkkJ4YzvzKCF.jQNq', 5, 1, 1),
(165, 0, 'Abu Janda', 'kasir', 'Kasir', '', '7aad9b67af9407317b855961c1f67f7d.png', '$2y$10$XbyiLGqVhFRYniS9xLnaf.gRoEkScGk74QFb0xs0euq4PAdS4OX/e', 5, 1, 1700741838),
(166, 0, 'kucing ganteng', 'kucing', 'preman pasar', '09887687', 'default.jpg', '$2y$10$/NWHrbs9d46elG1f/4bbJ.FlknGpkCWbfl3mLuWKSxsak87PD1M6q', 5, 1, 1700745148);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 0),
(2, 1, 999),
(3, 2, 0),
(4, 2, 1),
(5, 2, 2),
(6, 2, 999),
(7, 3, 0),
(8, 3, 999),
(9, 5, 0),
(10, 5, 3),
(11, 5, 999),
(233, 4, 0),
(234, 4, 999),
(241, 5, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `controllers` varchar(128) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `iconActive` varchar(255) DEFAULT NULL,
  `menu` varchar(255) NOT NULL,
  `sub` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `id_role`, `id_menu`, `controllers`, `icon`, `iconActive`, `menu`, `sub`, `url`, `line`) VALUES
(1, 1, 0, 'Dashboard', 'bx bx-home-circle', 'bx bxs-home-circle 	', 'Dashboard', 0, NULL, 0),
(2, 1, 1, 'BukuTamu', 'bx bx-book-reader', 'bx bxs-book-reader', 'Buku Tamu', 1, NULL, 0),
(3, 1, 2, 'Karyawan', 'bx bx-group', 'bx bxs-group', 'Karyawan', 0, NULL, 0),
(4, 1, 3, 'Kasir', 'bx bx-cart', 'bx bxs-cart', 'Kasir', 1, NULL, 0),
(5, 1, 4, 'Gudang', 'bx bx-package', 'bx bxs-package', 'Gudang', 1, NULL, 0),
(6, 1, 999, 'Settings', 'bx bx-cog', 'bx bxs-cog', 'Setting Account', 0, 'account', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`, `icon`, `color`) VALUES
(1, 'Administrator', 'bx-data', 'danger'),
(2, 'Resepsionis', 'bx-book-bookmark', 'warning'),
(3, 'Pimpinan', 'bx-user-pin', 'info'),
(4, 'Karyawan', 'bx-user', 'secondary'),
(5, 'Kasir', 'bx-cart', 'success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `subMenu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `aktif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `id_menu`, `subMenu`, `url`, `aktif`) VALUES
(79, 1, 'Rekam Tamu Masuk', 'rekam', 1),
(80, 1, 'Data Berkunjung', 'data', 1),
(84, 3, 'Mesin Kasir', 'mesinKasir', 1),
(85, 3, 'Stor Pendapatan', 'storPendapatan', 1),
(86, 4, 'Sembako', 'sembako', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategoriProduk`
--
ALTER TABLE `kategoriProduk`
  ADD PRIMARY KEY (`idKategori`);

--
-- Indeks untuk tabel `persenKeuntungan`
--
ALTER TABLE `persenKeuntungan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `satuanProduk`
--
ALTER TABLE `satuanProduk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategoriProduk`
--
ALTER TABLE `kategoriProduk`
  MODIFY `idKategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `persenKeuntungan`
--
ALTER TABLE `persenKeuntungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT untuk tabel `satuanProduk`
--
ALTER TABLE `satuanProduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
