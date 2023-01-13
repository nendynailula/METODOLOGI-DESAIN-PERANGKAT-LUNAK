-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Des 2022 pada 12.09
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualanananda`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `kode_akun` varchar(4) NOT NULL,
  `nama_akun` varchar(25) DEFAULT NULL,
  `header_akun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`kode_akun`, `nama_akun`, `header_akun`) VALUES
('1234', 'Nendy', '2345'),
('2134', 'Nailul', '2145'),
('3234', 'Autor', '3145');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_Id` varchar(10) DEFAULT NULL,
  `customer_FName` varchar(255) DEFAULT NULL,
  `customer_LName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_Id`, `customer_FName`, `customer_LName`) VALUES
('10001', 'John', 'Smith'),
('10002', 'Dave', 'Franklin'),
('10003', 'Febby', 'Johns'),
('10004', 'Mary', 'Gibson'),
('10005', 'Glory', 'Anson');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jual`
--

CREATE TABLE `detail_jual` (
  `no_nota` varchar(4) NOT NULL,
  `kode_kue` varchar(4) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_jual`
--

INSERT INTO `detail_jual` (`no_nota`, `kode_kue`, `jumlah`, `harga_satuan`, `subtotal`) VALUES
('01', '0001', 50, 2000, 10000),
('02', '0002', 20, 2500, 50000),
('03', '0003', 30, 4000, 120000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kue`
--

CREATE TABLE `jenis_kue` (
  `kode_jenis_kue` varchar(4) NOT NULL,
  `nama_jenis_kue` varchar(100) DEFAULT NULL,
  `jangka_expired` varchar(25) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_kue`
--

INSERT INTO `jenis_kue` (`kode_jenis_kue`, `nama_jenis_kue`, `jangka_expired`, `rating`) VALUES
('1111', 'kue abon', '2 bulan', NULL),
('2222', 'kue pukis', '3 hari', NULL),
('3333', 'kue lapis legit', '2 bulan', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_penjualan`
--

CREATE TABLE `jurnal_penjualan` (
  `kode_akun` varchar(4) DEFAULT NULL,
  `no_penjualan` varchar(4) NOT NULL,
  `posisi_dr_cr` varchar(6) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnal_penjualan`
--

INSERT INTO `jurnal_penjualan` (`kode_akun`, `no_penjualan`, `posisi_dr_cr`, `nominal`) VALUES
('1234', 'pj11', 'debit', 1200000),
('2134', 'pj22', 'credit', 2100000),
('3234', 'pj33', 'debit', 2200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kue`
--

CREATE TABLE `kue` (
  `kode_kue` varchar(4) NOT NULL,
  `nama_kue` varchar(25) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `kode_jenis_kue` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kue`
--

INSERT INTO `kue` (`kode_kue`, `nama_kue`, `harga_satuan`, `kode_jenis_kue`) VALUES
('0001', 'kue abon', 2000, '1111'),
('0002', 'kue pukis', 2500, '2222'),
('0003', 'kue lapis legit', 4000, '3333');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `kode_outlet` varchar(3) NOT NULL,
  `nama_outlet` varchar(25) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`kode_outlet`, `nama_outlet`, `alamat`, `telp`, `Email`) VALUES
('001', 'Outlet Biru', 'Bragasan Gamping', '082344315213', NULL),
('002', 'Outlet Hijau', 'Sinduharjo', '082344122134', NULL),
('003', 'Outlet Merah', 'Trihanggo', '085344315213', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `no_nota` varchar(4) NOT NULL,
  `tgl_penjualan` date DEFAULT NULL,
  `total_jual` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  `kode_outlet` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`no_nota`, `tgl_penjualan`, `total_jual`, `discount`, `total_bayar`, `kode_outlet`) VALUES
('01', '2022-07-17', 200, 10, 2000000, '001'),
('02', '2022-07-17', 200, 10, 2000000, '002'),
('03', '2022-07-19', 500, 10, 1000000, '003');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kode_akun`),
  ADD KEY `fk_header_akun` (`header_akun`);

--
-- Indeks untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`no_nota`,`kode_kue`),
  ADD KEY `fk_detail_kue` (`kode_kue`);

--
-- Indeks untuk tabel `jenis_kue`
--
ALTER TABLE `jenis_kue`
  ADD PRIMARY KEY (`kode_jenis_kue`);

--
-- Indeks untuk tabel `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD PRIMARY KEY (`no_penjualan`),
  ADD KEY `fk_kode_akun` (`kode_akun`);

--
-- Indeks untuk tabel `kue`
--
ALTER TABLE `kue`
  ADD PRIMARY KEY (`kode_kue`),
  ADD KEY `fk_kue_jenis` (`kode_jenis_kue`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`kode_outlet`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`no_nota`),
  ADD KEY `fk_penjualan_outlet` (`kode_outlet`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `fk_detail_kue` FOREIGN KEY (`kode_kue`) REFERENCES `kue` (`kode_kue`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_penjualan` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD CONSTRAINT `fk_kode_akun` FOREIGN KEY (`kode_akun`) REFERENCES `akun` (`kode_akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kue`
--
ALTER TABLE `kue`
  ADD CONSTRAINT `fk_kue_jenis` FOREIGN KEY (`kode_jenis_kue`) REFERENCES `jenis_kue` (`kode_jenis_kue`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_penjualan_outlet` FOREIGN KEY (`kode_outlet`) REFERENCES `outlet` (`kode_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
