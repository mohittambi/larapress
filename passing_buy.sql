-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2018 at 01:30 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `passing_buy`
--

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parameter_type` enum('string','email','number','url','boolean','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `slug`, `description`, `parameter_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SITE_NAME', 'site-name', 'Passing Buy', 'string', 1, '2017-12-10 18:30:00', '2018-03-29 07:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `social_type` varchar(255) NOT NULL,
  `social_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_accounts`
--

INSERT INTO `social_accounts` (`id`, `user_id`, `social_type`, `social_id`, `created_at`, `updated_at`) VALUES
(2, 28, 'FACEBOOK', '435345345345', '2018-03-29 01:32:15', '2018-03-29 01:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Inactive, 1 = Active',
  `role` enum('A','U','D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'U' COMMENT 'A for super admin,U for User,D for developer',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `slug`, `username`, `email`, `password`, `image`, `status`, `role`, `remember_token`, `password_reset_token`, `created_at`, `updated_at`) VALUES
(1, 'developer', 'developer', 'developer', 'developer@passingbuy.com', '$2y$10$B83KxTTpksCtefM2Y5mOYeVLVabUwHvrbDUS2/j2S/LqN3GUEn9Hq', NULL, 1, 'D', NULL, NULL, '2018-03-08 04:38:48', '2018-03-22 01:27:04'),
(2, 'pushpendra', 'pushpendra', 'admin', 'admin@passing.com', '$2y$10$QuIgWNGdeIJGdPuKlFvObem6Cj3gZoKy6xlRuL0vD.3HKV.gy4BnW', '15224033591325401040.jpg', 1, 'A', NULL, NULL, '2018-03-08 04:38:48', '2018-03-30 04:19:19'),
(28, 'pushpendra bhadouriya', 'pushpendra-bhadouriya', 'bluddyjoker@mailinator.com', 'bluddyjoker@mailinator.com', '$2y$10$fJWU4cX3snjOlTTijDj49eNV2wbpi5dBErtHJuF5hEzgyQ75V9MwK', NULL, 1, 'U', NULL, NULL, '2018-03-29 01:32:15', '2018-03-29 02:02:15'),
(29, 'prem_1', 'prem-1', 'prem_1', 'prem_1@gmail.com', '$2y$10$B9PN0Nfr3M5fM.zusEMVjOowkOdzIvpZwFZdo/u13Ss7a73CGaBxC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:15', '2018-03-30 06:33:30'),
(30, 'prem_2', 'prem-2', 'prem_2', 'prem_2@gmail.com', '$2y$10$2VeauLqvo28AVqghC169C.Qtg/fNr3whWM6aY1dp1de5XfdCEJO9.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:15', '2018-03-30 00:47:15'),
(31, 'prem_3', 'prem-3', 'prem_3', 'prem_3@gmail.com', '$2y$10$aCZC8ja3OvVjHFK9x/tEzOVgy5jLN7fCOI4xipZxOI9NZ6sWZ20rW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:15', '2018-03-30 00:47:15'),
(32, 'prem_4', 'prem-4', 'prem_4', 'prem_4@gmail.com', '$2y$10$2.9vQND8aoJtGFRVRzZcv.LJHVGAP9f70n/g8lvTzSJ2Z84ZMnwLe', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(33, 'prem_5', 'prem-5', 'prem_5', 'prem_5@gmail.com', '$2y$10$Yv2uylQfpIyo4bEQ3TNgduxLaXfm8tyE.rOSAdEuS4Tykrukwtowq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(34, 'prem_6', 'prem-6', 'prem_6', 'prem_6@gmail.com', '$2y$10$98fT7YzO7QIqE/WdIOYHJ.SAZoxe/tS5kKdIpsAzGAiiwyD/p4VjW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(35, 'prem_7', 'prem-7', 'prem_7', 'prem_7@gmail.com', '$2y$10$46OdWzWRDKlTMeRwDSI4GuqzTBivTbSuezYSSBfM.ud2VeXW5pVAm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(36, 'prem_8', 'prem-8', 'prem_8', 'prem_8@gmail.com', '$2y$10$ue5JdP8n8TwR21JoL/spneyJCPLvpeZewX.UGUddP0mqY.fvJbP6u', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(37, 'prem_9', 'prem-9', 'prem_9', 'prem_9@gmail.com', '$2y$10$LdOwuvoDqvpvarPrMlAjQuo4yDPdqFCC9djZFTl73/QNfOCHvCNem', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(38, 'prem_10', 'prem-10', 'prem_10', 'prem_10@gmail.com', '$2y$10$jQlTfv051.7VtIic9Kejd.EzIe4XQ9XyozhuG0FhqkPgf.ZSdg2da', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(39, 'prem_11', 'prem-11', 'prem_11', 'prem_11@gmail.com', '$2y$10$UEWn.rKepy4ICFJXllgMdeNKFSW0ebN6AplJOYzWiOixWMmTrswWS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:16', '2018-03-30 00:47:16'),
(40, 'prem_12', 'prem-12', 'prem_12', 'prem_12@gmail.com', '$2y$10$z99MUNCdaqZX99U2kGtjH.Qk/KzXD3hDu3ToLOuB4Hr0.c1eMOQx2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(41, 'prem_13', 'prem-13', 'prem_13', 'prem_13@gmail.com', '$2y$10$amUgpxMYeZqAonWjmKm/RemdE45.QegFvpAaKu51rbYodelgyEWZ.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(42, 'prem_14', 'prem-14', 'prem_14', 'prem_14@gmail.com', '$2y$10$j/YowUMJJeYf8rMpztrpfukBxl./95ftH5FrMhx6PBWwRR7i8omX6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(43, 'prem_15', 'prem-15', 'prem_15', 'prem_15@gmail.com', '$2y$10$Q06xuIFimNz/WYn8j5G6EeVBIwDM0RHOJfiona0cieB5tM4mEugmy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(44, 'prem_16', 'prem-16', 'prem_16', 'prem_16@gmail.com', '$2y$10$sU2Xx.IXBdMnxQVIqKZoMu7d4jhXb6De0ABN6ZJruXBs.BNP2G5ye', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(45, 'prem_17', 'prem-17', 'prem_17', 'prem_17@gmail.com', '$2y$10$2z94dT4ZOh1KNm46NFCSSeZAU2dmfP7Y9iJTYzFf.Ri2jfeWvpo3m', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(46, 'prem_18', 'prem-18', 'prem_18', 'prem_18@gmail.com', '$2y$10$C/6aYxpC0W/qL2AqqXGJ8uW0KARqBuYMjInCTVkFS352magnqqGhq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:17', '2018-03-30 00:47:17'),
(47, 'prem_19', 'prem-19', 'prem_19', 'prem_19@gmail.com', '$2y$10$3FZpgy5xvEEUd9tG67tr8.7yg6mTZ.OfGWf0CzCqAIu.Fv4qMi2Sa', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(48, 'prem_20', 'prem-20', 'prem_20', 'prem_20@gmail.com', '$2y$10$DWgvuRtaztGj3RKowlRWsu1tUcsELSYYq8y3FyKJVhosqgkGkNiym', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(49, 'prem_21', 'prem-21', 'prem_21', 'prem_21@gmail.com', '$2y$10$a5Et5C8fR4Yk31jI4g85PeMC/cL.eKXHKlHZSbSkQHlFNAxOH.3R.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(50, 'prem_22', 'prem-22', 'prem_22', 'prem_22@gmail.com', '$2y$10$SDXHEF5yBytQvu53fBKEZO6UIS6a3N4g/cg1E8CSX1p/Xf4TukAQC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(51, 'prem_23', 'prem-23', 'prem_23', 'prem_23@gmail.com', '$2y$10$9XFBHxZOwkmIu1YlAPTiLeKxaNM.IgSLPHgAyfSpaR0OreD6CCTJG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(52, 'prem_24', 'prem-24', 'prem_24', 'prem_24@gmail.com', '$2y$10$NKycPrEcg276PRdDmg9SUuEuMR8iFs5a1Yt16c8jRTXSJSH4DOnNG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(53, 'prem_25', 'prem-25', 'prem_25', 'prem_25@gmail.com', '$2y$10$C4C08PyPK3iM3.Ss4xVCmeZmj9A44WKoc13YJDoLoT3qfnLpqm1eC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:18', '2018-03-30 00:47:18'),
(54, 'prem_26', 'prem-26', 'prem_26', 'prem_26@gmail.com', '$2y$10$PgXVaK/6xXoR40jaLpDBP.aGty9mxjnzK1nzfa6S0kEROuYAbNmTu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:19', '2018-03-30 00:47:19'),
(55, 'prem_27', 'prem-27', 'prem_27', 'prem_27@gmail.com', '$2y$10$NHPq0qHarsGpjgDYOb7pseqKP9C2PlnDCcRKd.wtzZvl.EB9ze5oO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:19', '2018-03-30 00:47:19'),
(56, 'prem_28', 'prem-28', 'prem_28', 'prem_28@gmail.com', '$2y$10$ESpNqSCTwZkfk9YcjcoJh.fAuh0ZfA1Mp2zUps5YCsfXiJO3yMGmO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:19', '2018-03-30 00:47:19'),
(57, 'prem_29', 'prem-29', 'prem_29', 'prem_29@gmail.com', '$2y$10$ibQcxDx6.1c6cuHxAWVU2OkiJxGjkGZ5bOepObk.ZvPKKl4ZqYLni', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:19', '2018-03-30 00:47:19'),
(58, 'prem_30', 'prem-30', 'prem_30', 'prem_30@gmail.com', '$2y$10$i7uxfzLnqdupp3NNiv3CLuReO3r4uLqEXj.5F03xW0CD4uGHK246O', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:19', '2018-03-30 00:47:19'),
(59, 'prem_31', 'prem-31', 'prem_31', 'prem_31@gmail.com', '$2y$10$f4y31xGzmbf1QGboDP2yFeqHTSDB8qUGYJTalviIEzHpThfQ3803q', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:19', '2018-03-30 00:47:19'),
(60, 'prem_32', 'prem-32', 'prem_32', 'prem_32@gmail.com', '$2y$10$3iIpBSiMihBwuUGRE/C.2u8ZAP.u1bjbYO2STH31mR1Ht/L0eFGcy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(61, 'prem_33', 'prem-33', 'prem_33', 'prem_33@gmail.com', '$2y$10$2HSKstE8kt1stTelNWpOHuVpmynRu9Z16eZtN11Em5ecoEPIVw3le', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(62, 'prem_34', 'prem-34', 'prem_34', 'prem_34@gmail.com', '$2y$10$qFH7KFbE9jDVY/MOlMUNNu8kFCLFAtGjSdBZOF9uSXspsb1jW31ia', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(63, 'prem_35', 'prem-35', 'prem_35', 'prem_35@gmail.com', '$2y$10$5307j7A.rz4fpQLdk5Kf9e617GEBYF4G4MMQJTfeJaPRjxXrHRypG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(64, 'prem_36', 'prem-36', 'prem_36', 'prem_36@gmail.com', '$2y$10$3MUXVh1w59KxO1ssMp.ehOx77.U0aJ26KysPNwxDzufc4Po3DbqAW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(65, 'prem_37', 'prem-37', 'prem_37', 'prem_37@gmail.com', '$2y$10$bMEjw9Dq06cPnjKcA7ffLOiTv3V82xISCLUxRImVgh8daNKTsKe1K', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(66, 'prem_38', 'prem-38', 'prem_38', 'prem_38@gmail.com', '$2y$10$Upo.eahdUcJ9s5HZodJrI.22hNAgvAOsYCzSHglz0V7LuxdO7X1.C', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:20', '2018-03-30 00:47:20'),
(67, 'prem_39', 'prem-39', 'prem_39', 'prem_39@gmail.com', '$2y$10$t6KW72w9G8a2TaAeUyz15.ZnPgRyjDSg42G0UMSjejWoXjDl9Rft.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(68, 'prem_40', 'prem-40', 'prem_40', 'prem_40@gmail.com', '$2y$10$aEOXlD0Xwar5wr987m.mceXGyXVc.ly14hWOBWSwPRdq.dW99iFoW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(69, 'prem_41', 'prem-41', 'prem_41', 'prem_41@gmail.com', '$2y$10$dLn0gb63uQ3DWkDYj817xekl4CEy0Q6yv8ahXygXAjHXYldqNfzIW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(70, 'prem_42', 'prem-42', 'prem_42', 'prem_42@gmail.com', '$2y$10$tFzGh4Jc7kE3B8W/OxluzumHvnY1m/FDx/RBUFbgYgCJozgTK//z6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(71, 'prem_43', 'prem-43', 'prem_43', 'prem_43@gmail.com', '$2y$10$tJJan6lV94uJMjW53twPNe5mkgrOxX4ilZIyOEflCYS32s4qvfXFm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(72, 'prem_44', 'prem-44', 'prem_44', 'prem_44@gmail.com', '$2y$10$IS5r6QMeyPW4nAtxuAQcRe103U5fLn171BlJGTlZChPEVJun41Tta', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(73, 'prem_45', 'prem-45', 'prem_45', 'prem_45@gmail.com', '$2y$10$/rDF7vpE..6HijRmPucgAO/ogNs0aRtfwCZvroSVcGGC9M6SIgIJC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:21', '2018-03-30 00:47:21'),
(74, 'prem_46', 'prem-46', 'prem_46', 'prem_46@gmail.com', '$2y$10$KdBxMIyduLQ7eNYd05fP/ekWEfz4wDFf1f8B2HobdIB15nFfi7mca', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:22', '2018-03-30 00:47:22'),
(75, 'prem_47', 'prem-47', 'prem_47', 'prem_47@gmail.com', '$2y$10$4ObOoFf/s4BGNmuBwDyra.3VuNmJo7wu/trwJtL1Ei8pOjTGJvpiO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:22', '2018-03-30 00:47:22'),
(76, 'prem_48', 'prem-48', 'prem_48', 'prem_48@gmail.com', '$2y$10$oyqbmETqLCke3FyWl4x/IuHz2ltWM/OXDgtPU1RX9EmJOWGD2GXQS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:22', '2018-03-30 00:47:22'),
(77, 'prem_49', 'prem-49', 'prem_49', 'prem_49@gmail.com', '$2y$10$2XWHojMLsNViUtqHV3wkUec2H5A.CCs/ohTUNu5T/C1p1L2/JWOJ2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:22', '2018-03-30 00:47:22'),
(78, 'prem_50', 'prem-50', 'prem_50', 'prem_50@gmail.com', '$2y$10$sw3w0V5xgx2jptk.51a22ue0DacI0g6XKdAvgJqXoN8bJJ8uKWFe6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:47:22', '2018-03-30 00:47:22'),
(79, 'prem_60', 'prem-60', 'prem_60', 'prem_60@gmail.com', '$2y$10$njSfYkiPmgubiPF.eoblFecEnxgwfBX6Z25.nRKe6ubtHwHRB3TLG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:17', '2018-03-30 00:50:17'),
(80, 'prem_61', 'prem-61', 'prem_61', 'prem_61@gmail.com', '$2y$10$hsxSgODZnUpEWVeRpJI1euxoRwg0Mm/SX.SD6WS0ZdeDdV7vq/Hsq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:17', '2018-03-30 00:50:17'),
(81, 'prem_62', 'prem-62', 'prem_62', 'prem_62@gmail.com', '$2y$10$QloibwdtVVhrVt7u8qLrfuTMBP8Rut8FpanPxGFZb.6KZrEiPxQbK', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(82, 'prem_63', 'prem-63', 'prem_63', 'prem_63@gmail.com', '$2y$10$OIRXLqv20fQ3mx/Rh3ujpO0UtgDoAgA0tvow42Nnjx0ZG31qUG/bi', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(83, 'prem_64', 'prem-64', 'prem_64', 'prem_64@gmail.com', '$2y$10$g4ZM0GGpW9YWCIhG1mLPxuj1Nserka1.35XakM1VVx1K.1BxrEsde', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(84, 'prem_65', 'prem-65', 'prem_65', 'prem_65@gmail.com', '$2y$10$xwFouQfNL9NVNrot7tGDxO2aJGXlA/NnTDE5f4coJv2Lz.TSeM7vu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(85, 'prem_66', 'prem-66', 'prem_66', 'prem_66@gmail.com', '$2y$10$AMdOQZ1w7vrvAFf5aVv6puHEsKBxGoY6CDJ/zM2tHEzYJsjwuXVr2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(86, 'prem_67', 'prem-67', 'prem_67', 'prem_67@gmail.com', '$2y$10$.VgBtZxnp5BOm173GSu9qOTpEvCcUejSfiaF5s7d7ch3p837B87lO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(87, 'prem_68', 'prem-68', 'prem_68', 'prem_68@gmail.com', '$2y$10$kcV9tdf0uV5vjT1EYt440.6QXE7pMfDjOUxmbqS9fp1fMGq/tVFAi', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:18', '2018-03-30 00:50:18'),
(88, 'prem_69', 'prem-69', 'prem_69', 'prem_69@gmail.com', '$2y$10$LUE2UrFrYKVOkzJwawWhBuoUUScyyiBBlbkoOWPZLX2Mee292jjBu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:19', '2018-03-30 00:50:19'),
(89, 'prem_70', 'prem-70', 'prem_70', 'prem_70@gmail.com', '$2y$10$Uf/kZ.pVXHaQhg3xw6KYxuPZLABbxL0qm7Uj1247hqtGq41BHAVSG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:19', '2018-03-30 00:50:19'),
(90, 'prem_71', 'prem-71', 'prem_71', 'prem_71@gmail.com', '$2y$10$.spQZa0r9LSz5f2YRHl2tOOIdd.E5ZkEMpnO0Y402UB/LmMOF4g0G', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:19', '2018-03-30 00:50:19'),
(91, 'prem_72', 'prem-72', 'prem_72', 'prem_72@gmail.com', '$2y$10$XPGsLTlYbwz3V7jBf8wLPOEok16grNnlKbHr9IfyClV2wlGqoj4WS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:19', '2018-03-30 00:50:19'),
(92, 'prem_73', 'prem-73', 'prem_73', 'prem_73@gmail.com', '$2y$10$0tP5U6l.sDlNEp3qdYwPpuAfSyPn9piOlSAPzx.qV5hyt3jVUc1zC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:19', '2018-03-30 00:50:19'),
(93, 'prem_74', 'prem-74', 'prem_74', 'prem_74@gmail.com', '$2y$10$iiF9lP2hhaod7amy07m5k.QOG2QIcHmmTAOPD0QhlroF0I2HCT2Iy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:19', '2018-03-30 00:50:19'),
(94, 'prem_75', 'prem-75', 'prem_75', 'prem_75@gmail.com', '$2y$10$9Hle7oWADszgeBlbAeebyeb67xsu0ToiBmfYTF.a7LL00gZiCYMNq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(95, 'prem_76', 'prem-76', 'prem_76', 'prem_76@gmail.com', '$2y$10$SWmHF39CIdVy8CxowZQMkePW/.9FjuIW4WNes5yVKBmq1rZQDwMhm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(96, 'prem_77', 'prem-77', 'prem_77', 'prem_77@gmail.com', '$2y$10$bjcnU/tWzgJ7RUeb4pm9gOeJH/bHtD3tTJqihWsUDOycrruuS3/fC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(97, 'prem_78', 'prem-78', 'prem_78', 'prem_78@gmail.com', '$2y$10$h80LQDrpfHmcTUvgUP6DCOPUkP0WT2MqD.VWdldmYMNz0V2lIPWn.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(98, 'prem_79', 'prem-79', 'prem_79', 'prem_79@gmail.com', '$2y$10$h.lvYECjYUHwTGUWb9lStugCtwzruVOZot/JwiWugzXLMtkkK8qnm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(99, 'prem_80', 'prem-80', 'prem_80', 'prem_80@gmail.com', '$2y$10$uESY4dLYDqO8s57M/gnXzO5xn5A0trkJM8UzcyVOFkI7oabaN8SpK', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(100, 'prem_81', 'prem-81', 'prem_81', 'prem_81@gmail.com', '$2y$10$xIP2ydnQRziUDvSOAVRwQ.ASg0LVUO027AY9aGvLeqJcZCrvJ7sKa', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(101, 'prem_82', 'prem-82', 'prem_82', 'prem_82@gmail.com', '$2y$10$jrcHfFHRSWDvhlAhH49kVu2dEqdQVIbKrMIJqvcIDtvx7F1tDhduy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:20', '2018-03-30 00:50:20'),
(102, 'prem_83', 'prem-83', 'prem_83', 'prem_83@gmail.com', '$2y$10$yMuMk8AcUxskekZNGP36BO7LZrckslhyT1TC9C8S4xbrpUICZTcju', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(103, 'prem_84', 'prem-84', 'prem_84', 'prem_84@gmail.com', '$2y$10$W4tC07bxQN27WI2DxArAx.htf7rp2Zc5QwnP2HeQI/kkvXUjkgNxO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(104, 'prem_85', 'prem-85', 'prem_85', 'prem_85@gmail.com', '$2y$10$4KKnuoQiRnKiBxwK00btd.ksOIGnyWUx2BdfAvqL4qv253rd1x4tu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(105, 'prem_86', 'prem-86', 'prem_86', 'prem_86@gmail.com', '$2y$10$1vCHE7q1UsgAMAETm2sG4.h7CpUPrp37.VfQwCDMXAYawoPQqGRZW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(106, 'prem_87', 'prem-87', 'prem_87', 'prem_87@gmail.com', '$2y$10$9Mxtozb1hJ865w8/Z8A7lOnzJvbY8TFwzdfaTLY8xBTH3Feckcx16', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(107, 'prem_88', 'prem-88', 'prem_88', 'prem_88@gmail.com', '$2y$10$kfzeQULYiX6dhMHfFYshVekduFsN/d19/2VC8G9CsZLVWzdge0UQi', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(108, 'prem_89', 'prem-89', 'prem_89', 'prem_89@gmail.com', '$2y$10$jMOi7Ujmgqo0yGKDADEyY.nBh4fN13rhpmTfgTfI.epu7l1kZKQNi', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:21', '2018-03-30 00:50:21'),
(109, 'prem_90', 'prem-90', 'prem_90', 'prem_90@gmail.com', '$2y$10$SzKKXPptXMSUnv0Iq2t2TOxhnm7NOPM/3modVpOiHRXXGg.LgJfy2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(110, 'prem_91', 'prem-91', 'prem_91', 'prem_91@gmail.com', '$2y$10$A2xEAYyccno6THZ0ldWvjua6adJt0Iax8W2OL73c8MmjqeUx91Bsm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(111, 'prem_92', 'prem-92', 'prem_92', 'prem_92@gmail.com', '$2y$10$NJK.eZ4LwCgQEpSQG6bJCuEzIBkiH9JzVUCLko8iJdhOGyaI.uAzy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(112, 'prem_93', 'prem-93', 'prem_93', 'prem_93@gmail.com', '$2y$10$Ipvn6hUJeDISJUjySWF7yexLspqfVdKBDWhsx/t4L9dDktTEeoROq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(113, 'prem_94', 'prem-94', 'prem_94', 'prem_94@gmail.com', '$2y$10$pibp8RePAZPp0RKx/sx.o./CVKj8rK79a9P5lw9OFkNEvDJ14D8U2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(114, 'prem_95', 'prem-95', 'prem_95', 'prem_95@gmail.com', '$2y$10$cNT3BUaNitg7SMG95uLu7ep0w81EqxQ7QPOZMsFT4qoFfr5Ylg1kS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(115, 'prem_96', 'prem-96', 'prem_96', 'prem_96@gmail.com', '$2y$10$j/Wo7QVfQ/fyvr59UOPlV.vMJD8UfShuxVKWIOysVz3SIYe6z2y7q', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:22', '2018-03-30 00:50:22'),
(116, 'prem_97', 'prem-97', 'prem_97', 'prem_97@gmail.com', '$2y$10$mcgIKesmhSpSQOElzjdjAepzXN7v2w/fMh7ZtdQB111fHxCrgU4ju', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(117, 'prem_98', 'prem-98', 'prem_98', 'prem_98@gmail.com', '$2y$10$uOsdDhUgP8uzHjOeYZel2.pwTotZr3HG.oh9Z0SozKWPHWMsqR/7G', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(118, 'prem_99', 'prem-99', 'prem_99', 'prem_99@gmail.com', '$2y$10$.ZUz1FE4XVOZQjSmfEe1TeS5O4kU5KyIrYF/mjSqNwYvzZWDmP/eC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(119, 'prem_100', 'prem-100', 'prem_100', 'prem_100@gmail.com', '$2y$10$M5DJOxEhDsv1xibwBwZ.XOBUH1yrYpCLe.gGNvZj1q245Enb54S/.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(120, 'prem_101', 'prem-101', 'prem_101', 'prem_101@gmail.com', '$2y$10$8FgRjC0BG96ZWa/OAMIgZOK2yVAL64MtG89M09M3NMd4xw.Hcxyj6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(121, 'prem_102', 'prem-102', 'prem_102', 'prem_102@gmail.com', '$2y$10$vu69VfY29X.DK9XHinrA.eO0DDdO1kJZk72AgRSrwY5K7YuH8/iba', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(122, 'prem_103', 'prem-103', 'prem_103', 'prem_103@gmail.com', '$2y$10$ID1F9I595wH6zbSGydwqEeAYvI/GV.AXqc1knIev6Nr3.cFvYYuwO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(123, 'prem_104', 'prem-104', 'prem_104', 'prem_104@gmail.com', '$2y$10$y0aY6rW0Fp/A/PwICf0pUuCYN1n8BdmSxRyMnD/Hb3YubVRuK6OZe', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:23', '2018-03-30 00:50:23'),
(124, 'prem_105', 'prem-105', 'prem_105', 'prem_105@gmail.com', '$2y$10$8.gWiDtzDpxE5CtLQkmqIO5snChZlxeQCuI6v5tZ6OpB1gvItg26.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(125, 'prem_106', 'prem-106', 'prem_106', 'prem_106@gmail.com', '$2y$10$ixyxu3Ge7OUM/YCaEt2.fuv.mIookVmTuKCCKaES4hPFNeQ6ioMFy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(126, 'prem_107', 'prem-107', 'prem_107', 'prem_107@gmail.com', '$2y$10$76tnVH.eOfsHKMEX6CFJau5DhHUjgPBBRhNZaGD1JUyQtLtiNaaYm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(127, 'prem_108', 'prem-108', 'prem_108', 'prem_108@gmail.com', '$2y$10$9UJbzrR6SZpz38uP05LMmea66SipejL0Y4lCP.7CLM0Tnz6Tl34xu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(128, 'prem_109', 'prem-109', 'prem_109', 'prem_109@gmail.com', '$2y$10$OpZOkyeyzVxxh0xTXAb8v.mr.svze78nJPcmB9rdKh3jGiX8PwwEy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(129, 'prem_110', 'prem-110', 'prem_110', 'prem_110@gmail.com', '$2y$10$tze0jB346jHmXXqUTTKV/eQsqbT97AlGTrhh.LsbvUInv/KDeBAJq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(130, 'prem_111', 'prem-111', 'prem_111', 'prem_111@gmail.com', '$2y$10$h6Qbk05Xhjdp0mpU.x8TMO7YfsR8Xb8qA6HcBo5vKcOj7QYkt9qlG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:24', '2018-03-30 00:50:24'),
(131, 'prem_112', 'prem-112', 'prem_112', 'prem_112@gmail.com', '$2y$10$lgtr17AVdiNKlsPwfqlMpuZKnIn3wyDVdxFwp22QCk5EC/4TVnwyC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:25', '2018-03-30 00:50:25'),
(132, 'prem_113', 'prem-113', 'prem_113', 'prem_113@gmail.com', '$2y$10$Ad8TRxjBP3/qj7MioHmWqe.ie7/QuJFN2R65829JV/ma07iFI0Q8S', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:25', '2018-03-30 00:50:25'),
(133, 'prem_114', 'prem-114', 'prem_114', 'prem_114@gmail.com', '$2y$10$zh8zTuX7hFaEbzwHbFabSe44yRCp5hmrP4hJ1rAWvaKjPcycjzY8y', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:25', '2018-03-30 00:50:25'),
(134, 'prem_115', 'prem-115', 'prem_115', 'prem_115@gmail.com', '$2y$10$jp/OPHDNxWViH3L0WlwbJejwg5gy/gaPK/P9looJtTrgdcNY9zwNG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:25', '2018-03-30 00:50:25'),
(135, 'prem_116', 'prem-116', 'prem_116', 'prem_116@gmail.com', '$2y$10$zmhaFnR9i11cUtcg8hJFx.0gPO/5iVqj44R5hWudYzvZlzEuQxdVW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:25', '2018-03-30 00:50:25'),
(136, 'prem_117', 'prem-117', 'prem_117', 'prem_117@gmail.com', '$2y$10$UXI2p/MGSEFtcZQybQ2//.P.dfYc3d/i6B.XgxDOqfDzrJIRiUkS6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:25', '2018-03-30 00:50:25'),
(137, 'prem_118', 'prem-118', 'prem_118', 'prem_118@gmail.com', '$2y$10$3T0Push4S/bUT13OdShrJOLIUa8/SzJYu.4typXqtLf.MO3vp3J6C', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(138, 'prem_119', 'prem-119', 'prem_119', 'prem_119@gmail.com', '$2y$10$38uNChrr2JX2mmD51be42e7S4REz5Wm3U/jcOtNtQqmUna80gvSqq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(139, 'prem_120', 'prem-120', 'prem_120', 'prem_120@gmail.com', '$2y$10$HJ0e7Ux.hXXY1rcTAOW.2OewJE9TkDA7D3D3T2krjbwtk2trsE4XW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(140, 'prem_121', 'prem-121', 'prem_121', 'prem_121@gmail.com', '$2y$10$9OX57nVUWRfltDK1XuGS1eqs6njDI.b.OoCVmMwhg3KOWH2QP2amG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(141, 'prem_122', 'prem-122', 'prem_122', 'prem_122@gmail.com', '$2y$10$U7Gj15ob44EjaKQ4l5T6OeJnxMWrX3RdCE5tRV5ietGVaE9neCWRG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(142, 'prem_123', 'prem-123', 'prem_123', 'prem_123@gmail.com', '$2y$10$vnCC94qtjWfC6ZMRJTLhsOXcIyqIhXoTbUxz/Ac3iJxaZ6Kg6lC1C', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(143, 'prem_124', 'prem-124', 'prem_124', 'prem_124@gmail.com', '$2y$10$VKeLEWGzZ8hrNOGCw43/CuXJ1EYALJv2jOlC7YQZWCtl42d6GTQyu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:26', '2018-03-30 00:50:26'),
(144, 'prem_125', 'prem-125', 'prem_125', 'prem_125@gmail.com', '$2y$10$0V4WoEaL0nmNW48acunyDOyy2J19UQYMDEY.0mBuQMctE/GLw9i5C', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(145, 'prem_126', 'prem-126', 'prem_126', 'prem_126@gmail.com', '$2y$10$rpILpbt40wbm6gVDAs/W3upbsAqT8amKRGKKwtKAW.DZDOdvUAZre', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(146, 'prem_127', 'prem-127', 'prem_127', 'prem_127@gmail.com', '$2y$10$KOnQ67hgtfw6fSBW30er8uH0BYG0Q5N178XYWhpjFuDtWoiLApI/y', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(147, 'prem_128', 'prem-128', 'prem_128', 'prem_128@gmail.com', '$2y$10$fjYZTuoKUK2blMNWHhu4dOpcZ.jQikiQH8zR2p7WSul27RVNymRTe', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(148, 'prem_129', 'prem-129', 'prem_129', 'prem_129@gmail.com', '$2y$10$bnmCHCXHXeuAnhzsRLEDbOs4wHE6HKncBnPWvzQ7/cJnEDWDUlINK', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(149, 'prem_130', 'prem-130', 'prem_130', 'prem_130@gmail.com', '$2y$10$5oLV2Z1ydCvn6d45lJ8NU.zYPe4NL4.3bnFH2t1mwprC.PnRSwb0q', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(150, 'prem_131', 'prem-131', 'prem_131', 'prem_131@gmail.com', '$2y$10$KakIJg9cCmf.2MLc2ZFdpuGeGIeeqfEX2FK6Y5V0Y/bzuzef5GdJm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:27', '2018-03-30 00:50:27'),
(151, 'prem_132', 'prem-132', 'prem_132', 'prem_132@gmail.com', '$2y$10$GZyiesDrFD9Zoq7TIS1m1.ONoxAupoTY7YiapbwyQEzJPM6AcD6My', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:28', '2018-03-30 00:50:28'),
(152, 'prem_133', 'prem-133', 'prem_133', 'prem_133@gmail.com', '$2y$10$E1GE0pRown7hWXP/hRpU2eBDLoDyc.Hc8.cKnT3epn/THAjC6q816', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:28', '2018-03-30 00:50:28'),
(153, 'prem_134', 'prem-134', 'prem_134', 'prem_134@gmail.com', '$2y$10$BMWZMCM1QcKqAyCPnj1PZOwPpkAQ6yigZtOnsEsF9yfgrxWX8xfS2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:28', '2018-03-30 00:50:28'),
(154, 'prem_135', 'prem-135', 'prem_135', 'prem_135@gmail.com', '$2y$10$kqkNctk7fIr7pVNH1fQtD.M3Rn3ofZxaNXR7/5VOnoh4psifnYk4G', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:28', '2018-03-30 00:50:28'),
(155, 'prem_136', 'prem-136', 'prem_136', 'prem_136@gmail.com', '$2y$10$P4FKozCKM4qVVNqRMronxOLMPxpahSKCXwYUL7exE/QlKTURysbU6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:28', '2018-03-30 00:50:28'),
(156, 'prem_137', 'prem-137', 'prem_137', 'prem_137@gmail.com', '$2y$10$PFQNu4tLhvvtComwiCknqONn5Eq0NBCMy9/12PT6x1VLMWt7cdZ7e', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:28', '2018-03-30 00:50:28'),
(157, 'prem_138', 'prem-138', 'prem_138', 'prem_138@gmail.com', '$2y$10$hdpI9cJDIhWT78aWquHvX.1G/Efhz/h3MdfdWKL2NpGlO7Ndz9cle', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:29', '2018-03-30 00:50:29'),
(158, 'prem_139', 'prem-139', 'prem_139', 'prem_139@gmail.com', '$2y$10$9m5Ce1T.3G5hJ3VIDQuzo.k.pxAz5u5lxSr2nkBkHLq8/RZaf/U4O', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:29', '2018-03-30 00:50:29'),
(159, 'prem_140', 'prem-140', 'prem_140', 'prem_140@gmail.com', '$2y$10$JPxWRIQYPcbF0sth5jN4Se7A2XgDwduaSsjhJ12ENETM6fQ4rr/IC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:29', '2018-03-30 00:50:29'),
(160, 'prem_141', 'prem-141', 'prem_141', 'prem_141@gmail.com', '$2y$10$cSWRcSMzgd9GaZYxeHmgIeIEOEHD.NdhkSVtPgJxWW2qgAEleostu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:29', '2018-03-30 00:50:29'),
(161, 'prem_142', 'prem-142', 'prem_142', 'prem_142@gmail.com', '$2y$10$eSMFBSB5RhfZcAR66tf.july.9SKMtgpAUSHFwQryOz5e1Jm6JO4i', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(162, 'prem_143', 'prem-143', 'prem_143', 'prem_143@gmail.com', '$2y$10$v1CAxcGvrhKDkGR95u3eEOA9/14fa5b3uFi7mlseU1TbnV43isNIq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(163, 'prem_144', 'prem-144', 'prem_144', 'prem_144@gmail.com', '$2y$10$VbT5UKjEeS6ubydKB7kX.uny1S2OJNC1rQvLEtRIL1G1DmruSRtQy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(164, 'prem_145', 'prem-145', 'prem_145', 'prem_145@gmail.com', '$2y$10$/goyKncl3QqiJ5/HXTeVb.KTsEXL2PoTmmH376hDctrVAURmaEwim', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(165, 'prem_146', 'prem-146', 'prem_146', 'prem_146@gmail.com', '$2y$10$IlTGXXHYECNgSUHNh/S5Wu1l3knQat3lj.41NxmNh4RGYzIoojaxa', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(166, 'prem_147', 'prem-147', 'prem_147', 'prem_147@gmail.com', '$2y$10$Lbd2HwSJT0w7MLJVvwE4leDmGnUJboHguolYgOZb.HLHndbCFoe2W', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(167, 'prem_148', 'prem-148', 'prem_148', 'prem_148@gmail.com', '$2y$10$zqWbcnzCqFNCxlVCMtnfCexhBkp3pLmGomHaB95hP2KHL39HcuiAS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:30', '2018-03-30 00:50:30'),
(168, 'prem_149', 'prem-149', 'prem_149', 'prem_149@gmail.com', '$2y$10$iZ6fiol0FN4XkHT/xan51.D08VVJhlnS0dZxq5fyYA5V5N/rm2LdW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:31', '2018-03-30 00:50:31'),
(169, 'prem_150', 'prem-150', 'prem_150', 'prem_150@gmail.com', '$2y$10$0/u2OCzxkQFkgrNim0IHIOiCkYJMS8norkW0vIqJ9anJEaCjD/fhy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:31', '2018-03-30 00:50:31'),
(170, 'prem_151', 'prem-151', 'prem_151', 'prem_151@gmail.com', '$2y$10$hkKU/wi1hu7ZsGltPxjYBOpsfzRHkdWllbvjG52ZjuEJs8e7FgFeG', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:31', '2018-03-30 00:50:31'),
(171, 'prem_152', 'prem-152', 'prem_152', 'prem_152@gmail.com', '$2y$10$b11EFY7ukAkPmUy5EZp9cODr6/U1RKW5lyEWm7fovfil0q0ZuKWQ2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:31', '2018-03-30 00:50:31'),
(172, 'prem_153', 'prem-153', 'prem_153', 'prem_153@gmail.com', '$2y$10$TYiAgZVODsU95bV5p/rBGOzxf9ZFLmGsIkCn8nQrO8SZsQlvL9WRe', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:31', '2018-03-30 00:50:31'),
(173, 'prem_154', 'prem-154', 'prem_154', 'prem_154@gmail.com', '$2y$10$XqkrrBL/0.Qtn22KS81rMOQP8a/EV6HY8wcxAZxCro3YEL33Zl6NC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:31', '2018-03-30 00:50:31'),
(174, 'prem_155', 'prem-155', 'prem_155', 'prem_155@gmail.com', '$2y$10$soJ4cIbHd2Fwn8aKPUVY7uipmmEZO3arcZFl4MTfmqYSfRkkfahRy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(175, 'prem_156', 'prem-156', 'prem_156', 'prem_156@gmail.com', '$2y$10$tHEast9Ugy8cgRYjaSmhWubC3b03yBdWzqWiXzByVGR75OFt42zoO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(176, 'prem_157', 'prem-157', 'prem_157', 'prem_157@gmail.com', '$2y$10$kJYc0pnj5QTQ84yiOeeeLeccMKtEmIFT0rb4/s07GGFzaS4UUvI92', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(177, 'prem_158', 'prem-158', 'prem_158', 'prem_158@gmail.com', '$2y$10$0.BN73AOoRB5fPIQn/OpoujuzyrwI.zCyToh4awQLhEfJ.BSElipq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(178, 'prem_159', 'prem-159', 'prem_159', 'prem_159@gmail.com', '$2y$10$qLOl4ziwS.VDthES5syj2uO8n6BxjDqLPcz7hKL7q35Ia.GgP7EjO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(179, 'prem_160', 'prem-160', 'prem_160', 'prem_160@gmail.com', '$2y$10$7grVsQsQslhsE1ItQ8XxyOHV2vt7RWf2u3qt09chM.OQJU2Nmhz9y', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(180, 'prem_161', 'prem-161', 'prem_161', 'prem_161@gmail.com', '$2y$10$mRX4S/EmjImknT7TFr33ruCVJ8gvfO/5u4iFrl6llYg6ALhKFTbvu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:32', '2018-03-30 00:50:32'),
(181, 'prem_162', 'prem-162', 'prem_162', 'prem_162@gmail.com', '$2y$10$SaJz7DWTR4JJ6TYX/vCwV.QYo.MnahfMKzDpZg7AmK9tpyn42cjAK', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:33', '2018-03-30 00:50:33'),
(182, 'prem_163', 'prem-163', 'prem_163', 'prem_163@gmail.com', '$2y$10$ZMxIKWwKbTsCZ671CsI..O3n3yhcJvSoSgN.fxRhC9nUjA.yRNb9C', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:33', '2018-03-30 00:50:33'),
(183, 'prem_164', 'prem-164', 'prem_164', 'prem_164@gmail.com', '$2y$10$KNvM2h./DIOrm6Q9BlMJ.uVs90/.j1i62UKZSPn408VLz9.IQk.3q', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:33', '2018-03-30 00:50:33'),
(184, 'prem_165', 'prem-165', 'prem_165', 'prem_165@gmail.com', '$2y$10$Bq5WJ0hq24sPnJMxFlZKd./s5OXQZ3i/26RhJ9oR1oNTF4oLdyvAS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:33', '2018-03-30 00:50:33'),
(185, 'prem_166', 'prem-166', 'prem_166', 'prem_166@gmail.com', '$2y$10$bo3ak6JbIh89TBFtI8.4.OCwIC6fCADD1MslLxAl11i5WNlMJFMN2', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:33', '2018-03-30 00:50:33'),
(186, 'prem_167', 'prem-167', 'prem_167', 'prem_167@gmail.com', '$2y$10$wxrtPkMB/NFFaj1tF418QO48vFNVt6OTdjMlFWLWtL7oeGgHDwSuO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:33', '2018-03-30 00:50:33'),
(187, 'prem_168', 'prem-168', 'prem_168', 'prem_168@gmail.com', '$2y$10$VBLzlW1hEPYbaqTOFEmHxeSBvS9kGlFrg5msEUhzSF3Mxwbt.Wm/.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:34', '2018-03-30 00:50:34'),
(188, 'prem_169', 'prem-169', 'prem_169', 'prem_169@gmail.com', '$2y$10$iXihPt..aAH2neh8ttgi6uAUFo0xbYN3cDVr4KZB6NriTq8ySm822', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:34', '2018-03-30 00:50:34'),
(189, 'prem_170', 'prem-170', 'prem_170', 'prem_170@gmail.com', '$2y$10$5dqs0q6SNyrHlZyUZAID.utlrwIp5JOlri5/.olrmK9NpQAX2OrRO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:34', '2018-03-30 00:50:34'),
(190, 'prem_171', 'prem-171', 'prem_171', 'prem_171@gmail.com', '$2y$10$tuTwu7KtaEtNiAQ/Dsd4Be6OHC/PoOffoo6u7RloXEDUW/rVDL7zu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:34', '2018-03-30 00:50:34'),
(191, 'prem_172', 'prem-172', 'prem_172', 'prem_172@gmail.com', '$2y$10$sfoEXBooc6QY7EeqAlCW6urVjwb8wrZp2loOjbBdoFf8yI9zUqgqO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:34', '2018-03-30 00:50:34'),
(192, 'prem_173', 'prem-173', 'prem_173', 'prem_173@gmail.com', '$2y$10$Zo7zMxWTtfTprjsLzXVPN.6VEU5dlBWD03mxSHO5RvPtapYl2pdTW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:34', '2018-03-30 00:50:34'),
(193, 'prem_174', 'prem-174', 'prem_174', 'prem_174@gmail.com', '$2y$10$wTnJmqPZOerR0BkOBmHBe./3ess.xkwJ9Si3lLG1RODf.NloVf5F6', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(194, 'prem_175', 'prem-175', 'prem_175', 'prem_175@gmail.com', '$2y$10$VRCrk6FPgYdx/7ZJ3B5PMu4arGdXZmPXevAwm8R/E4jlnPXexkQny', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(195, 'prem_176', 'prem-176', 'prem_176', 'prem_176@gmail.com', '$2y$10$MsjhOkj2hOqaQIjNWy0VXewvbsVEm2UgnPdTC/KkjilV7JGy5zXOC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(196, 'prem_177', 'prem-177', 'prem_177', 'prem_177@gmail.com', '$2y$10$NUTZskh2uRp/SIqpyGblhelj.7yldJxEAW7oS1wPBPWasO0wVvPwS', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(197, 'prem_178', 'prem-178', 'prem_178', 'prem_178@gmail.com', '$2y$10$8ipE2ETdmg4Z6C9OB756GOv2u8KSDt7R4uoW/Jb85/pfMsyn3Q6JK', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(198, 'prem_179', 'prem-179', 'prem_179', 'prem_179@gmail.com', '$2y$10$pzbRoEoQP9EhO2hBPbxy3eB2w8Vson.9FMNNlnmIqkKXYAOpMMC4i', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(199, 'prem_180', 'prem-180', 'prem_180', 'prem_180@gmail.com', '$2y$10$LDxeUoQOEIXxyWoHjAhVKuyS3XXqINvpUJsESTkQtDaXJQvWi1oBy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:35', '2018-03-30 00:50:35'),
(200, 'prem_181', 'prem-181', 'prem_181', 'prem_181@gmail.com', '$2y$10$pSVhmP01pOXYlqcDQbmmmeY84cNNtyKH1FtI2M/6U3QMOf/tmH3Wy', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(201, 'prem_182', 'prem-182', 'prem_182', 'prem_182@gmail.com', '$2y$10$5UkrL.hNlggr/95AumDS8.BZQln8GmTb7agow4WdECoyYkRztOtb.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(202, 'prem_183', 'prem-183', 'prem_183', 'prem_183@gmail.com', '$2y$10$C0B63qm5YrVXQNxhGSikCOw6jtQLeDwtem3j4VAJOZcO6dlBse2tm', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(203, 'prem_184', 'prem-184', 'prem_184', 'prem_184@gmail.com', '$2y$10$R34ZaLDeQx3UVAXJR2QNNecMy1gLSBbgPnZKSLra1OnVbaNMRcgU.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(204, 'prem_185', 'prem-185', 'prem_185', 'prem_185@gmail.com', '$2y$10$dMXU7LtOqgM8S5aPluYuMeCW6FiTLiDSgDx3BTZlEwlPQiJtCHzFq', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(205, 'prem_186', 'prem-186', 'prem_186', 'prem_186@gmail.com', '$2y$10$qqa4OsOQ0c8f/m0AhZoF8.dmFGmS7.6AmnK72nkoyAP4JQSl0YODW', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(206, 'prem_187', 'prem-187', 'prem_187', 'prem_187@gmail.com', '$2y$10$uQEIbrnA.68LRKPgWvY6.e0.2uZ/XPsyf6E5MCabDHYViUidJzFD.', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:36', '2018-03-30 00:50:36'),
(207, 'prem_188', 'prem-188', 'prem_188', 'prem_188@gmail.com', '$2y$10$DcqTXhOUuaZG.6zUMQBUseEOTCgkkMzbepDBUu3akzcXKQY2OW9eu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 00:50:37'),
(208, 'prem_189', 'prem-189', 'prem_189', 'prem_189@gmail.com', '$2y$10$j15BgPJx3xwCSDnS3/GTh.cszxE5HmMYvYRId762QNStG.42W8glO', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 00:50:37'),
(209, 'prem_190', 'prem-190', 'prem_190', 'prem_190@gmail.com', '$2y$10$gZW29E6sdqeUFL84ZjfJhucn9Cc3zwDt.3Hy5m9DDtOUwkYfyx1QK', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 00:50:37'),
(210, 'prem_191', 'prem-191', 'prem_191', 'prem_191@gmail.com', '$2y$10$vIUciT3j5BCRtNCcMEyTy.ZS6z8roThwN02jCef5uQGfCVSEbPUri', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 00:50:37'),
(211, 'prem_192', 'prem-192', 'prem_192', 'prem_192@gmail.com', '$2y$10$JEjFb8p9//a8JP3UH/a0vuv8.ZmnXdk.R8vh3wC242bxsjPdukCZe', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 00:50:37'),
(212, 'prem_193', 'prem-193', 'prem_193', 'prem_193@gmail.com', '$2y$10$dNhqrGLqor.qPvh8Me1blePbkKeiQaubXtaJ4CmpO7rM4pXkbZWqe', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 05:53:50'),
(213, 'prem_194', 'prem-194', 'prem_194', 'prem_194@gmail.com', '$2y$10$tS9LnMJBxmA8ZI/oayVMYeCikOr3v9fgRHoQn/kDJ4yLN7GGpK6ZC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:37', '2018-03-30 00:50:37'),
(214, 'prem_195', 'prem-195', 'prem_195', 'prem_195@gmail.com', '$2y$10$bUCPMS1F2i4J0YF5PqrqnOd6UMT904IBjykMey5JIt92AHVV2rPYa', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:38', '2018-03-30 00:50:38'),
(215, 'prem_196', 'prem-196', 'prem_196', 'prem_196@gmail.com', '$2y$10$pCCnu8v3gUEgJCvcBrqCuuhsfjfsNMDZAb1wqU/zG5bVaUxDsMLTu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:38', '2018-03-30 00:50:38'),
(216, 'prem_197', 'prem-197', 'prem_197', 'prem_197@gmail.com', '$2y$10$aheG4ZHAZgFvf9OkqVB8N.KkjOAWvcf5D0NecUKPxLLV2KCG0VPyC', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:38', '2018-03-30 05:53:48'),
(217, 'prem_198', 'prem-198', 'prem_198', 'prem_198@gmail.com', '$2y$10$KV4fQAUExThvXcR3sEY0l.tu82fGxqKB7KX/zqCaSKj6Wlqbh6oBi', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:38', '2018-03-30 05:53:46'),
(218, 'prem_199', 'prem-199', 'prem_199', 'prem_199@gmail.com', '$2y$10$oSoPrefaxNMtmXPMBvSG2.MH0Xj8neOfd2BiZhaxE8HKxlcWXE1Qu', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:38', '2018-03-30 06:33:35'),
(219, 'prem_200', 'prem-200', 'prem_200', 'prem_200@gmail.com', '$2y$10$MGHHKPrYuwcyveVV.i.23eF3O.PSXjzhjMrmVpGjIk0DG9tKY9OPa', NULL, 1, 'U', NULL, NULL, '2018-03-30 00:50:38', '2018-03-30 06:33:38'),
(220, 'prem', 'prem', 'tata@gmail.com', 'taq2ta@gmail.com', '$2y$10$aiZsYAQQC/xHOBsvzio1ze3jMonnxr4LKQDcTV2N90bawoN5LMzPe', NULL, 1, 'U', NULL, NULL, '2018-04-04 07:00:49', '2018-04-04 07:16:55'),
(221, 'prem', 'prem-singh', 'taqta@gmail.com', 'taqta@gmail.com', '$2y$10$.n6bwpmmqrjvZWnl39U4B.uk/jW/63cELJPzX44FQJqM.yeFKJZem', '15228456276314831588.jpg', 1, 'U', NULL, NULL, '2018-04-04 07:01:09', '2018-04-04 07:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `device_type` enum('ANDROID','IPHONE') DEFAULT NULL,
  `device_id` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_devices`
--

INSERT INTO `user_devices` (`id`, `user_id`, `device_type`, `device_id`, `created_at`, `updated_at`) VALUES
(20, 28, 'ANDROID', 'abcd', '2018-03-29 01:32:15', '2018-03-29 01:32:15'),
(21, 220, 'ANDROID', '3453454', '2018-04-04 07:00:49', '2018-04-04 07:00:49'),
(22, 221, 'ANDROID', '3453454', '2018-04-04 07:01:09', '2018-04-04 07:01:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delete_accounts_when_user_is_deleted` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delete_tokens_when_user_is_deleted` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `delete_accounts_when_user_is_deleted` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD CONSTRAINT `delete_tokens_when_user_is_deleted` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
