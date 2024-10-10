-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2024 at 06:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_pengelolaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `td_peminjaman_brg`
--

CREATE TABLE `td_peminjaman_brg` (
  `pbd_id` varchar(20) NOT NULL,
  `pb_id` varchar(20) NOT NULL,
  `br_kode` varchar(12) NOT NULL,
  `pbd_tgl` datetime NOT NULL,
  `pbd_sts` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_barang_inventaris`
--

CREATE TABLE `tm_barang_inventaris` (
  `br_kode` varchar(12) NOT NULL,
  `jns_brg_kode` varchar(5) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `br_nama` varchar(50) NOT NULL,
  `br_tgl_terima` date NOT NULL,
  `brg_tgl_entry` datetime NOT NULL,
  `br_status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_peminjaman`
--

CREATE TABLE `tm_peminjaman` (
  `pb_id` varchar(20) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `pb_tgl` datetime NOT NULL,
  `pb_no_siswa` varchar(20) NOT NULL,
  `pb_nama_siswa` varchar(100) NOT NULL,
  `pb_harus_kembali_tgl` datetime NOT NULL,
  `pb_stat` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_pengembalian`
--

CREATE TABLE `tm_pengembalian` (
  `kembali_id` varchar(20) NOT NULL,
  `pb_id` varchar(20) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `kembali_tgl` datetime NOT NULL,
  `kembali_sts` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_user`
--

CREATE TABLE `tm_user` (
  `user_id` varchar(10) NOT NULL,
  `user_nama` varchar(50) NOT NULL,
  `user_pass` varchar(32) NOT NULL,
  `user_hak` varchar(2) NOT NULL,
  `user_sts` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_jenis_barang`
--

CREATE TABLE `tr_jenis_barang` (
  `jns_kode_brg` varchar(5) NOT NULL,
  `jns_nama_brg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `td_peminjaman_brg`
--
ALTER TABLE `td_peminjaman_brg`
  ADD PRIMARY KEY (`pbd_id`),
  ADD KEY `pb_id` (`pb_id`),
  ADD KEY `br_kode` (`br_kode`);

--
-- Indexes for table `tm_barang_inventaris`
--
ALTER TABLE `tm_barang_inventaris`
  ADD PRIMARY KEY (`br_kode`),
  ADD KEY `jns_brg_kode` (`jns_brg_kode`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tm_peminjaman`
--
ALTER TABLE `tm_peminjaman`
  ADD PRIMARY KEY (`pb_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tm_pengembalian`
--
ALTER TABLE `tm_pengembalian`
  ADD PRIMARY KEY (`kembali_id`),
  ADD KEY `pb_id` (`pb_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tm_user`
--
ALTER TABLE `tm_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tr_jenis_barang`
--
ALTER TABLE `tr_jenis_barang`
  ADD PRIMARY KEY (`jns_kode_brg`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `td_peminjaman_brg`
--
ALTER TABLE `td_peminjaman_brg`
  ADD CONSTRAINT `td_peminjaman_brg_ibfk_1` FOREIGN KEY (`pb_id`) REFERENCES `tm_peminjaman` (`pb_id`),
  ADD CONSTRAINT `td_peminjaman_brg_ibfk_2` FOREIGN KEY (`br_kode`) REFERENCES `tm_barang_inventaris` (`br_kode`);

--
-- Constraints for table `tm_barang_inventaris`
--
ALTER TABLE `tm_barang_inventaris`
  ADD CONSTRAINT `tm_barang_inventaris_ibfk_1` FOREIGN KEY (`jns_brg_kode`) REFERENCES `tr_jenis_barang` (`jns_kode_brg`),
  ADD CONSTRAINT `tm_barang_inventaris_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tm_user` (`user_id`);

--
-- Constraints for table `tm_peminjaman`
--
ALTER TABLE `tm_peminjaman`
  ADD CONSTRAINT `tm_peminjaman_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tm_user` (`user_id`);

--
-- Constraints for table `tm_pengembalian`
--
ALTER TABLE `tm_pengembalian`
  ADD CONSTRAINT `tm_pengembalian_ibfk_1` FOREIGN KEY (`pb_id`) REFERENCES `tm_peminjaman` (`pb_id`),
  ADD CONSTRAINT `tm_pengembalian_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tm_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
