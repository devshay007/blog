-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 12, 2020 at 01:00 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Test1', 'e 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centu', 1, '2020-08-10 05:05:57', '2020-08-12 05:05:57'),
(2, 'Test2', 'e 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centu', 1, '2020-08-12 05:10:01', '2020-08-12 05:10:01'),
(3, 'Test3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaini', 1, '2020-08-12 05:10:11', '2020-08-12 05:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE IF NOT EXISTS `blog_category` (
  `blog_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  KEY `blog_category_blog_id_foreign` (`blog_id`),
  KEY `blog_category_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`blog_id`, `category_id`) VALUES
(1, 21),
(1, 22),
(1, 23),
(2, 23),
(3, 22);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(21, 'Cat 1', '2020-08-12 08:52:54', NULL),
(22, 'Cat 2', '2020-08-12 08:52:54', NULL),
(23, 'Cat 3', '2020-08-12 08:52:54', NULL),
(24, 'Cat 4', '2020-08-12 08:52:54', NULL),
(25, 'Cat 5', '2020-08-12 08:52:54', NULL),
(26, 'Cat 6', '2020-08-12 08:52:54', NULL),
(27, 'Cat 7', '2020-08-12 08:52:54', NULL),
(28, 'Cat 8', '2020-08-12 08:52:54', NULL),
(29, 'Cat 9', '2020-08-12 08:52:54', NULL),
(30, 'Cat 10', '2020-08-12 08:52:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_08_12_082639_categories', 2),
(4, '2020_08_12_092652_create_blogs_table', 3),
(5, '2020_08_12_093304_create_blog_category_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Shailesh Patel', 'shailesh@gmail.com', NULL, '$2y$10$QyjXgU2yJXUTudWUuFidLurpmXEmnjuNr/PqPpou8wR.3wuxfKLAS', NULL, '2020-08-12 02:47:44', '2020-08-12 02:47:44'),
(2, 'Jay Patel', 'jay@gmail.com', NULL, '$2y$10$Q4H/kzFVeuIEbn.LtaAOd.zvJdpk/7R9hOVuixipeEwGBC/m5gT1K', NULL, '2020-08-12 07:04:52', '2020-08-12 07:04:52');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD CONSTRAINT `blog_category_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
