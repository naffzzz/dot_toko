-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2022 pada 08.40
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dot_toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `gender` enum('0','1') NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_users`
--

INSERT INTO `admin_users` (`id`, `user_id`, `nik`, `name`, `address`, `gender`, `phone_number`, `createdAt`, `updatedAt`) VALUES
(1, 2, 0, 'nafazulfa', 'Kosong', '0', '0', '2022-06-23 02:51:39', '2022-06-23 02:51:39'),
(2, 6, 0, 'pegawaikuyangbaru', 'Kosong', '0', '0', '2022-06-23 04:34:27', '2022-06-23 04:34:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(12) NOT NULL,
  `name` varchar(30) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Meubel', '2022-06-23 03:01:38', '2022-06-23 03:01:38'),
(4, 'Sepatu', '2022-06-23 04:31:16', '2022-06-23 04:31:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(12) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(12) NOT NULL,
  `stock` int(12) NOT NULL,
  `price` int(12) NOT NULL,
  `discount` int(12) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `stock`, `price`, `discount`, `createdAt`, `updatedAt`) VALUES
(2, 'Topi', 'Meja kayu randu', 1, 1, 1200000, 100, '2022-06-23 03:08:08', '2022-06-23 04:37:50'),
(5, 'Meja', 'Meja kayu mahoni', 1, 1, 1200000, 100, '2022-06-23 04:33:28', '2022-06-23 04:33:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(12) NOT NULL,
  `product_id` int(12) NOT NULL,
  `quantity` int(12) NOT NULL,
  `price` int(12) NOT NULL,
  `discount` int(12) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `quantity`, `price`, `discount`, `createdAt`, `updatedAt`) VALUES
(1, 2, 2, 1200, 1000, '2022-06-23 03:39:01', '2022-06-23 04:38:29'),
(3, 2, 2, 20000, 1000, '2022-06-23 04:12:54', '2022-06-23 04:12:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(2, 'nafazulfa', '$2b$10$prLPHtkM0iZtxzDdPpDUl.yk71OmAOhFhFHPAip1JGtzaw9A87KLG', 1, '2022-06-23 02:51:39', '2022-06-23 02:51:39'),
(3, 'pengguna', '$2b$10$frt3TTg/cgraE4DTIZDYvOqIfb6vvDvEDTyO2F0zsLJss2vNeySi.', 2, '2022-06-23 02:53:22', '2022-06-23 02:53:22'),
(4, 'pegawaiku', '$2b$10$JejMrd0lBastgT/1FOzc7.x634fdTfZ7wLwCu64cKeU4ymR9WK/MW', 2, '2022-06-23 03:50:48', '2022-06-23 04:15:59'),
(5, 'pegawaikuhar', '$2b$10$nYBoMvq0JFSPRHqNKHetgeWwHyAS4ELgi.PYuLJ/86JqaugsmIFBK', 2, '2022-06-23 04:34:13', '2022-06-23 04:34:13'),
(6, 'pegawaikuyan', '$2b$10$SY.eaEuBomWsjer/m2fKb.0qlpq8Vp/Gdj/VIWy/R23reAyENlXae', 1, '2022-06-23 04:34:27', '2022-06-23 04:34:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `waiter_users`
--

CREATE TABLE `waiter_users` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `gender` enum('0','1') NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `description` text NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `waiter_users`
--

INSERT INTO `waiter_users` (`id`, `user_id`, `nik`, `name`, `address`, `gender`, `phone_number`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 3, 0, 'pengguna', 'Kosong', '0', '0', 'Pegawai Baru', '2022-06-23 02:53:22', '2022-06-23 02:53:22'),
(2, 4, 0, 'pegawai2', 'Kosong', '0', '0', 'Pegawai Baru', '2022-06-23 03:50:48', '2022-06-23 03:50:48'),
(3, 5, 0, 'pegawaikuharusada', 'Kosong', '0', '0', 'Pegawai Baru', '2022-06-23 04:34:13', '2022-06-23 04:34:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wholesales`
--

CREATE TABLE `wholesales` (
  `id` int(12) NOT NULL,
  `product_id` int(12) NOT NULL,
  `quantity` int(12) NOT NULL,
  `price` int(12) NOT NULL,
  `discount` int(12) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `waiter_users`
--
ALTER TABLE `waiter_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `wholesales`
--
ALTER TABLE `wholesales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `waiter_users`
--
ALTER TABLE `waiter_users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `wholesales`
--
ALTER TABLE `wholesales`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `waiter_users`
--
ALTER TABLE `waiter_users`
  ADD CONSTRAINT `waiter_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `wholesales`
--
ALTER TABLE `wholesales`
  ADD CONSTRAINT `wholesales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
