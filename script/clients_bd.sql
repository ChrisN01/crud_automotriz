-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2021 at 10:24 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clients_bd`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `concessionaire_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `dni`, `address`, `phone`, `status`, `concessionaire_id`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 'Crisleivys Gil', 'V24378626', 'wertyuio[ppoiuy', 'ghjyukilop[po', 'activo', 7, 7, '2021-03-15 05:32:30', '2021-03-15 09:01:33'),
(2, 'Cliente nuevo', 'V123456897', 'Venezuela', '1234567899ui', 'activo', 1, 3, '2021-03-15 09:03:37', '2021-03-15 09:03:37'),
(3, 'Cliente nuevo 2', 'V137890987654', '34567890oiuytrf', 'rttyuioilikujyhtgr', 'activo', 8, 1, '2021-03-15 09:05:21', '2021-03-15 12:07:49'),
(4, 'Cliente nuevo 3', 'werteasdsfgth', 'ewrerjytuiyou,iymtunyrt', 'drgthyjkulkjhy', 'inactivo', 8, 1, '2021-03-15 09:06:10', '2021-03-15 12:07:59'),
(5, 'Cliente nuevo 4', '23456789908978675645', 'wretrytuyuklkjghfg', 'sfdgfhjkl;', 'activo', 13, 1, '2021-03-15 09:07:05', '2021-03-15 09:45:05'),
(6, 'Prueba registro de clienets', 'V1230983684', 'Venezuela', '+58123456789', 'activo', 12, 11, '2021-03-15 11:56:42', '2021-03-15 11:56:42'),
(7, 'Cristian fuentes', 'V24378626', 'Colombia', '+57123456789', 'activo', 13, 1, '2021-03-15 11:57:43', '2021-03-15 11:57:43'),
(8, 'Crisleivys Gil', 'V24378626', 'blenrc5lknb6y5rt', 'uunhbytrv', 'inactivo', 8, 1, '2021-03-15 11:58:49', '2021-03-15 12:07:03'),
(9, 'Cristal Barrios', 'V018737848', '4e56789', 'e5r676890', 'activo', 7, 2, '2021-03-15 12:04:24', '2021-03-15 12:04:24'),
(10, 'Nuevo Cliente', 'V20384345678', 'fghmvhbn', 'dgbfgngvb', 'activo', 1, 3, '2021-03-15 12:05:30', '2021-03-15 12:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `client_concessionaire`
--

CREATE TABLE `client_concessionaire` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `concessionaire_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `concessionaires`
--

CREATE TABLE `concessionaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `concessionaires`
--

INSERT INTO `concessionaires` (`id`, `name`, `address`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 'Concesionario 1', '170 Leannon Place\n            Port Theresiabury, MI 87589', 3, NULL, NULL),
(2, 'Concesionario 2', '5779 Botsford Port\n            Moenmouth, PA 50570-8007', 3, NULL, NULL),
(3, 'Concesionario 3', '9098 Murazik Ridges\n            Blickburgh, OR 85446', 1, NULL, '2021-03-15 11:19:20'),
(4, 'Concesionario 4', '50373 Schiller Village\n            North Katherinestad, WI 785', 5, NULL, NULL),
(5, 'Concesionario 5', '482 Berenice Stream\n            North Rosemary, MI 39888', 1, NULL, NULL),
(6, 'Concesionario 6', '25237 Sawayn Keys\n            Lubowitzmouth, IA 25689-7136', 1, NULL, NULL),
(7, 'Concesionario 7', '775 Goldner Port Suite 096\n            Ondrickahaven, AR 08954', 2, NULL, '2021-03-15 11:20:05'),
(8, 'Concesionario 8', '18320 Koepp Curve\n            Port Patienceborough, NC 38974', 1, NULL, '2021-03-15 11:20:15'),
(9, 'Concesionario 9', '65525 Kuvalis Fort Suite 642\n            New Sylviaside, AZ 20', 1, NULL, NULL),
(10, 'Concesionario 10', '466 Fae Ports Apt. 199\n            Port Unique, MA 24253', 1, NULL, '2021-03-15 11:20:22'),
(11, 'Concesionario 11', '3805 Flo Crescent Suite 780\n            East Scot, ID 03742', 9, NULL, NULL),
(12, 'Concesionario 12', '104 Lenora Garden Suite 505\n            South Jessyca, ME 7956', 11, NULL, NULL),
(13, 'Concesionario 13', '9226 Letha Centers Apt. 754\n            Port Joan, OR 47307', 1, NULL, NULL),
(14, 'Concesionario 14', '329 Nitzsche Glen\n            Joaniemouth, SD 62385', 1, NULL, NULL),
(15, 'Concesionario 15', '3468 Collier Unions\n            North Marta, MO 32794-8572', 12, NULL, NULL),
(16, 'Concesionario de prueba', 'esretrytuyi,u,kj', 2, '2021-03-15 11:43:57', '2021-03-15 11:43:57'),
(17, 'Concesionario de prueba', '12345re', 1, '2021-03-15 11:46:32', '2021-03-15 11:46:32'),
(18, 'sdfghjm', 'aesrtdyuiky', 1, '2021-03-15 11:49:14', '2021-03-15 11:49:14'),
(19, 'Nuevo concesionario', 'hjn4tvr3clwe', 6, '2021-03-15 11:51:26', '2021-03-15 11:51:26'),
(20, 'Nuevo concesionario prueba', 'rfntbnym jy', 1, '2021-03-15 11:52:03', '2021-03-15 11:52:03'),
(21, 'Prueba creacion de concesionario', 'yjthrvclikujy', 6, '2021-03-15 11:52:37', '2021-03-15 11:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Lima', NULL, NULL),
(2, 'Arequipa', NULL, NULL),
(3, 'Callao', NULL, NULL),
(4, 'Chiclayo', NULL, NULL),
(5, 'Trujillo', NULL, NULL),
(6, 'Piura', NULL, NULL),
(7, 'Huancayo', NULL, NULL),
(8, 'Cuzco', NULL, NULL),
(9, 'Chimbote', NULL, NULL),
(10, 'Iquitos', NULL, NULL),
(11, 'Pucallpa', NULL, NULL),
(12, 'Tacna', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2021_03_12_214324_create_locations_table', 1),
(26, '2021_03_12_214431_create_concessionaires_table', 1),
(27, '2021_03_12_214445_create_clients_table', 1),
(28, '2021_03_13_000700_create_client_concessionaire_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ADMINISTRADOR', 'admin@mail.com', '2021-03-15 05:31:11', '$2y$10$Hwl5NKJtYcGW621FpVXGKersiyMEOSQTpOGRM2qe0U1AkH/3LfoQq', '40U288eQaTRatgw4amGONowVYfEHBhc6slGVyv6h9qlxyEqdg3x7LFnegVNM', '2021-03-15 05:31:11', '2021-03-15 05:31:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_concessionaire_id_foreign` (`concessionaire_id`),
  ADD KEY `clients_location_id_foreign` (`location_id`);

--
-- Indexes for table `client_concessionaire`
--
ALTER TABLE `client_concessionaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_concessionaire_client_id_foreign` (`client_id`),
  ADD KEY `client_concessionaire_concessionaire_id_foreign` (`concessionaire_id`);

--
-- Indexes for table `concessionaires`
--
ALTER TABLE `concessionaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `concessionaires_location_id_foreign` (`location_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client_concessionaire`
--
ALTER TABLE `client_concessionaire`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `concessionaires`
--
ALTER TABLE `concessionaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_concessionaire_id_foreign` FOREIGN KEY (`concessionaire_id`) REFERENCES `concessionaires` (`id`),
  ADD CONSTRAINT `clients_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `client_concessionaire`
--
ALTER TABLE `client_concessionaire`
  ADD CONSTRAINT `client_concessionaire_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `client_concessionaire_concessionaire_id_foreign` FOREIGN KEY (`concessionaire_id`) REFERENCES `concessionaires` (`id`);

--
-- Constraints for table `concessionaires`
--
ALTER TABLE `concessionaires`
  ADD CONSTRAINT `concessionaires_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
