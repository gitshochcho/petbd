-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2025 at 11:52 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet-bd`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_users`
--

CREATE TABLE `api_users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int UNSIGNED NOT NULL,
  `pet_id` int UNSIGNED NOT NULL,
  `professional_id` int UNSIGNED NOT NULL,
  `professional_type` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `scheduled_datetime` datetime NOT NULL,
  `duration_minutes` int NOT NULL,
  `location_type` enum('in_house','at_organization') COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('scheduled','confirmed','in_progress','completed','cancelled','no_show') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'scheduled',
  `base_cost` decimal(10,2) NOT NULL,
  `additional_fees` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(10,2) NOT NULL,
  `customer_notes` text COLLATE utf8mb3_unicode_ci,
  `professional_notes` text COLLATE utf8mb3_unicode_ci,
  `cancellation_reason` text COLLATE utf8mb3_unicode_ci,
  `booked_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `pet_id`, `professional_id`, `professional_type`, `service_id`, `scheduled_datetime`, `duration_minutes`, `location_type`, `status`, `base_cost`, `additional_fees`, `total_cost`, `customer_notes`, `professional_notes`, `cancellation_reason`, `booked_at`, `confirmed_at`, `started_at`, `completed_at`, `cancelled_at`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 1, 'App\\Models\\GroomerProfile', 1, '2025-09-01 10:00:00', 120, 'at_organization', 'scheduled', 50.00, 0.00, 50.00, 'Pet is very friendly but nervous around loud noises', NULL, NULL, '2025-07-10 05:11:19', NULL, NULL, NULL, NULL, 1, 1, '2025-07-10 05:11:19', '2025-07-10 05:11:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authentication_log`
--

CREATE TABLE `authentication_log` (
  `id` bigint UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `authenticatable_id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb3_unicode_ci,
  `login_at` timestamp NULL DEFAULT NULL,
  `login_successful` tinyint(1) NOT NULL DEFAULT '0',
  `logout_at` timestamp NULL DEFAULT NULL,
  `cleared_by_user` tinyint(1) NOT NULL DEFAULT '0',
  `location` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `authentication_log`
--

INSERT INTO `authentication_log` (`id`, `authenticatable_type`, `authenticatable_id`, `ip_address`, `user_agent`, `login_at`, `login_successful`, `logout_at`, `cleared_by_user`, `location`) VALUES
(1, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-08 04:25:55', 1, NULL, 0, NULL),
(2, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-08 04:27:46', 1, NULL, 0, NULL),
(3, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-10 00:43:23', 1, NULL, 0, NULL),
(4, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-10 03:17:10', 1, NULL, 0, NULL),
(5, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-10 03:45:55', 1, NULL, 0, NULL),
(6, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-12 23:26:12', 1, NULL, 0, NULL),
(7, 'App\\Models\\User', 1, '127.0.0.1', 'PostmanRuntime/7.44.1', '2025-07-27 05:13:03', 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_clients`
--

CREATE TABLE `auth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `auth_clients`
--

INSERT INTO `auth_clients` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Admin', 'admin@orangebd.com', '2025-07-08 01:25:22', '$2y$12$T/mJj3AdHgX.tY8hoficteiTDUl6MUm0dTAiQBDHvzgquYyNhLgx.', 'WBQIFOFAqe', '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_entities`
--

CREATE TABLE `dashboard_entities` (
  `id` int UNSIGNED NOT NULL,
  `pid` int UNSIGNED DEFAULT NULL,
  `node_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `serials` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_permissions`
--

CREATE TABLE `dashboard_permissions` (
  `id` int UNSIGNED NOT NULL,
  `role_id` tinyint DEFAULT NULL,
  `view` tinyint NOT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_profiles`
--

CREATE TABLE `doctor_profiles` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `organization_id` int UNSIGNED NOT NULL,
  `specializations` json DEFAULT NULL COMMENT 'JSON array of specializations',
  `experience_years` int NOT NULL DEFAULT '0',
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `bio` text COLLATE utf8mb3_unicode_ci,
  `medical_license_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `joined_at` timestamp NULL DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctor_profiles`
--

INSERT INTO `doctor_profiles` (`id`, `user_id`, `organization_id`, `specializations`, `experience_years`, `hourly_rate`, `bio`, `medical_license_number`, `status`, `joined_at`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '[\"Cardiology\", \"Internal Medicine\", \"Preventive Care\"]', 10, 150.00, 'Board-certified cardiologist with a decade of experience in diagnosing and treating heart conditions. Dedicated to preventive care and patient education.', NULL, 1, NULL, 1, 1, '2025-07-12 23:30:45', '2025-07-12 23:30:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groomer_profiles`
--

CREATE TABLE `groomer_profiles` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `organization_id` int UNSIGNED NOT NULL,
  `specializations` json DEFAULT NULL COMMENT 'JSON array of specializations',
  `experience_years` int NOT NULL DEFAULT '0',
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `bio` text COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `joined_at` timestamp NULL DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `groomer_profiles`
--

INSERT INTO `groomer_profiles` (`id`, `user_id`, `organization_id`, `specializations`, `experience_years`, `hourly_rate`, `bio`, `status`, `joined_at`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '[\"Dog Grooming\", \"Cat Grooming\", \"Nail Trimming\"]', 5, 25.00, 'Experienced groomer specializing in small and medium dogs', 1, NULL, 1, 1, '2025-07-10 04:39:32', '2025-07-10 04:39:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"63efc112-3f45-437a-a07b-9d20d483c96f\",\"displayName\":\"Rappasoft\\\\LaravelAuthenticationLog\\\\Notifications\\\\NewDevice\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:58:\\\"Rappasoft\\\\LaravelAuthenticationLog\\\\Notifications\\\\NewDevice\\\":2:{s:17:\\\"authenticationLog\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:59:\\\"Rappasoft\\\\LaravelAuthenticationLog\\\\Models\\\\AuthenticationLog\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"57157a0e-76ef-44e9-b91c-02e8fa5498c3\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1751970355, 1751970355);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb3_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_15_093238_create_personal_access_tokens_table', 1),
(5, '2024_12_15_094402_create_api_users_table', 1),
(6, '2024_12_15_094442_create_roles_table', 1),
(7, '2024_12_15_094447_create_tree_entities_table', 1),
(8, '2024_12_15_094448_create_role_permissions_table', 1),
(9, '2024_12_15_094449_create_dashboard_entities_table', 1),
(10, '2024_12_15_094449_create_dashboard_permissions_table', 1),
(11, '2024_12_15_094452_create_user_infos_table', 1),
(12, '2024_12_15_094500_create_pages_table', 1),
(13, '2024_12_15_094501_create_page_layout_infos_table', 1),
(14, '2024_12_23_073715_create_auth_clients_table', 1),
(15, '2024_12_29_052733_create_authentication_log_table', 1),
(16, '2024_12_29_073326_add_user_type_to_users_table', 1),
(17, '2024_12_30_095116_add_some_to_users_table', 1),
(18, '2025_01_21_024140_add_some_field_to_user_infos_table', 1),
(19, '2025_02_23_044941_add_some_fields_to_users_table', 1),
(37, '2025_07_08_081928_create_organizations_table', 2),
(38, '2025_07_08_082015_create_groomer_profiles_table', 2),
(39, '2025_07_08_082127_create_pet_categories_table', 2),
(40, '2025_07_08_082159_create_pet_subcategories_table', 2),
(41, '2025_07_08_082233_create_pet_breeds_table', 2),
(42, '2025_07_08_082255_create_pets_table', 2),
(43, '2025_07_08_082318_create_services_table', 2),
(44, '2025_07_08_082340_create_service_pricing_table', 2),
(45, '2025_07_08_082408_create_appointments_table', 2),
(46, '2025_07_08_082434_add_pet_system_fields_to_users_table', 3),
(47, '2025_07_10_070554_create_doctor_profiles_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'True for default org for independent groomers',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `address`, `phone`, `email`, `website`, `is_default`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Paws & Claws Grooming', '123 Main Street, City, State 12345', '+1234567890', 'info@pawsandclaws.com', 'https://pawsandclaws.com', 0, 1, 1, 1, '2025-07-10 04:39:20', '2025-07-10 04:39:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_layout_infos`
--

CREATE TABLE `page_layout_infos` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED DEFAULT NULL,
  `data` json DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(5, 'App\\Models\\User', 1, 'access_token', '2ee8506803431cca277b0534dde4d9da3b48c90ec64bd686e389a9c04984c49a', '[\"access-api\"]', '2025-07-10 05:11:19', '2025-07-11 03:17:10', '2025-07-10 03:17:10', '2025-07-10 05:11:19'),
(6, 'App\\Models\\User', 1, 'refresh_token', 'a547b207bb01794b56d3bd8f8fda998f781d85f841039307620fb1028deee123', '[\"issue-access-token\"]', NULL, '2025-07-17 03:17:10', '2025-07-10 03:17:10', '2025-07-10 03:17:10'),
(7, 'App\\Models\\User', 1, 'access_token', '0929dfacf9fc2283fdb0101675cc5e97b0194fad86de31519f78657b1c0a3d13', '[\"access-api\"]', NULL, '2025-07-11 03:45:55', '2025-07-10 03:45:55', '2025-07-10 03:45:55'),
(8, 'App\\Models\\User', 1, 'refresh_token', 'a7f3cd9a54eab8a99c74d7446fc10d4a3bcc19b22f36474ac798578912c288fc', '[\"issue-access-token\"]', NULL, '2025-07-17 03:45:55', '2025-07-10 03:45:55', '2025-07-10 03:45:55'),
(9, 'App\\Models\\User', 1, 'access_token', 'c8bd653185704b70a4aa7ca202ce67a27f545c18acb37f753c6d4bb8c9172165', '[\"access-api\"]', '2025-07-12 23:38:31', '2025-07-13 23:26:12', '2025-07-12 23:26:12', '2025-07-12 23:38:31'),
(10, 'App\\Models\\User', 1, 'refresh_token', '78864f7a2c7d47e4e6997dcacd57a48284d9a903869eb13d262d2c97b40f20a0', '[\"issue-access-token\"]', NULL, '2025-07-19 23:26:12', '2025-07-12 23:26:12', '2025-07-12 23:26:12'),
(11, 'App\\Models\\User', 1, 'access_token', '392c39cb2eb6980356c530b4f92a96effd1e5f5da8314e85a820a61459463adb', '[\"access-api\"]', '2025-07-27 05:35:04', '2025-07-28 05:13:03', '2025-07-27 05:13:03', '2025-07-27 05:35:04'),
(12, 'App\\Models\\User', 1, 'refresh_token', '417a4f07f5f958b15c29d5ee61d4aa599399f020771927b10d5e5f5d5c7ec41f', '[\"issue-access-token\"]', NULL, '2025-08-03 05:13:03', '2025-07-27 05:13:03', '2025-07-27 05:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int UNSIGNED NOT NULL,
  `owner_id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `subcategory_id` int UNSIGNED NOT NULL,
  `breed_id` int UNSIGNED NOT NULL,
  `birthday` date DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'Weight in kg',
  `sex` enum('male','female','unknown') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `current_medications` json DEFAULT NULL COMMENT 'JSON array of current medications',
  `medication_allergies` json DEFAULT NULL COMMENT 'JSON array of medication allergies',
  `health_conditions` json DEFAULT NULL COMMENT 'JSON array of health conditions',
  `special_notes` text COLLATE utf8mb3_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `owner_id`, `name`, `category_id`, `subcategory_id`, `breed_id`, `birthday`, `weight`, `sex`, `current_medications`, `medication_allergies`, `health_conditions`, `special_notes`, `photo`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Buddy', 1, 1, 1, '2020-01-15', 2.50, 'male', '[\"Heartworm prevention\"]', '[\"Penicillin\"]', '[\"Healthy\"]', 'Very friendly with children', NULL, 1, 1, 1, '2025-07-10 04:39:06', '2025-07-10 04:39:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pet_breeds`
--

CREATE TABLE `pet_breeds` (
  `id` int UNSIGNED NOT NULL,
  `subcategory_id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `typical_weight_min` decimal(5,2) DEFAULT NULL COMMENT 'Minimum typical weight in kg',
  `typical_weight_max` decimal(5,2) DEFAULT NULL COMMENT 'Maximum typical weight in kg',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pet_breeds`
--

INSERT INTO `pet_breeds` (`id`, `subcategory_id`, `name`, `description`, `typical_weight_min`, `typical_weight_max`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Chihuahua', 'Very small toy breed', 1.50, 3.00, 1, 1, 1, '2025-07-10 04:38:48', '2025-07-10 04:38:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pet_categories`
--

CREATE TABLE `pet_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pet_categories`
--

INSERT INTO `pet_categories` (`id`, `name`, `description`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cat', 'Domestic cats of all sizes', 1, 1, 1, '2025-07-10 04:38:13', '2025-07-10 04:38:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pet_subcategories`
--

CREATE TABLE `pet_subcategories` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pet_subcategories`
--

INSERT INTO `pet_subcategories` (`id`, `category_id`, `name`, `description`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Small Dog', 'Dogs under 25 lbs', 1, 1, 1, '2025-07-10 04:38:27', '2025-07-10 04:38:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int UNSIGNED NOT NULL,
  `role_id` tinyint DEFAULT NULL,
  `view` tinyint NOT NULL,
  `add` tinyint NOT NULL DEFAULT '0',
  `edit` tinyint NOT NULL DEFAULT '0',
  `edit_other` tinyint NOT NULL DEFAULT '0',
  `delete` tinyint NOT NULL DEFAULT '0',
  `delete_other` tinyint NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `organization_id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `base_price` decimal(10,2) NOT NULL,
  `estimated_duration` int NOT NULL COMMENT 'Duration in minutes',
  `category` enum('grooming','bathing','nail_care','dental','specialty','other') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'grooming',
  `requires_pet_categories` json DEFAULT NULL COMMENT 'JSON array of applicable pet category IDs',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `organization_id`, `name`, `description`, `base_price`, `estimated_duration`, `category`, `requires_pet_categories`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Full Grooming Service', 'Complete grooming including bath, cut, nail trim, and styling', 50.00, 120, 'grooming', '[1]', 1, 1, 1, '2025-07-10 04:39:51', '2025-07-10 04:39:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_pricing`
--

CREATE TABLE `service_pricing` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `location_type` enum('in_house','at_organization') COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `additional_fees` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Travel fees, etc.',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `service_pricing`
--

INSERT INTO `service_pricing` (`id`, `service_id`, `location_type`, `price`, `additional_fees`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'at_organization', 50.00, 0.00, 1, 1, 1, '2025-07-10 04:40:01', '2025-07-10 04:40:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb3_unicode_ci,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tree_entities`
--

CREATE TABLE `tree_entities` (
  `id` int UNSIGNED NOT NULL,
  `pid` int UNSIGNED DEFAULT NULL,
  `node_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `route_location` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `serials` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tree_entities`
--

INSERT INTO `tree_entities` (`id`, `pid`, `node_name`, `route_name`, `route_location`, `icon`, `status`, `serials`, `created_by`, `modified_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'About', 'about', '/about', 'fas fa-info-circle', 1, 1, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(2, 0, 'Services', 'services', '/services', 'fas fa-concierge-bell', 1, 2, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(3, 0, 'Get Involve', 'career', '/career', 'fas fa-handshake', 1, 3, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(4, 0, 'At a Glance', 'at-a-glance', '/at-a-glace', 'fas fa-eye', 1, 4, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(5, 0, 'Resources', 'resources', '/resources', 'fas fa-archive', 1, 5, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(6, 0, 'Blogs', 'blogs', '/blogs', 'fas fa-blog', 1, 6, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(7, 0, 'FAQ', 'faq', '/faq', 'fas fa-question-circle', 1, 7, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(8, 1, 'The Context', 'about-context', '/about/context', NULL, 1, 1, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(9, 1, 'About CCS', 'about-ccs', '/about/about', NULL, 1, 2, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(10, 1, 'Mission', 'mission', '/about/mission', NULL, 1, 3, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(11, 1, 'Advisor Body', 'advisor-body', '/about/advisor-body', NULL, 1, 4, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(12, 1, 'Executive Body', 'executive-body', '/about/executive-body', NULL, 1, 5, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(13, 1, 'Member Of CCS', 'ccs-member', '/about/ccs-member', NULL, 1, 6, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(14, 1, 'Administration', 'administration', '/about/administration', NULL, 1, 7, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(15, 1, 'Branch', 'branches', '/about/branches', NULL, 1, 8, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(16, 1, 'Information', 'information', '/about/information', NULL, 1, 9, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(17, 2, 'Consumer Development', 'consumer-development', '/services/consumer-development', NULL, 1, 1, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(18, 2, 'Youth Engagement', 'youth-engage', '/services/youth-engage', NULL, 1, 2, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(19, 2, 'CCS Digital Lab', 'digital-lab', '/services/digital-lab', NULL, 1, 3, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(20, 2, 'CCS Housing Project', 'housing-project', '/services/housing-project', NULL, 1, 4, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(21, 2, 'CCS Blood Bank', 'blood-bank', '/services/blood-bank', NULL, 1, 5, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(22, 2, 'CCS Volunteers', 'volunteers', '/services/volunteers', NULL, 1, 6, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(23, 2, 'Journalists Awards', 'jounalist-awards', '/services/jounalist-awards', NULL, 1, 7, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(24, 3, 'Vacancy', 'vacancy', '/career/vacancy', NULL, 1, 1, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(25, 3, 'Internship', 'internship', '/career/internship', NULL, 1, 2, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(26, 3, 'Fellowship', 'fellowship', '/career/fellowship', NULL, 1, 3, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(27, 3, 'Membership', 'membership', '/career/membership', NULL, 1, 4, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(28, 3, 'Partnership', 'partnership', '/career/partnership', NULL, 1, 5, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(29, 3, 'Sposorship', 'sposorship', '/career/sposorship', NULL, 1, 6, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(30, 3, 'Advisorship', 'advisorship', '/career/advisorship', NULL, 1, 7, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL),
(31, 3, 'Donorship', 'donorship', '/career/donorship', NULL, 1, 8, 1, NULL, '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT (uuid()),
  `mobile` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ccode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Country Code',
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_verify` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `email_notification` tinyint NOT NULL DEFAULT '1',
  `accessibility_statement` enum('team_email','site_email') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'team_email',
  `compliance_statement` enum('team_email','site_email') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'team_email',
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` enum('1','2') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 = Admin, 2 = User',
  `pet_user_type` enum('pet_owner','groomer','both') COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `otp_for` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb3_unicode_ci,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `mobile`, `ccode`, `email`, `full_name`, `password`, `auth_code`, `is_verify`, `status`, `mobile_verified_at`, `email_verified_at`, `email_notification`, `accessibility_statement`, `compliance_statement`, `remember_token`, `created_at`, `updated_at`, `user_type`, `pet_user_type`, `otp_for`, `photo`, `address`) VALUES
(1, '5aed3cf5-d024-4ce7-b171-b0f68bab1cff', '01771882876', '+1', 'admin@orangebd.com', NULL, '$2y$12$o4hK1MuwnalDTD6MtgIRPut1oLvgT8FMy7kNv82qjpZuNkAuNDlsW', NULL, 1, 1, '2025-07-08 01:25:22', '2025-07-08 01:25:22', 1, 'team_email', 'team_email', 'tXsLtQbAMJ', '2025-07-08 01:25:22', '2025-07-08 01:25:22', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL COMMENT 'Date of birth',
  `religion_id` tinyint DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nationality_id` int DEFAULT NULL,
  `vulnerability_info` json DEFAULT NULL,
  `pre_country` int UNSIGNED DEFAULT NULL,
  `pre_srteet_address` text COLLATE utf8mb3_unicode_ci,
  `pre_city` text COLLATE utf8mb3_unicode_ci,
  `pre_provience` text COLLATE utf8mb3_unicode_ci,
  `pre_zip` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `same_as_present_address` tinyint(1) DEFAULT NULL,
  `per_country` int UNSIGNED DEFAULT NULL,
  `per_srteet_address` text COLLATE utf8mb3_unicode_ci,
  `per_city` text COLLATE utf8mb3_unicode_ci,
  `per_provience` text COLLATE utf8mb3_unicode_ci,
  `per_zip` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `photo`, `dob`, `religion_id`, `gender`, `occupation`, `nationality_id`, `vulnerability_info`, `pre_country`, `pre_srteet_address`, `pre_city`, `pre_provience`, `pre_zip`, `same_as_present_address`, `per_country`, `per_srteet_address`, `per_city`, `per_provience`, `per_zip`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `modified_by`) VALUES
(1, 1, 'Admin', NULL, 'User', NULL, '1995-07-08', NULL, 1, '', NULL, '{\"info\": \"No vulnerabilities\"}', 1, '123 Admin Street', 'Admin City', 'Admin Province', '12345', 1, 1, '123 Admin Street', 'Admin City', 'Admin Province', '12345', '2025-07-08 01:25:22', '2025-07-08 01:25:22', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_users`
--
ALTER TABLE `api_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_users_email_unique` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_service_id_foreign` (`service_id`),
  ADD KEY `appointments_created_by_foreign` (`created_by`),
  ADD KEY `appointments_modified_by_foreign` (`modified_by`),
  ADD KEY `idx_appt_pet_status` (`pet_id`,`status`),
  ADD KEY `idx_appt_prof_time` (`professional_id`,`professional_type`,`scheduled_datetime`),
  ADD KEY `idx_appt_datetime_status` (`scheduled_datetime`,`status`);

--
-- Indexes for table `authentication_log`
--
ALTER TABLE `authentication_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authentication_log_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `auth_clients`
--
ALTER TABLE `auth_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_clients_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `dashboard_entities`
--
ALTER TABLE `dashboard_entities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dashboard_entities_node_name_unique` (`node_name`),
  ADD KEY `dashboard_entities_created_by_foreign` (`created_by`),
  ADD KEY `dashboard_entities_modified_by_foreign` (`modified_by`),
  ADD KEY `dashboard_entities_pid_slug_node_name_index` (`pid`,`slug`,`node_name`);

--
-- Indexes for table `dashboard_permissions`
--
ALTER TABLE `dashboard_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_permissions_created_by_foreign` (`created_by`),
  ADD KEY `dashboard_permissions_modified_by_foreign` (`modified_by`),
  ADD KEY `dashboard_permissions_role_id_view_index` (`role_id`,`view`);

--
-- Indexes for table `doctor_profiles`
--
ALTER TABLE `doctor_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groomer_profiles`
--
ALTER TABLE `groomer_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groomer_profiles_user_id_organization_id_unique` (`user_id`,`organization_id`),
  ADD KEY `groomer_profiles_organization_id_foreign` (`organization_id`),
  ADD KEY `groomer_profiles_created_by_foreign` (`created_by`),
  ADD KEY `groomer_profiles_modified_by_foreign` (`modified_by`),
  ADD KEY `groomer_profiles_user_id_status_index` (`user_id`,`status`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organizations_created_by_foreign` (`created_by`),
  ADD KEY `organizations_modified_by_foreign` (`modified_by`),
  ADD KEY `organizations_name_status_index` (`name`,`status`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_unique` (`title`),
  ADD KEY `pages_create` (`created_by`),
  ADD KEY `pages_modify` (`modified_by`),
  ADD KEY `pages_index` (`title`,`status`);

--
-- Indexes for table `page_layout_infos`
--
ALTER TABLE `page_layout_infos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_layout_infos_page_id_unique` (`page_id`),
  ADD KEY `page_layout_infos_created_by_foreign` (`created_by`),
  ADD KEY `page_layout_infos_modified_by_foreign` (`modified_by`),
  ADD KEY `page_layout_infos_page_id_index` (`page_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pets_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `pets_breed_id_foreign` (`breed_id`),
  ADD KEY `pets_created_by_foreign` (`created_by`),
  ADD KEY `pets_modified_by_foreign` (`modified_by`),
  ADD KEY `pets_owner_id_status_index` (`owner_id`,`status`),
  ADD KEY `pets_category_id_status_index` (`category_id`,`status`);

--
-- Indexes for table `pet_breeds`
--
ALTER TABLE `pet_breeds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pet_breeds_subcategory_id_name_unique` (`subcategory_id`,`name`),
  ADD KEY `pet_breeds_created_by_foreign` (`created_by`),
  ADD KEY `pet_breeds_modified_by_foreign` (`modified_by`),
  ADD KEY `pet_breeds_subcategory_id_status_index` (`subcategory_id`,`status`);

--
-- Indexes for table `pet_categories`
--
ALTER TABLE `pet_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pet_categories_name_unique` (`name`),
  ADD KEY `pet_categories_created_by_foreign` (`created_by`),
  ADD KEY `pet_categories_modified_by_foreign` (`modified_by`),
  ADD KEY `pet_categories_name_status_index` (`name`,`status`);

--
-- Indexes for table `pet_subcategories`
--
ALTER TABLE `pet_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pet_subcategories_category_id_name_unique` (`category_id`,`name`),
  ADD KEY `pet_subcategories_created_by_foreign` (`created_by`),
  ADD KEY `pet_subcategories_modified_by_foreign` (`modified_by`),
  ADD KEY `pet_subcategories_category_id_status_index` (`category_id`,`status`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`),
  ADD KEY `roles_created_by_foreign` (`created_by`),
  ADD KEY `roles_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_per_create` (`created_by`),
  ADD KEY `role_per_modify` (`modified_by`),
  ADD KEY `role_index` (`role_id`,`view`,`add`,`edit`,`edit_other`,`delete`,`delete_other`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_created_by_foreign` (`created_by`),
  ADD KEY `services_modified_by_foreign` (`modified_by`),
  ADD KEY `services_organization_id_status_index` (`organization_id`,`status`),
  ADD KEY `services_category_status_index` (`category`,`status`);

--
-- Indexes for table `service_pricing`
--
ALTER TABLE `service_pricing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_pricing_service_id_location_type_unique` (`service_id`,`location_type`),
  ADD KEY `service_pricing_created_by_foreign` (`created_by`),
  ADD KEY `service_pricing_modified_by_foreign` (`modified_by`),
  ADD KEY `service_pricing_service_id_status_index` (`service_id`,`status`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tree_entities`
--
ALTER TABLE `tree_entities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tree_unique` (`node_name`),
  ADD KEY `tree_create` (`created_by`),
  ADD KEY `tree_modify` (`modified_by`),
  ADD KEY `tree_en_index` (`pid`,`route_name`,`route_location`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_infos_user_id_foreign` (`user_id`),
  ADD KEY `user_infos_created_by_foreign` (`created_by`),
  ADD KEY `user_infos_modified_by_foreign` (`modified_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_users`
--
ALTER TABLE `api_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authentication_log`
--
ALTER TABLE `authentication_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_clients`
--
ALTER TABLE `auth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dashboard_entities`
--
ALTER TABLE `dashboard_entities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_permissions`
--
ALTER TABLE `dashboard_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_profiles`
--
ALTER TABLE `doctor_profiles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groomer_profiles`
--
ALTER TABLE `groomer_profiles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_layout_infos`
--
ALTER TABLE `page_layout_infos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pet_breeds`
--
ALTER TABLE `pet_breeds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pet_categories`
--
ALTER TABLE `pet_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pet_subcategories`
--
ALTER TABLE `pet_subcategories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_pricing`
--
ALTER TABLE `service_pricing`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tree_entities`
--
ALTER TABLE `tree_entities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `dashboard_entities`
--
ALTER TABLE `dashboard_entities`
  ADD CONSTRAINT `dashboard_entities_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `dashboard_entities_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dashboard_permissions`
--
ALTER TABLE `dashboard_permissions`
  ADD CONSTRAINT `dashboard_permissions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `dashboard_permissions_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `groomer_profiles`
--
ALTER TABLE `groomer_profiles`
  ADD CONSTRAINT `groomer_profiles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `groomer_profiles_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `groomer_profiles_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `groomer_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `organizations_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_create` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pages_modify` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `page_layout_infos`
--
ALTER TABLE `page_layout_infos`
  ADD CONSTRAINT `page_layout_infos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `page_layout_infos_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `page_layout_infos_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `pet_breeds` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pet_categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pets_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pets_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pets_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `pet_subcategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `pet_breeds`
--
ALTER TABLE `pet_breeds`
  ADD CONSTRAINT `pet_breeds_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pet_breeds_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pet_breeds_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `pet_subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pet_categories`
--
ALTER TABLE `pet_categories`
  ADD CONSTRAINT `pet_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pet_categories_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pet_subcategories`
--
ALTER TABLE `pet_subcategories`
  ADD CONSTRAINT `pet_subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pet_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pet_subcategories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pet_subcategories_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_per_create` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `role_per_modify` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `services_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `services_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_pricing`
--
ALTER TABLE `service_pricing`
  ADD CONSTRAINT `service_pricing_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `service_pricing_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `service_pricing_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tree_entities`
--
ALTER TABLE `tree_entities`
  ADD CONSTRAINT `tree_create` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tree_modify` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD CONSTRAINT `user_infos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `user_infos_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `user_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
