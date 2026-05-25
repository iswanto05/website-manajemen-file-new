-- phpMyAdmin SQL Dump
-- version 5.2.0
-- Compatible with MariaDB 10.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `website_pln`

-- Table structure for table `dokumen`
CREATE TABLE `dokumen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) DEFAULT NULL,
  `nama_dokumen` varchar(255) DEFAULT NULL,
  `role` enum('admin','pegawai') DEFAULT NULL,
  `bidang` varchar(100) DEFAULT NULL,
  `path` text,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_dokumen` (`nama_dokumen`),
  KEY `dokumen_ibfk_1` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `dokumen` (`id`, `nip`, `nama_dokumen`, `role`, `bidang`, `path`, `keterangan`) VALUES
(26, NULL, 'ATSCVRobyAkshay.pdf', 'pegawai', 'SDM', '../assetss/img/dokumen/ATSCVRobyAkshay.pdf', '-'),
(27, '1234521DFSD123', 'avatar_6803a8677fa5a.png', 'pegawai', 'TL Pelaksana K4', '../assetss/img/dokumen/avatar_6803a8677fa5a.png', '-'),
(29, NULL, 'avatar_680a71d18f52b.png', 'pegawai', 'TL Pengelolaan Sistem', '../assetss/img/dokumen/avatar_680a71d18f52b.png', '-'),
(30, '1234521DFSD123', '1.png', 'pegawai', 'TL Pelaksana K4', '../assetss/img/dokumen/1.png', '-');

-- Table structure for table `log_dokumen`
CREATE TABLE `log_dokumen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) DEFAULT NULL,
  `nama_dokumen` varchar(255) NOT NULL,
  `aksi` enum('lihat','download') NOT NULL,
  `waktu` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `nama_dokumen` (`nama_dokumen`),
  KEY `log_dokumen_ibfk_1` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `log_dokumen` (`id`, `nip`, `nama_dokumen`, `aksi`, `waktu`) VALUES
(1, '1234521DFSD123', 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-23 20:29:57'),
(2, '1234521DFSD123', 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-23 21:00:42'),
(3, '1234521DFSD123', 'avatar_6803a8677fa5a.png', 'lihat', '2025-04-23 21:01:31'),
(4, '123456', 'avatar_6803a8677fa5a.png', 'lihat', '2025-04-23 21:07:26'),
(5, '1234521DFSD123', 'avatar_6803a8677fa5a.png', 'lihat', '2025-04-23 21:10:02'),
(6, '1234521DFSD123', 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-23 21:10:10'),
(7, '123456', 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-23 21:34:30'),
(8, NULL, 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-24 20:31:24'),
(9, NULL, 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-24 20:31:41'),
(10, NULL, 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-24 20:31:59'),
(11, NULL, 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-25 00:25:47'),
(12, NULL, 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-25 00:26:48'),
(13, '123456', 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-25 00:27:03'),
(14, '123456', 'ATSCVRobyAkshay.pdf', 'lihat', '2025-04-25 09:41:09'),
(15, '1234521DFSD123', 'avatar_6803a8677fa5a.png', 'lihat', '2025-04-25 09:42:52'),
(16, '1234521DFSD123', '1.png', 'lihat', '2025-04-25 09:42:56');

-- Table structure for table `reset_password`
CREATE TABLE `reset_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `bidang` varchar(100) DEFAULT NULL,
  `status` enum('pending','completed') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `users`
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pegawai') NOT NULL,
  `bidang` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nip` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `nip`, `nama`, `password`, `role`, `bidang`, `avatar`, `email`, `token`) VALUES
(13, '1234521DFSD123', 'Beki', '$2y$10$xWpEOaELApZao6UcE3psVOmX6x2djGu6lkVzoLXnp8rSavm6EOptO', 'pegawai', 'TL Pelaksana K4', '', NULL, NULL),
(16, '123456', 'Admin', '$2y$10$mbZuXDZhmEwcR78MK9GoHe45o7CsDDoqqvyacDjSLjliIZyEWd8CK', 'admin', 'TI', 'avatar_680a7225a0998.png', 'testwebsite723@gmail.com', '469ce528d09243e42e500f2f3d91baea257339d5ee4181d2f4baa6129995d93f');

-- Constraints
ALTER TABLE `dokumen`
  ADD CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `users` (`nip`) ON DELETE SET NULL;

ALTER TABLE `log_dokumen`
  ADD CONSTRAINT `log_dokumen_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `users` (`nip`) ON DELETE SET NULL,
  ADD CONSTRAINT `log_dokumen_ibfk_2` FOREIGN KEY (`nama_dokumen`) REFERENCES `dokumen` (`nama_dokumen`);
COMMIT;
