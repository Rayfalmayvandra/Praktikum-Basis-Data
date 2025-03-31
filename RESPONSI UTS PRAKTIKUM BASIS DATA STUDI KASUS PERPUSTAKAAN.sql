-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2025 at 07:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(20) DEFAULT 'Umum',
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `jurusan`, `tgl_daftar`) VALUES
('T001', 'Abdi', 'Akuntansi', '2023-02-12'),
('T002', 'Rayfal', 'Teknologi Informasi', '2023-02-10'),
('T003', 'Yasa', 'Teknik Mesin', '2023-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `id_penerbit` varchar(13) DEFAULT NULL
) ;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penerbit`, `tahun_terbit`, `id_penerbit`) VALUES
('B001', 'Pemprograman Web', 'Pt.SabilJaya', 2015, 'P001'),
('B002', 'Cara Mudah Belajar Kalkulus', 'Pt.IlyasaMakmur', 2020, 'P002'),
('B003', 'Seni Komunikasi', 'Pt.DoaChanif', 2025, 'P003'),
('B004', 'Sistem Operasi Lanjut', 'Pt.CahayaAkbar', 2010, 'P004'),
('B005', 'Sistem Pencernaan Manusia', 'Pt.PasyaBuku', 2011, 'P005');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
(1, 'T001', 'B001', '2024-05-23', '2024-05-28', 0),
(2, 'T002', 'B002', '2024-05-30', '2024-06-10', 0),
(3, 'T003', 'B005', '2024-05-29', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(13) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `alamat`) VALUES
('P001', 'Pt.SabilJaya', 'Jalan Kartini'),
('P002', 'Pt.IlyasaMakmur', 'Jalan Raden Patah'),
('P003', 'Pt.DoaChanif', 'Jalan Ahmad Yani'),
('P004', 'Pt.CahayaAkbar', 'Jalan Jendral Soedirman'),
('P005', 'Pt.PasyaBuku', 'Jalan Sumpah Pemuda');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(5) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT NULL,
  `judul_buku` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_pinjam`, `tgl_kembali`, `denda`, `judul_buku`) VALUES
('T001', '2025-03-01', '2025-03-07', 5000, 'Belajar SQL'),
('T002', '2025-03-02', '2025-03-10', 3000, 'Bangunan Gedung'),
('T003', '2025-03-05', '2025-03-12', 2000, 'Pengantar Jaringan'),
('T004', '2025-03-06', '2025-03-13', 4000, 'Dasar-Dasar Ekonomi'),
('T005', '2025-03-07', '2025-03-14', 1000, 'Rangkaian Listrik'),
('T006', '2025-03-10', '2025-03-17', 0, 'Basis Data');

-- --------------------------------------------------------

--
-- Table structure for table `transaksianggota`
--

CREATE TABLE `transaksianggota` (
  `id_transaksi` varchar(5) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jurusan_anggota` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksianggota`
--

INSERT INTO `transaksianggota` (`id_transaksi`, `nama_anggota`, `jurusan_anggota`) VALUES
('T001', 'Abdi', 'Teknik Mesin'),
('T002', 'Yasa', 'Teknik Sipil'),
('T003', 'Citra', 'Sistem Informasi'),
('T004', 'Ilyasa', 'Manajemen'),
('T005', 'Rayfal', 'Teknik Elektro'),
('T006', 'David', 'Teknologi Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `transaksibuku`
--

CREATE TABLE `transaksibuku` (
  `judul_buku` varchar(40) NOT NULL,
  `penerbit_buku` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksibuku`
--

INSERT INTO `transaksibuku` (`judul_buku`, `penerbit_buku`) VALUES
('Bangunan Gedung', 'Pt.Yahya'),
('Basis Data', 'Pt.TeknologiAbadi'),
('Belajar SQL', 'Pt.Ayam'),
('Dasar-Dasar Ekonomi', 'Pt.BelajarMandiri'),
('Kalkulus Lanjut', 'Pt.BelajarBersama'),
('Pengantar Jaringan', 'Pt.PulangKampung'),
('Rangkaian Listrik', 'Pt.Djaya');

-- --------------------------------------------------------

--
-- Table structure for table `transaksipeminjaman`
--

CREATE TABLE `transaksipeminjaman` (
  `id_transaksi` varchar(5) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jurusan_anggota` varchar(30) NOT NULL,
  `judul_buku` varchar(40) NOT NULL,
  `penerbit_buku` varchar(30) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksipeminjaman`
--

INSERT INTO `transaksipeminjaman` (`id_transaksi`, `nama_anggota`, `jurusan_anggota`, `judul_buku`, `penerbit_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`) VALUES
('T001', 'Abdi', 'Teknik Mesin', 'Belajar SQL', 'Pt.Ayam', '2025-03-01', '2025-03-07', 5000),
('T002', 'Yasa', 'Teknik Sipil', 'Bangunan Gedung', 'Pt.Yahya', '2025-03-02', '2025-03-10', 3000),
('T003', 'Citra', 'Sistem Informasi', 'Pengantar Jaringan', 'Pt.PulangKampung', '2025-03-05', '2025-03-12', 2000),
('T004', 'Ilyasa', 'Manajemen', 'Dasar-Dasar Ekonomi', 'Pt.BelajarMandiri', '2025-03-06', '2025-03-13', 4000),
('T005', 'Rayfal', 'Teknik Elektro', 'Rangkaian Listrik', 'Pt.Djaya', '2025-03-07', '2025-03-14', 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_penerbit` (`id_penerbit`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `judul_buku` (`judul_buku`);

--
-- Indexes for table `transaksianggota`
--
ALTER TABLE `transaksianggota`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `transaksibuku`
--
ALTER TABLE `transaksibuku`
  ADD PRIMARY KEY (`judul_buku`);

--
-- Indexes for table `transaksipeminjaman`
--
ALTER TABLE `transaksipeminjaman`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_penerbit` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`judul_buku`) REFERENCES `transaksibuku` (`judul_buku`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksianggota` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
