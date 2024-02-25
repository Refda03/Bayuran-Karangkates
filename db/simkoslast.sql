-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2024 at 03:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simkos`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_kost` int(11) DEFAULT NULL,
  `hitungan_sewa` int(11) DEFAULT NULL,
  `durasi_sewa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `id_user`, `id_kost`, `hitungan_sewa`, `durasi_sewa`) VALUES
(2, 25, 9, 0, 0),
(3, 25, 9, 0, 0),
(4, 32, 11, 0, 0),
(5, 32, 11, 0, 0),
(6, 32, 11, 5000000, 0),
(7, 32, 11, 5000000, 0),
(8, 32, 12, 120000, 0),
(9, 32, 14, 320000, 0),
(10, 32, 14, 320000, 0),
(11, 32, 12, 120000, 0),
(12, 33, 14, 320000, 0),
(13, 33, 12, 120000, 0),
(14, 33, 14, 320000, 0),
(15, 33, 12, 120000, 0),
(16, 25, 14, 320000, 0),
(17, 33, 14, 320000, 0),
(18, 33, 12, 120000, 0),
(19, 33, 12, 120000, 0),
(20, 33, 12, 120000, 0),
(21, 33, 12, 120000, 0),
(22, 33, 12, 120000, 0),
(23, 33, 12, 120000, 0),
(24, 33, 12, 120000, 0),
(25, 33, 12, 120000, 0),
(26, 33, 12, 120000, 0),
(27, 33, 12, 120000, 0),
(28, 35, 12, 120000, 0),
(29, 35, 27, 1200000, 0),
(30, 35, 12, 120000, 0),
(31, 35, 12, 120000, 0),
(32, 35, 12, 120000, 0),
(33, 35, 12, 120000, 0),
(34, 35, 12, 120000, 0),
(35, 35, 12, 120000, 0),
(36, 35, 12, 120000, 0),
(37, 35, 12, 120000, 0),
(38, 35, 12, 120000, 0),
(39, 35, 12, 120000, 0),
(40, 35, 12, 120000, 0),
(41, 35, 12, 120000, 0),
(42, 35, 12, 120000, 0),
(43, 35, 12, 120000, 0),
(44, 35, 12, 120000, 0),
(45, 35, 12, 120000, 0),
(46, 35, 12, 120000, 0),
(47, 35, 12, 120000, 0),
(48, 35, 12, 120000, 0),
(49, 35, 12, 120000, 0),
(50, 35, 12, 120000, 0),
(51, 35, 12, 120000, 0),
(52, 35, 12, 120000, 0),
(53, 35, 12, 120000, 0),
(54, 35, 12, 120000, 0),
(55, 35, 12, 120000, 0),
(56, 35, 12, 120000, 0),
(57, 35, 12, 120000, 0),
(58, 35, 12, 120000, 0),
(59, 35, 12, 120000, 0),
(60, 35, 12, 120000, 0),
(61, 35, 12, 120000, 0),
(62, 35, 12, 120000, 0),
(63, 35, 12, 120000, 0),
(64, 35, 12, 120000, 0),
(65, 35, 12, 120000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `id_kost` int(11) DEFAULT NULL,
  `jumlah_kamar` int(11) DEFAULT NULL,
  `panjang_kamar` int(11) DEFAULT NULL,
  `lebar_kamar` int(11) DEFAULT NULL,
  `tipe_kamar` varchar(255) DEFAULT NULL,
  `biaya_fasilitas` int(11) DEFAULT NULL,
  `fasilitas_kamar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `kamar`
--
DELIMITER $$
CREATE TRIGGER `after_update` AFTER UPDATE ON `kamar` FOR EACH ROW BEGIN
	UPDATE kost SET jumlah_kamar=jumlah_kamar-1
	WHERE id_kost=NEW.id_kost;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_kamar` AFTER DELETE ON `kamar` FOR EACH ROW UPDATE kost SET kost.jumlah_kamar = kost.jumlah_kamar-old.jumlah_kamar
WHERE kost.id_kost=old.id_kost
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `total_kamar` AFTER INSERT ON `kamar` FOR EACH ROW BEGIN
	UPDATE kost SET jumlah_kamar=jumlah_kamar+NEW.jumlah_kamar
	WHERE id_kost=NEW.id_kost;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kost`
--

CREATE TABLE `kost` (
  `id_kost` int(11) NOT NULL,
  `nama_kost` varchar(255) DEFAULT NULL,
  `tipe_kost` varchar(255) DEFAULT NULL,
  `jenis_kost` varchar(255) DEFAULT NULL,
  `jumlah_kamar` int(11) DEFAULT NULL,
  `tanggal_tagih` date DEFAULT NULL,
  `nama_pemilik` text DEFAULT NULL,
  `nama_bank` text DEFAULT NULL,
  `no_rekening` int(11) DEFAULT NULL,
  `foto_bangunan_utama` varchar(255) DEFAULT NULL,
  `foto_kamar` varchar(255) DEFAULT NULL,
  `foto_kamar_mandi` varchar(255) DEFAULT NULL,
  `foto_interior` varchar(255) DEFAULT NULL,
  `provinsi` varchar(25) DEFAULT NULL,
  `kota` varchar(25) DEFAULT NULL,
  `kecamatan` varchar(25) DEFAULT NULL,
  `kelurahan` varchar(25) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `harga_sewa` int(11) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `id_pemilik` int(11) DEFAULT NULL,
  `fasilitas_kost` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kost`
--

INSERT INTO `kost` (`id_kost`, `nama_kost`, `tipe_kost`, `jenis_kost`, `jumlah_kamar`, `tanggal_tagih`, `nama_pemilik`, `nama_bank`, `no_rekening`, `foto_bangunan_utama`, `foto_kamar`, `foto_kamar_mandi`, `foto_interior`, `provinsi`, `kota`, `kecamatan`, `kelurahan`, `alamat`, `harga_sewa`, `kontak`, `deskripsi`, `id_pemilik`, `fasilitas_kost`) VALUES
(12, 'Tagihan Sampah', '', '', 0, '2024-02-19', '', 'BNI', 123123123, '', '', '', '', '', '', '', '', '', 120000, '', 'INI TAGIHAN SAMPAH', 22, ''),
(27, 'Tagihan PDAM', '', '', 0, '2024-02-20', '', 'BCA', 1212121212, '', '', '', '', '', '', '', '', '', 1200000, '', 'HEY BAYAR AIR UNCH UNCH', 22, '');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `Id_kost` int(11) DEFAULT NULL,
  `Id_user` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles_user`
--

CREATE TABLE `roles_user` (
  `id_roles` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles_user`
--

INSERT INTO `roles_user` (`id_roles`, `nama`) VALUES
(1, 'penghuni kost'),
(2, 'pemilik kost'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `no_tagihan` int(11) NOT NULL,
  `no_booking` int(11) DEFAULT NULL,
  `total_tagihan` int(11) DEFAULT NULL,
  `stats` int(11) DEFAULT NULL,
  `tanggal_tagihan` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bukti_bayar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`no_tagihan`, `no_booking`, `total_tagihan`, `stats`, `tanggal_tagihan`, `bukti_bayar`) VALUES
(1, 2, 350000, 3, '2024-02-19 14:45:14', ''),
(2, 3, 350000, 3, '2024-02-19 14:45:31', ''),
(3, 4, 5000000, 3, '2024-02-19 14:51:32', ''),
(4, 5, 5000000, 3, '2024-02-19 14:53:21', ''),
(5, 6, 5000000, 3, '2024-02-19 14:55:44', ''),
(6, 7, 5000000, 3, '2024-02-19 14:56:35', ''),
(7, 8, 120000, 1, '2024-02-19 15:11:03', 'Christy7.jpeg'),
(8, 9, 320000, 1, '2024-02-19 19:11:58', 'Christy8.jpg'),
(9, 10, 320000, 1, '2024-02-19 19:11:53', 'Christy4.jpg'),
(10, 11, 120000, 1, '2024-02-19 15:50:14', 'Zee.jpg'),
(11, 12, 320000, 1, '2024-02-19 15:53:49', 'Christy7.jpeg'),
(12, 13, 120000, 1, '2024-02-19 19:11:43', 'Christy8.jpg'),
(13, 14, 320000, 1, '2024-02-19 19:11:48', 'fiony.jpeg'),
(14, 15, 120000, 1, '2024-02-19 19:12:04', 'freya2.jpeg'),
(15, 16, 320000, 1, '2024-02-19 19:27:52', 'logo bumdes.jpg'),
(16, 17, 320000, 1, '2024-02-20 09:27:19', 'ab67616d0000b27303fa9397fb508e94d250f6af.jpeg'),
(17, 18, 120000, 3, '2024-02-20 10:19:17', ''),
(18, 19, 120000, 3, '2024-02-20 10:19:32', ''),
(19, 20, 120000, 3, '2024-02-20 10:19:55', ''),
(20, 21, 120000, 3, '2024-02-20 10:20:07', ''),
(21, 22, 120000, 3, '2024-02-20 10:24:22', ''),
(22, 23, 120000, 3, '2024-02-20 10:26:22', ''),
(23, 24, 120000, 3, '2024-02-20 10:27:12', ''),
(24, 25, 120000, 3, '2024-02-20 10:27:14', ''),
(25, 26, 120000, 3, '2024-02-20 10:27:30', ''),
(26, 27, 120000, 3, '2024-02-20 10:28:42', ''),
(27, 28, 120000, 1, '2024-02-20 11:30:34', '2024_01_20_11_04_IMG_1639.webp'),
(28, 29, 1200000, 1, '2024-02-20 11:30:43', 'IMG_6019.webp'),
(29, 30, 120000, 2, '2024-02-20 11:32:37', 'ab67706c0000da84c578185269aaa591265e34a8.jpeg'),
(30, 31, 120000, 2, '2024-02-20 11:37:08', 'ab67706c0000bebb8ba6934c57e556f93987742c.jpeg'),
(31, 32, 120000, 1, '2024-02-20 11:43:25', 'ab6761610000e5eb393666951ab8b14e9c4ed386.jpeg'),
(32, 33, 120000, 3, '2024-02-20 14:16:31', ''),
(33, 34, 120000, 3, '2024-02-20 14:17:15', ''),
(34, 35, 120000, 3, '2024-02-20 14:29:25', ''),
(35, 36, 120000, 3, '2024-02-20 14:29:43', ''),
(36, 37, 120000, 3, '2024-02-20 14:30:12', ''),
(37, 38, 120000, 3, '2024-02-20 14:31:12', ''),
(38, 39, 120000, 3, '2024-02-20 14:31:35', ''),
(39, 40, 120000, 3, '2024-02-20 14:32:27', ''),
(40, 41, 120000, 3, '2024-02-20 14:33:31', ''),
(41, 42, 120000, 3, '2024-02-20 14:33:32', ''),
(42, 43, 120000, 3, '2024-02-20 14:33:32', ''),
(43, 44, 120000, 3, '2024-02-20 14:33:33', ''),
(44, 45, 120000, 3, '2024-02-20 14:33:34', ''),
(45, 46, 120000, 3, '2024-02-20 14:33:34', ''),
(46, 47, 120000, 3, '2024-02-20 14:33:34', ''),
(47, 48, 120000, 3, '2024-02-20 14:33:34', ''),
(48, 49, 120000, 3, '2024-02-20 14:33:34', ''),
(49, 50, 120000, 3, '2024-02-20 14:33:34', ''),
(50, 51, 120000, 3, '2024-02-20 14:33:38', ''),
(51, 52, 120000, 3, '2024-02-20 14:34:00', ''),
(52, 53, 120000, 3, '2024-02-20 14:34:54', ''),
(53, 54, 120000, 3, '2024-02-20 14:34:55', ''),
(54, 55, 120000, 3, '2024-02-20 14:34:55', ''),
(55, 56, 120000, 3, '2024-02-20 14:34:55', ''),
(56, 57, 120000, 3, '2024-02-20 14:34:56', ''),
(57, 58, 120000, 3, '2024-02-20 14:34:56', ''),
(58, 59, 120000, 3, '2024-02-20 14:34:56', ''),
(59, 60, 120000, 3, '2024-02-20 14:34:56', ''),
(60, 61, 120000, 3, '2024-02-20 14:34:57', ''),
(61, 62, 120000, 3, '2024-02-20 14:34:58', ''),
(62, 63, 120000, 3, '2024-02-20 14:34:58', ''),
(63, 64, 120000, 3, '2024-02-20 14:34:58', ''),
(64, 65, 120000, 3, '2024-02-20 14:34:58', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(25) DEFAULT NULL,
  `foto_ktp` varchar(255) DEFAULT NULL,
  `foto_profil` text DEFAULT NULL,
  `roles` int(11) DEFAULT NULL,
  `id_kost_saya` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `email`, `username`, `password`, `no_hp`, `pekerjaan`, `jenis_kelamin`, `foto_ktp`, `foto_profil`, `roles`, `id_kost_saya`) VALUES
(22, 'Pak Deta', 'deta@mail.com', 'deta', 'deta', '082147483647', 'deta owner', '   laki-laki', '', 'Picture.jpg', 2, 0),
(25, 'Muhammad Iqbal', 'muhiqsimui@gmail.com', 'user', 'user', '082133771248', 'Mahasiswa', '          laki-laki', 'ab67616d0000b27303fa9397fb508e94d250f6af.jpeg', 'ab67616d0000b27303fa9397fb508e94d250f6af.jpeg', 1, 0),
(26, 'deta2', 'deta2@mail.com', 'deta2', 'deta2', '2222222', 'Programmer', '  laki-laki', 'ele.jpg', 'pexels-photo-3779677.jpeg', 2, 0),
(30, 'admin', '', 'admin', 'admin', '0', '', '', '', '', 3, 0),
(31, 'Jhon Dee', 'deta3@mail.com', 'deta3', 'deta3', '0433211452', 'Programmer', '   laki-laki', 'www.drawesome.uy-vac46s66tb.png', 'ab6761610000e5eb808be2612c9044731e5970cd.jpeg', 2, 0),
(32, 'Angelina Christy', 'christy@mail.com', 'christy', 'christy', '088887878787', 'Biduan JKT48', ' perempuan', 'Freya jkt48.jpeg', 'Christy5jpg.jpg', 1, 0),
(33, 'Azizi Shafa Asadel', 'zee@mail.com', 'zee', 'zee', '123123123123', 'Biduan JKT48', 'perempuan', '', 'Zee4.jpg', 1, 0),
(35, 'pmm', 'pmm@webmail.com', 'pmm', 'pmm', '21212', 'pmm', 'laki-laki', '', 'ab67616d0000b27303fa9397fb508e94d250f6af.jpeg', 1, 0),
(36, 'pmm', 'pmm@webmail.com', 'pmm1', 'pmm1', '212121', 'pmm', 'laki-laki', 'IMG_6019.webp', '2024_01_20_11_04_IMG_1639.webp', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wishlist` int(11) NOT NULL,
  `id_kost` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `id_user` (`id_user`,`id_kost`),
  ADD KEY `id_kost` (`id_kost`) USING BTREE;

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `kost`
--
ALTER TABLE `kost`
  ADD PRIMARY KEY (`id_kost`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `Id_kost` (`Id_kost`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Indexes for table `roles_user`
--
ALTER TABLE `roles_user`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`no_tagihan`),
  ADD KEY `no_booking` (`no_booking`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kost_saya` (`id_kost_saya`),
  ADD KEY `roles` (`roles`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wishlist`),
  ADD KEY `id_kost` (`id_kost`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kost`
--
ALTER TABLE `kost`
  MODIFY `id_kost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles_user`
--
ALTER TABLE `roles_user`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `no_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wishlist` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `kost`
--
ALTER TABLE `kost`
  ADD CONSTRAINT `kost_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `user` (`id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Id_kost`) REFERENCES `kost` (`id_kost`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking` (`id_booking`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roles`) REFERENCES `roles_user` (`id_roles`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`id_kost`) REFERENCES `kost` (`id_kost`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
