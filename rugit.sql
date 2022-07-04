-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 03:28 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rugit`
--

-- --------------------------------------------------------

--
-- Table structure for table `detil_view_rumah`
--

CREATE TABLE `detil_view_rumah` (
  `ID_VIEW` int(11) NOT NULL,
  `ID_RUMAH` int(11) NOT NULL,
  `NAMA_FILE` varchar(125) NOT NULL,
  `LINK_FILE` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `ID_KECAMATAN` int(11) NOT NULL,
  `ID_KOTA` int(11) NOT NULL,
  `NAMA_KECAMATAN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`ID_KECAMATAN`, `ID_KOTA`, `NAMA_KECAMATAN`) VALUES
(1, 1, 'Semampir'),
(2, 1, 'Gubeng'),
(3, 2, 'Lowokwaru'),
(4, 2, 'Sukun'),
(5, 3, 'Bumiaji'),
(6, 3, 'Batu'),
(7, 5, 'Cinere'),
(8, 5, 'Sawangan'),
(9, 4, 'Bogor Barat'),
(10, 4, 'Bogor Utara'),
(11, 6, 'Cibeureum'),
(12, 6, 'Cikole');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `ID_KELURAHAN` int(11) NOT NULL,
  `ID_KECAMATAN` int(11) NOT NULL,
  `NAMA_KELURAHAN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
INSERT INTO `kelurahan` (`ID_KELURAHAN`, `ID_KECAMATAN`, `NAMA_KELURAHAN`) VALUES
(1, 1, 'Ampel'),
(2, 1, 'Sidotopo'),
(3, 2, 'Gubeng'),
(4, 2, 'Airlangga'),
(5, 3, 'Dinoyo'),
(6, 3, 'Merjosari'),
(7, 4, 'Sukun'),
(8, 4, 'Tanjung Rejo'),
(9, 5, 'Gunungsari'),
(10, 5, 'Bumiaji'),
(11, 6, 'Sisir'),
(12, 6, 'Temas'),
(13, 7, 'Cinere'),
(14, 7, 'Gandul'),
(15, 8, 'Kedaung'),
(16, 8, 'Cinangka'),
(17, 9, 'Menteng'),
(18, 9, 'Curug'),
(19, 10, 'Tanah Baru'),
(20, 10, 'Ciparigi');
--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `ID_KOTA` int(11) NOT NULL,
  `ID_PROVINSI` int(11) NOT NULL,
  `NAMA_KOTA` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`ID_KOTA`, `ID_PROVINSI`, `NAMA_KOTA`) VALUES
(1, 1, 'Kota  Surabaya'),
(2, 1, 'Kota Malang'),
(3, 1, 'Kota Batu'),
(4, 2, 'Kota Bogor'),
(5, 2, 'Kota Depok'),
(6, 2, 'Kota Sukabumi');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `ID_NOTIFIKASI` int(11) NOT NULL,
  `NAMA_NOTIFIKASI` varchar(125) NOT NULL,
  `ISI_NOTIFIKASI` varchar(500) NOT NULL,
  `STATUS_NOTIFIKASI` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notif_bayar`
--

CREATE TABLE `notif_bayar` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_NOTIFIKASI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notif_jual`
--

CREATE TABLE `notif_jual` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_NOTIFIKASI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `TANGGAL_PEMBAYARAN` date NOT NULL,
  `TOTAL_PEMBAYARAN` varchar(500) NOT NULL,
  `STATUS_PEMBAYARAN` varchar(50) NOT NULL,
  `BUKTI_PEMBAYARAN` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_PENGGUNA` int(11) NOT NULL,
  `ID_NOTIFIKASI` int(11) DEFAULT NULL,
  `ROLE_PENGGUNA` int(11) NOT NULL,
  `NAMA_PENGGUNA` varchar(125) NOT NULL,
  `ALAMAT_PENGGUNA` varchar(500) NOT NULL,
  `TELP_PENGGUNA` varchar(15) NOT NULL,
  `EMAIL_PENGGUNA` varchar(50) NOT NULL,
  `USERNAME_PENGGUNA` varchar(50) NOT NULL,
  `PASS_PENGGUNA` varchar(50) NOT NULL,
  `REKENING_PENGGUNA` varchar(50) NOT NULL,
  `STATUS_PENGGUNA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`ID_PENGGUNA`, `ID_NOTIFIKASI`, `ROLE_PENGGUNA`, `NAMA_PENGGUNA`, `ALAMAT_PENGGUNA`, `TELP_PENGGUNA`, `EMAIL_PENGGUNA`, `USERNAME_PENGGUNA`, `PASS_PENGGUNA`, `REKENING_PENGGUNA`, `STATUS_PENGGUNA`) VALUES
(1, NULL, 2, 'Budi', 'Wonokromo', '81295542688', 'Budi@msn.com', 'Budiwaw', '123', '1234567898', 'Belum Aktif'),
(2, NULL, 1, 'Andi', 'Gedangan', '81295542601', 'Andi@msn.com', 'Andihea', '123', '876543219', 'Belum Aktif'),
(3, NULL, 3, 'Nina', 'Rungkut', '81295542444', 'Nina@msn.com', 'Ninaninu', '123', '-', 'Belum Aktif'),
(4, NULL, 2, 'Jaki', 'Gubeng', '85764430894', 'Jaki@msn.com', 'Jakiew', '123', '', 'Belum Aktif'),
(5, NULL, 3, 'Mario', 'Airlangga', '81297664308', 'Mario@msn.com', 'Marioge', '123', '', 'Belum Aktif'),
(6, NULL, 3, 'Udin', 'Jambangan', '87856443951', 'Udin@msn.com', 'Udininu', '123', '', 'Belum Aktif'),
(7, NULL, 3, 'Maria', 'Rungkut', '85734215603', 'Maria@msn.com', 'Mariasik', '123', '', 'Belum Aktif'),
(8, NULL, 2, 'Angga', 'Kebraon', '84679494848', 'Angga@msn.com', 'Nggaw', '123', '', 'Belum Aktif'),
(9, NULL, 2, 'Jamila', 'Kedungsari', '83834649511', 'Jamila@msn.com', 'Jamilawu', '123', '', 'Belum Aktif'),
(10, NULL, 2, 'Nadya', 'Wonokusumo', '85730035356', 'Nadya@msn.com', 'Nadyakiw', '123', '', 'Belum Aktif'),
(11, NULL, 3, 'Mano', 'Gubeng', '85730035356', 'Mano@msn.com', 'Manow', '$2y$10$bKonzFqnkU0lWOc6ojkww.JybaDYQDkn1XK.IS7jS16', '-', 'Belum Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_RUMAH` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `TANGGAL_PENJUALAN` date NOT NULL,
  `STATUS_PENJUALAN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `ID_PROVINSI` int(11) NOT NULL,
  `NAMA_PROVINSI` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`ID_PROVINSI`, `NAMA_PROVINSI`) VALUES
(1, 'Jawa Timur'),
(2, 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_ROLE` int(11) NOT NULL,
  `NAMA_ROLE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID_ROLE`, `NAMA_ROLE`) VALUES
(1, 'Admin'),
(2, 'Penjual'),
(3, 'Pembeli');

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `ID_RUMAH` int(11) NOT NULL,
  `ID_KELURAHAN` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `JUDUL_RUMAH` varchar(125) NOT NULL,
  `ALAMAT_RUMAH` varchar(500) NOT NULL,
  `DESKRIPSI_RUMAH` varchar(500) NOT NULL,
  `HARGA_RUMAH` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detil_view_rumah`
--
ALTER TABLE `detil_view_rumah`
  ADD PRIMARY KEY (`ID_VIEW`),
  ADD KEY `FK_DETIL_VI_MEMILIKI__RUMAH` (`ID_RUMAH`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`ID_KECAMATAN`),
  ADD KEY `FK_KECAMATA_TERDIRI_A_KOTA` (`ID_KOTA`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`ID_KELURAHAN`),
  ADD KEY `FK_KELURAHA_MELINGKUP_KECAMATA` (`ID_KECAMATAN`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`ID_KOTA`),
  ADD KEY `FK_KOTA_MELINGKUP_PROVINSI` (`ID_PROVINSI`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`ID_NOTIFIKASI`);

--
-- Indexes for table `notif_bayar`
--
ALTER TABLE `notif_bayar`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`,`ID_NOTIFIKASI`),
  ADD KEY `FK_NOTIF_BA_NOTIF_BAY_NOTIFIKA` (`ID_NOTIFIKASI`);

--
-- Indexes for table `notif_jual`
--
ALTER TABLE `notif_jual`
  ADD PRIMARY KEY (`ID_PENJUALAN`,`ID_NOTIFIKASI`),
  ADD KEY `FK_NOTIF_JU_NOTIF_JUA_NOTIFIKA` (`ID_NOTIFIKASI`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `FK_PEMBAYAR_MENGECEK_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_PENGGUNA`),
  ADD KEY `FK_PENGGUNA_NOTIF_DAF_NOTIFIKA` (`ID_NOTIFIKASI`),
  ADD KEY `FK_PENGGUNA_MEMILIKI_ROLE` (`ROLE_PENGGUNA`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_PENJUALAN`),
  ADD KEY `FK_PENJUALA_RELATION__RUMAH` (`ID_RUMAH`),
  ADD KEY `FK_PENJUALA_DILAKUKAN_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`ID_PROVINSI`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_ROLE`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`ID_RUMAH`),
  ADD KEY `FK_RUMAH_MENDATA_KELURAHA` (`ID_KELURAHAN`),
  ADD KEY `FK_RUMAH_MENAWARKA_PENGGUNA` (`ID_PENGGUNA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detil_view_rumah`
--
ALTER TABLE `detil_view_rumah`
  MODIFY `ID_VIEW` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `ID_KECAMATAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `ID_KELURAHAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `ID_KOTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `ID_NOTIFIKASI` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `ID_PENGGUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_PENJUALAN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `ID_PROVINSI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rumah`
--
ALTER TABLE `rumah`
  MODIFY `ID_RUMAH` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detil_view_rumah`
--
ALTER TABLE `detil_view_rumah`
  ADD CONSTRAINT `FK_DETIL_VI_MEMILIKI__RUMAH` FOREIGN KEY (`ID_RUMAH`) REFERENCES `rumah` (`ID_RUMAH`);

--
-- Constraints for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `FK_KECAMATA_TERDIRI_A_KOTA` FOREIGN KEY (`ID_KOTA`) REFERENCES `kota` (`ID_KOTA`);

--
-- Constraints for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD CONSTRAINT `FK_KELURAHA_MELINGKUP_KECAMATA` FOREIGN KEY (`ID_KECAMATAN`) REFERENCES `kecamatan` (`ID_KECAMATAN`);

--
-- Constraints for table `kota`
--
ALTER TABLE `kota`
  ADD CONSTRAINT `FK_KOTA_MELINGKUP_PROVINSI` FOREIGN KEY (`ID_PROVINSI`) REFERENCES `provinsi` (`ID_PROVINSI`);

--
-- Constraints for table `notif_bayar`
--
ALTER TABLE `notif_bayar`
  ADD CONSTRAINT `FK_NOTIF_BA_NOTIF_BAY_NOTIFIKA` FOREIGN KEY (`ID_NOTIFIKASI`) REFERENCES `notifikasi` (`ID_NOTIFIKASI`),
  ADD CONSTRAINT `FK_NOTIF_BA_NOTIF_BAY_PEMBAYAR` FOREIGN KEY (`ID_PEMBAYARAN`) REFERENCES `pembayaran` (`ID_PEMBAYARAN`);

--
-- Constraints for table `notif_jual`
--
ALTER TABLE `notif_jual`
  ADD CONSTRAINT `FK_NOTIF_JU_NOTIF_JUA_NOTIFIKA` FOREIGN KEY (`ID_NOTIFIKASI`) REFERENCES `notifikasi` (`ID_NOTIFIKASI`),
  ADD CONSTRAINT `FK_NOTIF_JU_NOTIF_JUA_PENJUALA` FOREIGN KEY (`ID_PENJUALAN`) REFERENCES `penjualan` (`ID_PENJUALAN`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `FK_PEMBAYAR_MENGECEK_PENGGUNA` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `FK_PENGGUNA_MEMILIKI_ROLE` FOREIGN KEY (`ROLE_PENGGUNA`) REFERENCES `role` (`ID_ROLE`),
  ADD CONSTRAINT `FK_PENGGUNA_NOTIF_DAF_NOTIFIKA` FOREIGN KEY (`ID_NOTIFIKASI`) REFERENCES `notifikasi` (`ID_NOTIFIKASI`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `FK_PENJUALA_DILAKUKAN_PENGGUNA` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`);
  ADD CONSTRAINT `FK_RUMAH_RELATION__RUMAH` FOREIGN KEY (`ID_RUMAH`) REFERENCES `rumah` (`ID_rumah`);

--
-- Constraints for table `rumah`
--
ALTER TABLE `rumah`
  ADD CONSTRAINT `FK_RUMAH_MENAWARKA_PENGGUNA` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`),
  ADD CONSTRAINT `FK_RUMAH_MENDATA_KELURAHA` FOREIGN KEY (`ID_KELURAHAN`) REFERENCES `kelurahan` (`ID_KELURAHAN`),
  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
