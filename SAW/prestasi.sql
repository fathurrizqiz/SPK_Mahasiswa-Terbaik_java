-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 05:46 AM
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
-- Database: `prestasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id`, `name`, `prodi`) VALUES
(1, 'Setiabudi', 'Teknik Informatika'),
(2, 'Fathur Rizqi', 'Teknik Informatika'),
(3, 'Aura P', 'Teknik Informatika'),
(4, 'Yasir Rizki', 'Teknik Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `alt_id` int(11) NOT NULL,
  `ipk` float NOT NULL,
  `kedisiplinan` int(11) NOT NULL,
  `kehadiran` int(11) NOT NULL,
  `organisasi` int(11) NOT NULL,
  `kompetensi` int(11) NOT NULL,
  `sikap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `alt_id`, `ipk`, `kedisiplinan`, `kehadiran`, `organisasi`, `kompetensi`, `sikap`) VALUES
(1, 1, 3.93, 5, 6, 7, 8, 8),
(2, 2, 3.5, 6, 8, 4, 6, 7),
(3, 3, 3.4, 7, 6, 8, 5, 7),
(4, 4, 3.7, 8, 5, 6, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_label`
--

CREATE TABLE `kriteria_label` (
  `id` int(11) NOT NULL,
  `kriteria` varchar(25) NOT NULL,
  `label` enum('cost','benefit') NOT NULL DEFAULT 'benefit',
  `bobot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kriteria_label`
--

INSERT INTO `kriteria_label` (`id`, `kriteria`, `label`, `bobot`) VALUES
(1, 'ipk', 'benefit', 0.2),
(2, 'kedisiplinan', 'benefit', 0.2),
(3, 'kehadiran', 'benefit', 0.2),
(4, 'organisasi', 'benefit', 0.2),
(5, 'kompetensi', 'benefit', 0.1),
(6, 'sikap', 'cost', 0.1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alt_id` (`alt_id`);

--
-- Indexes for table `kriteria_label`
--
ALTER TABLE `kriteria_label`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kriteria_label`
--
ALTER TABLE `kriteria_label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `kriteria_ibfk_1` FOREIGN KEY (`alt_id`) REFERENCES `alternatif` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
