-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2024 at 01:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `invName` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `items` text DEFAULT NULL COMMENT 'itemId, description, quantity',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `userId`, `invName`, `description`, `items`, `created_at`, `updated_at`) VALUES
(4, 2, 'family Inventory', 'beautifull inventory', '[{\"itemId\":2,\"quantity\":20},{\"itemId\":3,\"quantity\":50},{\"itemId\":4,\"quantity\":70}]', '2024-04-26 06:14:13', '2024-04-26 06:14:13'),
(12, 2, 'friends Inventoiry', 'wonderfull inventory block', '[{\"itemId\":\"1\",\"quantity\":\"35\"},{\"itemId\":\"4\",\"quantity\":\"45\"},{\"itemId\":\"7\",\"quantity\":\"75\"}]', '2024-04-27 03:16:35', '2024-04-27 03:17:08'),
(13, 2, 'neighbour inventory', 'pretty awsome large', '[{\"itemId\":\"3\",\"quantity\":\"56\"},{\"itemId\":\"5\",\"quantity\":\"578\"}]', '2024-04-27 03:23:03', '2024-04-27 03:23:34'),
(14, 3, 'sensive order', 'logistics got hampered', '[{\"itemId\":\"1\",\"quantity\":\"23\"},{\"itemId\":\"2\",\"quantity\":\"56\"},{\"itemId\":\"7\",\"quantity\":\"37\"}]', '2024-04-27 03:26:14', '2024-04-27 03:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'item1', 'wonderfull black', '1713965116.jpg', '2024-04-24 07:25:16', '2024-04-24 07:25:16'),
(2, 'item2', 'wonderfull green', '1713965211.jpg', '2024-04-24 07:26:51', '2024-04-24 07:26:51'),
(3, 'item3', 'wonderfull red', '1713965244.jpg', '2024-04-24 07:27:24', '2024-04-24 07:27:24'),
(4, 'item4', 'wonderfull blue', '1713965280.jpeg', '2024-04-24 07:28:00', '2024-04-24 07:28:00'),
(5, 'item5', 'wonderfull orange', '1713965324.jpg', '2024-04-24 07:28:44', '2024-04-24 07:28:44'),
(6, 'items-6', 'tasty', '1714176300.jpg', '2024-04-26 18:05:00', '2024-04-26 18:05:00'),
(7, 'items-7', 'spicy', '1714176361.jpg', '2024-04-26 18:06:01', '2024-04-26 18:06:01'),
(8, 'items-7', 'spicy', '1714176388.jpg', '2024-04-26 18:06:28', '2024-04-26 18:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_23_190023_create_inventories_table', 1),
(6, '2024_04_23_190451_create_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-app-token', '3947472b1c51c9736092e346ef0200ddfc2d62254754e779e3d7d28316d6097f', '[\"*\"]', NULL, NULL, '2024-04-24 03:59:49', '2024-04-24 03:59:49'),
(3, 'App\\Models\\User', 2, 'my-app-token', '05c0e883f3deb06dc6be65f41efc89ff7f7701bcdce0b70d6df35b8000e527c8', '[\"*\"]', NULL, NULL, '2024-04-26 03:13:50', '2024-04-26 03:13:50'),
(4, 'App\\Models\\User', 2, 'my-app-token', '4e7675cc206fda9479d223bf339c8810794454ab367822ac524885906820cacf', '[\"*\"]', NULL, NULL, '2024-04-26 05:22:54', '2024-04-26 05:22:54'),
(5, 'App\\Models\\User', 2, 'my-app-token', 'bbfc6e45078eead1e6e2a86befb1d66779f9da1be1fd28ff49a4b60cbbeba78b', '[\"*\"]', NULL, NULL, '2024-04-26 05:23:10', '2024-04-26 05:23:10'),
(6, 'App\\Models\\User', 2, 'my-app-token', 'b8d5768949718a5e993f15630b839ccf7dcd9fa13d27123318a65dcbe3468c4a', '[\"*\"]', NULL, NULL, '2024-04-26 05:23:38', '2024-04-26 05:23:38'),
(7, 'App\\Models\\User', 2, 'my-app-token', '0224ee1fc66c93f532e111a2abc92fd66a3800888f383db9fbc3e1660e07af8b', '[\"*\"]', NULL, NULL, '2024-04-26 05:25:34', '2024-04-26 05:25:34'),
(8, 'App\\Models\\User', 2, 'my-app-token', '62b8967ae1a2445d6d0b38fd0053e1fb600db7a88fffad5f3f05d1ecf132a775', '[\"*\"]', NULL, NULL, '2024-04-26 05:39:02', '2024-04-26 05:39:02'),
(9, 'App\\Models\\User', 2, 'my-app-token', 'c927536f66c8921a82abf047757d8f791598535f918f3a5ad68708a3dec7728b', '[\"*\"]', NULL, NULL, '2024-04-26 05:55:48', '2024-04-26 05:55:48'),
(10, 'App\\Models\\User', 2, 'my-app-token', '99cd1b2d8d732c5d3be9704da223e34d9a16ee4e3588e9ed67b38ed75b7d8bc7', '[\"*\"]', NULL, NULL, '2024-04-26 06:03:37', '2024-04-26 06:03:37'),
(12, 'App\\Models\\User', 2, 'my-app-token', '5db7680dcf4cb5c68992a27562e3dd53fa0561b9b0ca3e3718bb468273bef926', '[\"*\"]', '2024-04-26 17:46:31', NULL, '2024-04-26 06:33:41', '2024-04-26 17:46:31'),
(15, 'App\\Models\\User', 2, 'my-app-token', '425b3062138354b2cde6d9a0510f8d4421250fce2eb41c5277b0d1944ad74c94', '[\"*\"]', '2024-04-26 07:25:00', NULL, '2024-04-26 07:05:07', '2024-04-26 07:25:00'),
(18, 'App\\Models\\User', 2, 'my-app-token', 'd240d19b8eb824ac99372cb459c330b1c9303fa712bd08b286de5ed07d7cd020', '[\"*\"]', '2024-04-27 03:27:10', NULL, '2024-04-27 03:26:54', '2024-04-27 03:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@test.com', NULL, '$2y$10$.bJSBry8vpTQPnq.M.EIheKkFBcMNxXz6IkffGMVpE1LHuzWXqv3C', NULL, NULL, NULL),
(2, 'user1', 'user1@test.com', NULL, '$2y$10$XGsiphtb7DUj7crdEeoS1OO64i.vbAmM5k6bxlvUhrctBcZYJ6pK2', NULL, '2024-04-24 05:59:07', '2024-04-24 05:59:07'),
(3, 'user2', 'user2@test.com', NULL, '$2y$10$abPE8zZAVzCZgp4DOcwp4uo5SDbCqBzuRWl3EKBo1K0BO0CHwCPiG', NULL, '2024-04-26 05:38:05', '2024-04-26 05:38:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
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
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
