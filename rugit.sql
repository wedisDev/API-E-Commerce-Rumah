# ************************************************************
# Sequel Ace SQL dump
# Version 20031
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.29)
# Database: rugit
# Generation Time: 2022-07-13 14:40:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table detil_view_rumah
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detil_view_rumah`;

CREATE TABLE `detil_view_rumah` (
  `ID_VIEW` int NOT NULL AUTO_INCREMENT,
  `ID_RUMAH` int NOT NULL,
  `NAMA_FILE` varchar(125) NOT NULL,
  `LINK_FILE` varchar(500) NOT NULL,
  PRIMARY KEY (`ID_VIEW`),
  KEY `FK_DETIL_VI_MEMILIKI__RUMAH` (`ID_RUMAH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table kecamatan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kecamatan`;

CREATE TABLE `kecamatan` (
  `ID_KECAMATAN` int NOT NULL AUTO_INCREMENT,
  `ID_KOTA` int NOT NULL,
  `NAMA_KECAMATAN` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_KECAMATAN`),
  KEY `FK_KECAMATA_TERDIRI_A_KOTA` (`ID_KOTA`),
  CONSTRAINT `FK_KECAMATA_TERDIRI_A_KOTA` FOREIGN KEY (`ID_KOTA`) REFERENCES `kota` (`ID_KOTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `kecamatan` WRITE;
/*!40000 ALTER TABLE `kecamatan` DISABLE KEYS */;

INSERT INTO `kecamatan` (`ID_KECAMATAN`, `ID_KOTA`, `NAMA_KECAMATAN`)
VALUES
	(1,1,'Semampir'),
	(2,1,'Gubeng'),
	(3,2,'Lowokwaru'),
	(4,2,'Sukun'),
	(5,3,'Bumiaji'),
	(6,3,'Batu'),
	(7,5,'Cinere'),
	(8,5,'Sawangan'),
	(9,4,'Bogor Barat'),
	(10,4,'Bogor Utara'),
	(11,6,'Cibeureum'),
	(12,6,'Cikole');

/*!40000 ALTER TABLE `kecamatan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kelurahan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kelurahan`;

CREATE TABLE `kelurahan` (
  `ID_KELURAHAN` int NOT NULL AUTO_INCREMENT,
  `ID_KECAMATAN` int NOT NULL,
  `NAMA_KELURAHAN` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_KELURAHAN`),
  KEY `FK_KELURAHA_MELINGKUP_KECAMATA` (`ID_KECAMATAN`),
  CONSTRAINT `FK_KELURAHA_MELINGKUP_KECAMATA` FOREIGN KEY (`ID_KECAMATAN`) REFERENCES `kecamatan` (`ID_KECAMATAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `kelurahan` WRITE;
/*!40000 ALTER TABLE `kelurahan` DISABLE KEYS */;

INSERT INTO `kelurahan` (`ID_KELURAHAN`, `ID_KECAMATAN`, `NAMA_KELURAHAN`)
VALUES
	(1,1,'Ampel'),
	(2,1,'Sidotopo'),
	(3,2,'Gubeng'),
	(4,2,'Airlangga'),
	(5,3,'Dinoyo'),
	(6,3,'Merjosari'),
	(7,4,'Sukun'),
	(8,4,'Tanjung Rejo'),
	(9,5,'Gunungsari'),
	(10,5,'Bumiaji'),
	(11,6,'Sisir'),
	(12,6,'Temas'),
	(13,7,'Cinere'),
	(14,7,'Gandul'),
	(15,8,'Kedaung'),
	(16,8,'Cinangka'),
	(17,9,'Menteng'),
	(18,9,'Curug'),
	(19,10,'Tanah Baru'),
	(20,10,'Ciparigi');

/*!40000 ALTER TABLE `kelurahan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kota
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kota`;

CREATE TABLE `kota` (
  `ID_KOTA` int NOT NULL AUTO_INCREMENT,
  `ID_PROVINSI` int NOT NULL,
  `NAMA_KOTA` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_KOTA`),
  KEY `FK_KOTA_MELINGKUP_PROVINSI` (`ID_PROVINSI`),
  CONSTRAINT `FK_KOTA_MELINGKUP_PROVINSI` FOREIGN KEY (`ID_PROVINSI`) REFERENCES `provinsi` (`ID_PROVINSI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `kota` WRITE;
/*!40000 ALTER TABLE `kota` DISABLE KEYS */;

INSERT INTO `kota` (`ID_KOTA`, `ID_PROVINSI`, `NAMA_KOTA`)
VALUES
	(1,1,'Kota  Surabaya'),
	(2,1,'Kota Malang'),
	(3,1,'Kota Batu'),
	(4,2,'Kota Bogor'),
	(5,2,'Kota Depok'),
	(6,2,'Kota Sukabumi');

/*!40000 ALTER TABLE `kota` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notif_bayar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notif_bayar`;

CREATE TABLE `notif_bayar` (
  `ID_PEMBAYARAN` int NOT NULL,
  `ID_NOTIFIKASI` int NOT NULL,
  PRIMARY KEY (`ID_PEMBAYARAN`,`ID_NOTIFIKASI`),
  KEY `FK_NOTIF_BA_NOTIF_BAY_NOTIFIKA` (`ID_NOTIFIKASI`),
  CONSTRAINT `FK_NOTIF_BA_NOTIF_BAY_NOTIFIKA` FOREIGN KEY (`ID_NOTIFIKASI`) REFERENCES `notifikasi` (`ID_NOTIFIKASI`),
  CONSTRAINT `FK_NOTIF_BA_NOTIF_BAY_PEMBAYAR` FOREIGN KEY (`ID_PEMBAYARAN`) REFERENCES `pembayaran` (`ID_PEMBAYARAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table notif_jual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notif_jual`;

CREATE TABLE `notif_jual` (
  `ID_PENJUALAN` int NOT NULL,
  `ID_NOTIFIKASI` int NOT NULL,
  PRIMARY KEY (`ID_PENJUALAN`,`ID_NOTIFIKASI`),
  KEY `FK_NOTIF_JU_NOTIF_JUA_NOTIFIKA` (`ID_NOTIFIKASI`),
  CONSTRAINT `FK_NOTIF_JU_NOTIF_JUA_NOTIFIKA` FOREIGN KEY (`ID_NOTIFIKASI`) REFERENCES `notifikasi` (`ID_NOTIFIKASI`),
  CONSTRAINT `FK_NOTIF_JU_NOTIF_JUA_PENJUALA` FOREIGN KEY (`ID_PENJUALAN`) REFERENCES `penjualan` (`ID_PENJUALAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table notifikasi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifikasi`;

CREATE TABLE `notifikasi` (
  `ID_NOTIFIKASI` int NOT NULL AUTO_INCREMENT,
  `NAMA_NOTIFIKASI` varchar(125) NOT NULL,
  `ISI_NOTIFIKASI` varchar(500) NOT NULL,
  `STATUS_NOTIFIKASI` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_NOTIFIKASI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table pembayaran
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `ID_PEMBAYARAN` int NOT NULL AUTO_INCREMENT,
  `ID_PENGGUNA` int DEFAULT NULL,
  `TANGGAL_PEMBAYARAN` date NOT NULL,
  `TOTAL_PEMBAYARAN` varchar(500) NOT NULL,
  `STATUS_PEMBAYARAN` varchar(50) NOT NULL,
  `BUKTI_PEMBAYARAN` varchar(500) NOT NULL,
  PRIMARY KEY (`ID_PEMBAYARAN`),
  KEY `FK_PEMBAYAR_MENGECEK_PENGGUNA` (`ID_PENGGUNA`),
  CONSTRAINT `FK_PEMBAYAR_MENGECEK_PENGGUNA` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table pengguna
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pengguna`;

CREATE TABLE `pengguna` (
  `ID_PENGGUNA` int NOT NULL AUTO_INCREMENT,
  `ID_NOTIFIKASI` int DEFAULT NULL,
  `ROLE_PENGGUNA` int NOT NULL,
  `NAMA_PENGGUNA` varchar(125) NOT NULL,
  `ALAMAT_PENGGUNA` varchar(500) NOT NULL,
  `TELP_PENGGUNA` varchar(15) NOT NULL,
  `EMAIL_PENGGUNA` varchar(50) NOT NULL,
  `USERNAME_PENGGUNA` varchar(50) NOT NULL,
  `PASS_PENGGUNA` varchar(50) NOT NULL,
  `REKENING_PENGGUNA` varchar(50) NOT NULL,
  `STATUS_PENGGUNA` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PENGGUNA`),
  KEY `FK_PENGGUNA_NOTIF_DAF_NOTIFIKA` (`ID_NOTIFIKASI`),
  KEY `FK_PENGGUNA_MEMILIKI_ROLE` (`ROLE_PENGGUNA`),
  CONSTRAINT `FK_PENGGUNA_MEMILIKI_ROLE` FOREIGN KEY (`ROLE_PENGGUNA`) REFERENCES `role` (`ID_ROLE`),
  CONSTRAINT `FK_PENGGUNA_NOTIF_DAF_NOTIFIKA` FOREIGN KEY (`ID_NOTIFIKASI`) REFERENCES `notifikasi` (`ID_NOTIFIKASI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `pengguna` WRITE;
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;

INSERT INTO `pengguna` (`ID_PENGGUNA`, `ID_NOTIFIKASI`, `ROLE_PENGGUNA`, `NAMA_PENGGUNA`, `ALAMAT_PENGGUNA`, `TELP_PENGGUNA`, `EMAIL_PENGGUNA`, `USERNAME_PENGGUNA`, `PASS_PENGGUNA`, `REKENING_PENGGUNA`, `STATUS_PENGGUNA`)
VALUES
	(1,NULL,2,'Budi','Wonokromo','81295542688','Budi@msn.com','Budiwaw','123','1234567898','Belum Aktif'),
	(2,NULL,1,'Andi','Gedangan','81295542601','Andi@msn.com','Andihea','123','876543219','Belum Aktif'),
	(3,NULL,3,'Nina','Rungkut','81295542444','Nina@msn.com','Ninaninu','123','632132112','Belum Aktif'),
	(4,NULL,2,'Jaki','Gubeng','85764430894','Jaki@msn.com','Jakiew','123','632132112','Belum Aktif'),
	(5,NULL,3,'Mario','Airlangga','81297664308','Mario@msn.com','Marioge','123','632132112','Belum Aktif'),
	(6,NULL,3,'Udin','Jambangan','87856443951','Udin@msn.com','Udininu','123','632132112','Belum Aktif'),
	(7,NULL,3,'Maria','Rungkut','85734215603','Maria@msn.com','Mariasik','123','632132112','Belum Aktif'),
	(8,NULL,2,'Angga','Kebraon','84679494848','Angga@msn.com','Nggaw','123','632132112','Belum Aktif'),
	(9,NULL,2,'Jamila','Kedungsari','83834649511','Jamila@msn.com','Jamilawu','123','632132112','Belum Aktif'),
	(10,NULL,2,'Nadya2','Wonokusumo','85730035356','Nadya@msn.com','Nadyakiw','123','632132112','Belum Aktif'),
	(11,NULL,3,'bayu nugroho','alamat bayu','08212121','bayu@gmail.com','bayu','bayu','632131232','Belum Aktif');

/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table penjualan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `ID_PENJUALAN` int NOT NULL AUTO_INCREMENT,
  `ID_RUMAH` int NOT NULL,
  `ID_PENGGUNA` int DEFAULT NULL,
  `BUKTI_TRANSFER` varchar(50) DEFAULT NULL,
  `TANGGAL_PENJUALAN` date NOT NULL,
  `STATUS_PENJUALAN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`ID_PENJUALAN`),
  KEY `FK_PENJUALA_RELATION__RUMAH` (`ID_RUMAH`),
  KEY `FK_PENJUALA_DILAKUKAN_PENGGUNA` (`ID_PENGGUNA`),
  CONSTRAINT `FK_PENJUALA_DILAKUKAN_PENGGUNA` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;

INSERT INTO `penjualan` (`ID_PENJUALAN`, `ID_RUMAH`, `ID_PENGGUNA`, `BUKTI_TRANSFER`, `TANGGAL_PENJUALAN`, `STATUS_PENJUALAN`)
VALUES
	(38,37,11,'39f7e5a1216191be5cb6a9632146829d.webp','2022-07-11','sukses'),
	(39,41,11,'032a383479b6727ee766668a4b5477a7.webp','2022-07-13','ditolak'),
	(40,38,11,'0f36191f0966ea6acccca82f0971d263.webp','2022-07-13','transfer');

/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table provinsi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provinsi`;

CREATE TABLE `provinsi` (
  `ID_PROVINSI` int NOT NULL AUTO_INCREMENT,
  `NAMA_PROVINSI` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_PROVINSI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `provinsi` WRITE;
/*!40000 ALTER TABLE `provinsi` DISABLE KEYS */;

INSERT INTO `provinsi` (`ID_PROVINSI`, `NAMA_PROVINSI`)
VALUES
	(1,'Jawa Timur'),
	(2,'Jawa Barat');

/*!40000 ALTER TABLE `provinsi` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `ID_ROLE` int NOT NULL AUTO_INCREMENT,
  `NAMA_ROLE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`ID_ROLE`, `NAMA_ROLE`)
VALUES
	(1,'Admin'),
	(2,'Penjual'),
	(3,'Pembeli');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rumah
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rumah`;

CREATE TABLE `rumah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kelurahan` int DEFAULT NULL,
  `id_pengguna` int DEFAULT NULL,
  `judul_rumah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_rumah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_rumah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_rumah` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '-',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rumah` WRITE;
/*!40000 ALTER TABLE `rumah` DISABLE KEYS */;

INSERT INTO `rumah` (`id`, `id_kelurahan`, `id_pengguna`, `judul_rumah`, `alamat_rumah`, `desc_rumah`, `harga_rumah`, `gambar`, `tgl`)
VALUES
	(37,2,10,'rumah 1','testes','tes','Rp. 100.000.000','f337d6a4f0e3374400be0b16c3e299b4.webp',NULL),
	(38,2,10,'bayu','bshsg','gdgdg','Rp. 290.000.000','f22a002c5ae967cd70a3a2ec86df8235.webp',NULL),
	(41,2,10,'dhdhh','gege','hssh','gegeg','0b0d703163fb6d597ba5d88431ca7667.webp','2022-07-13'),
	(42,1,10,'gkgkgkgkg','gkgkg','nfkt','jfjfjf','23ed3da68f6851ca5013121a4a9beaf1.webp','2022-07-13');

/*!40000 ALTER TABLE `rumah` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
