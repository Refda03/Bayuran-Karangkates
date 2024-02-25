-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 06:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(15, 33, 12, 120000, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kost`
--

INSERT INTO `kost` (`id_kost`, `nama_kost`, `tipe_kost`, `jenis_kost`, `jumlah_kamar`, `tanggal_tagih`, `nama_pemilik`, `nama_bank`, `no_rekening`, `foto_bangunan_utama`, `foto_kamar`, `foto_kamar_mandi`, `foto_interior`, `provinsi`, `kota`, `kecamatan`, `kelurahan`, `alamat`, `harga_sewa`, `kontak`, `deskripsi`, `id_pemilik`, `fasilitas_kost`) VALUES
(12, 'Tagihan Sampah', '', '', 0, '2024-02-19', '', 'BNI', 123123123, '', '', '', '', '', '', '', '', '', 120000, '', 'INI TAGIHAN SAMPAH', 22, ''),
(14, 'Shopee-pay', '', '', 0, '2024-02-29', '', 'BNI', 123123123, '', '', '', '', '', '', '', '', '', 320000, '', 'BAYAR BLOK', 22, '');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `Id_kost` int(11) DEFAULT NULL,
  `Id_user` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles_user`
--

CREATE TABLE `roles_user` (
  `id_roles` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(8, 9, 320000, 2, '2024-02-19 15:36:28', 'Christy8.jpg'),
(9, 10, 320000, 2, '2024-02-19 15:43:27', 'Christy4.jpg'),
(10, 11, 120000, 1, '2024-02-19 15:50:14', 'Zee.jpg'),
(11, 12, 320000, 1, '2024-02-19 15:53:49', 'Christy7.jpeg'),
(12, 13, 120000, 2, '2024-02-19 15:54:40', 'Christy8.jpg'),
(13, 14, 320000, 2, '2024-02-19 15:55:25', 'fiony.jpeg'),
(14, 15, 120000, 2, '2024-02-19 15:56:07', 'freya2.jpeg');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `email`, `username`, `password`, `no_hp`, `pekerjaan`, `jenis_kelamin`, `foto_ktp`, `foto_profil`, `roles`, `id_kost_saya`) VALUES
(22, 'Pak Deta', 'deta@mail.com', 'deta', 'deta', '082147483647', 'deta owner', ' laki-laki', '', 'pexels-photo-2340978.jpeg', 2, 0),
(25, 'Muhammad Iqbal', 'muhiqsimui@gmail.com', 'user', 'user', '082133771248', 'Mahasiswa', '         laki-laki', 'Christy4.jpg', 'ada.PNG', 1, 0),
(26, 'deta2', 'deta2@mail.com', 'deta2', 'deta2', '2222222', 'Programmer', '  laki-laki', 'ele.jpg', 'pexels-photo-3779677.jpeg', 2, 0),
(30, 'admin', '', 'admin', 'admin', '0', '', '', '', '', 3, 0),
(31, 'Jhon Dee', 'deta3@mail.com', 'deta3', 'deta3', '0433211452', 'Programmer', '  laki-laki', 'www.drawesome.uy-vac46s66tb.png', 'pexels-photo-220453.jpeg', 2, 0),
(32, 'Angelina Christy', 'christy@mail.com', 'christy', 'christy', '088887878787', 'Biduan JKT48', ' perempuan', 'Freya jkt48.jpeg', 'Christy5jpg.jpg', 1, 0),
(33, 'Azizi Shafa Asadel', 'zee@mail.com', 'zee', 'zee', '123123123123', 'Biduan JKT48', 'perempuan', 'Zee4.jpg', 'Zee4.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wishlist` int(11) NOT NULL,
  `id_kost` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kost`
--
ALTER TABLE `kost`
  MODIFY `id_kost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `no_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
