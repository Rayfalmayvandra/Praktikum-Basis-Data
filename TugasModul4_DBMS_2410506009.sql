-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 07:04 PM
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
-- Database: `kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` int(11) NOT NULL,
  `Nama_Mahasiswa` varchar(50) NOT NULL,
  `Jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `Nama_Mahasiswa`, `Jurusan`) VALUES
(1, 'Rayfal', 'Teknologi Informasi'),
(2, 'Sabil', 'Teknologi Informasi'),
(3, 'Ilyasa', 'Gizi'),
(4, 'Adel', 'Hukum');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `Kode_Matkul` int(11) NOT NULL,
  `Nama_Matkul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`Kode_Matkul`, `Nama_Matkul`) VALUES
(1, 'Basis Data'),
(2, 'Biologi'),
(3, 'Kalkulus'),
(4, 'Pancasila');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `NPM` int(11) NOT NULL,
  `Kode_Matkul` int(11) NOT NULL,
  `Nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`NPM`, `Kode_Matkul`, `Nilai`) VALUES
(1, 1, 90.00),
(1, 3, 89.00),
(2, 1, 85.00),
(2, 3, 95.00),
(3, 2, 80.00),
(3, 4, 70.00),
(4, 2, 86.00),
(4, 4, 90.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`Kode_Matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD KEY `NPM` (`NPM`),
  ADD KEY `Kode_Matkul` (`Kode_Matkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `NPM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `Kode_Matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_Matkul`) REFERENCES `mata_kuliah` (`Kode_Matkul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
