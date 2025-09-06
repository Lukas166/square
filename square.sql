-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2024 pada 19.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `square`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `enemy`
--

CREATE TABLE `enemy` (
  `enemyID` char(5) NOT NULL,
  `atkbase` int(11) NOT NULL,
  `hpbase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `enemy`
--

INSERT INTO `enemy` (`enemyID`, `atkbase`, `hpbase`) VALUES
('EN001', 5, 100),
('EN002', 15, 300);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stage`
--

CREATE TABLE `stage` (
  `stageID` char(5) NOT NULL,
  `enemyATKmul` int(11) NOT NULL,
  `enemyHPmul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stage`
--

INSERT INTO `stage` (`stageID`, `enemyATKmul`, `enemyHPmul`) VALUES
('FO001', 100, 100),
('FO002', 120, 120),
('FO003', 130, 130),
('FO004', 140, 140),
('FO005', 150, 150),
('FO006', 160, 160);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stage_enemy`
--

CREATE TABLE `stage_enemy` (
  `stageID` char(5) NOT NULL,
  `enemyID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stage_enemy`
--

INSERT INTO `stage_enemy` (`stageID`, `enemyID`) VALUES
('FO001', 'EN001'),
('FO002', 'EN001'),
('FO003', 'EN001'),
('FO003', 'EN002'),
('FO004', 'EN001'),
('FO004', 'EN002'),
('FO005', 'EN001'),
('FO005', 'EN002'),
('FO006', 'EN002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `hplvl` int(11) DEFAULT NULL,
  `atklvl` int(11) DEFAULT NULL,
  `lucklvl` int(11) DEFAULT NULL,
  `gems` bigint(20) DEFAULT NULL,
  `coins` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_stage`
--

CREATE TABLE `user_stage` (
  `userID` int(11) NOT NULL,
  `stageID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_weapon`
--

CREATE TABLE `user_weapon` (
  `userID` int(11) NOT NULL,
  `weaponID` char(4) NOT NULL,
  `weaponQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `weapons`
--

CREATE TABLE `weapons` (
  `weaponID` char(4) NOT NULL,
  `weaponName` text NOT NULL,
  `atkmul` int(11) NOT NULL,
  `hpmul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `weapons`
--

INSERT INTO `weapons` (`weaponID`, `weaponName`, `atkmul`, `hpmul`) VALUES
('C001', 'Iron Sword', 15, 15),
('C002', 'Iron Bow', 20, 10),
('C003', 'Iron Staff', 25, 5),
('C004', 'Iron Spear', 10, 20),
('C005', 'Iron Hammer', 5, 25),
('C006', 'Iron Shuriken', 30, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `enemy`
--
ALTER TABLE `enemy`
  ADD PRIMARY KEY (`enemyID`);

--
-- Indeks untuk tabel `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`stageID`);

--
-- Indeks untuk tabel `stage_enemy`
--
ALTER TABLE `stage_enemy`
  ADD UNIQUE KEY `stageID` (`stageID`,`enemyID`),
  ADD KEY `enemyID` (`enemyID`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `user_stage`
--
ALTER TABLE `user_stage`
  ADD UNIQUE KEY `userID` (`userID`,`stageID`),
  ADD KEY `stageID` (`stageID`);

--
-- Indeks untuk tabel `user_weapon`
--
ALTER TABLE `user_weapon`
  ADD UNIQUE KEY `userID` (`userID`,`weaponID`),
  ADD KEY `weaponID` (`weaponID`);

--
-- Indeks untuk tabel `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`weaponID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `stage_enemy`
--
ALTER TABLE `stage_enemy`
  ADD CONSTRAINT `stage_enemy_ibfk_1` FOREIGN KEY (`enemyID`) REFERENCES `enemy` (`enemyID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_enemy_ibfk_2` FOREIGN KEY (`stageID`) REFERENCES `stage` (`stageID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_stage`
--
ALTER TABLE `user_stage`
  ADD CONSTRAINT `user_stage_ibfk_1` FOREIGN KEY (`stageID`) REFERENCES `stage` (`stageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_stage_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_weapon`
--
ALTER TABLE `user_weapon`
  ADD CONSTRAINT `user_weapon_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_weapon_ibfk_2` FOREIGN KEY (`weaponID`) REFERENCES `weapons` (`weaponID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
