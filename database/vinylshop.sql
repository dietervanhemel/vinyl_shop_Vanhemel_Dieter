-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 02 jan 2020 om 18:41
-- Serverversie: 5.7.27-0ubuntu0.18.04.1
-- PHP-versie: 7.3.8-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vinylshop`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'pop/rock', '2019-12-29 18:23:45', NULL),
(2, 'punk', '2019-12-29 18:23:45', NULL),
(3, 'industrial', '2019-12-29 18:23:45', NULL),
(5, 'new wave', '2019-12-29 18:23:45', NULL),
(7, 'reggae', '2019-12-29 18:23:45', NULL),
(12, 'noise', '2019-12-29 18:23:45', NULL),
(14, 'techno', '2019-12-29 18:23:45', NULL),
(17, 'soul', '2019-12-29 18:23:45', NULL),
(18, 'test', '2019-12-30 23:00:09', '2019-12-30 23:00:09'),
(23, 'test10', '2019-12-31 01:40:15', '2019-12-31 01:40:15');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_29_162559_create_genres_table', 1),
(4, '2019_12_29_162630_create_records_table', 1),
(5, '2019_12_29_162638_create_orders_table', 1),
(6, '2019_12_29_162646_create_orderlines_table', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orderlines`
--

CREATE TABLE `orderlines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `artist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalPrice` double(6,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `totalPrice` double(6,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `records`
--

CREATE TABLE `records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED NOT NULL,
  `artist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist_mbid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_mbid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(5,2) NOT NULL DEFAULT '19.99',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `records`
--

INSERT INTO `records` (`id`, `genre_id`, `artist`, `artist_mbid`, `title`, `title_mbid`, `cover`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 'Queen', '0383dadf-2a4e-4d10-a46a-e9e041da8eb3', 'Greatest Hits', 'fcb78d0d-8067-4b93-ae58-1e4347e20216', NULL, 19.99, 1, '2019-12-29 18:23:45', NULL),
(2, 1, 'The Rolling Stones', 'b071f9fa-14b0-4217-8e97-eb41da73f598', 'Sticky Fingers', 'd883e644-5ec0-4928-9ccd-fc78bc306a46', NULL, 21.00, 1, '2019-12-29 18:23:45', NULL),
(3, 1, 'The Beatles', 'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d', 'Abbey Road', 'd6010be3-98f8-422c-a6c9-787e2e491e58', NULL, 24.99, 0, '2019-12-29 18:23:45', NULL),
(4, 1, 'The Who', '9fdaa16b-a6c4-4831-b87c-bc9ca8ce7eaa', 'Tommy', 'fceaca05-a210-4f92-9e88-1e8b44ec8e37', NULL, 12.50, 3, '2019-12-29 18:23:45', NULL),
(5, 1, 'Fleetwood Mac', 'bd13909f-1c29-4c27-a874-d4aaf27c5b1a', 'Rumours', '081ea37e-db59-4332-8cd2-ad020cb93af6', NULL, 19.99, 1, '2019-12-29 18:23:45', NULL),
(6, 1, 'David Bowie', '5441c29d-3602-4898-b1a1-b77fa23b8e50', '\"Heroes\"', 'f0a4ed57-10e0-4c37-81b4-36311dc7d4b6', NULL, 19.99, 0, '2019-12-29 18:23:45', NULL),
(7, 1, 'David Bowie', '5441c29d-3602-4898-b1a1-b77fa23b8e50', 'The Rise and Fall of Ziggy Stardust and the Spiders From Mars', '7dc5edce-ead6-41e4-9c4b-240223c9bab0', NULL, 24.99, 3, '2019-12-29 18:23:45', NULL),
(8, 1, 'Steve Harley & Cockney Rebel', '9a07b4ae-7c2f-4473-b019-c63c3d5db45c', 'The Psychomodo', '88776dcc-072e-4072-bc25-8b970a3f055e', 'https://coverartarchive.org/release/4650b4c9-6cc2-4139-a46d-58b9f40a697b/front-250.jpg', 9.99, 1, '2019-12-29 18:23:45', NULL),
(9, 1, 'Roxy Music', '331ce348-1b08-40b9-8ed7-0763b92bd003', 'Siren', 'c2dad882-7804-416d-980e-d06b8405e9cf', NULL, 24.00, 4, '2019-12-29 18:23:45', NULL),
(10, 3, 'Ministry', '7a18b986-afcc-359c-add1-7aa3a79104a2', 'The Land of Rape and Honey', '4bcaf5b9-76ba-4891-934b-1a441c62b008', 'https://coverartarchive.org/release/8fc6c9e6-5541-39de-b1e6-67157bc75646/10665793150-250.jpg', 19.99, 4, '2019-12-29 18:23:45', NULL),
(11, 3, 'Front 242', '8fb6c00f-61d8-4f27-98f9-53e1ba481626', 'Front by Front', '97508279-e7d3-4303-8f2a-483119ce41c7', 'https://coverartarchive.org/release/feaf508a-ef4d-4680-8bf0-0f92bcf35048/6564772390-250.jpg', 16.49, 2, '2019-12-29 18:23:45', NULL),
(12, 3, 'Nine Inch Nails', 'b7ffd2af-418f-4be2-bdd1-22f8b48613da', 'Pretty Hate Machine', '8f156938-6462-3b3e-84ba-bfc7dd232c34', NULL, 25.00, 3, '2019-12-29 18:23:45', NULL),
(13, 3, 'Einstürzende Neubauten', '6e9ac29b-798c-4af7-8d9e-55cdc72a999c', 'Halber Mensch', '94b93f48-6357-49fd-affa-7c07db1f131b', NULL, 14.00, 0, '2019-12-29 18:23:45', NULL),
(14, 5, 'The Police', '9e0e2b01-41db-4008-bd8b-988977d6019a', 'Outlandos d\'Amour', 'e07a2c71-dde7-37a3-8b02-44d25dd128f9', NULL, 19.99, 5, '2019-12-29 18:23:45', NULL),
(15, 5, 'Japan', '697e7111-5630-4c77-83f3-39821bacc61a', 'Oil on Canvas', 'a7472800-543f-44a1-a299-7bd07b80e9a8', 'https://coverartarchive.org/release/80910883-e38d-48b3-b1dc-8e36365e94d8/10519153003-250.jpg', 9.99, 2, '2019-12-29 18:23:45', NULL),
(16, 5, 'The Cure', '69ee3720-a7cb-4402-b48d-a02c366f2bcf', 'Disintegration', '11af85e2-c272-4c59-a902-47f75141dc97', NULL, 26.00, 4, '2019-12-29 18:23:45', NULL),
(17, 5, 'Talking Heads', 'a94a7155-c79d-4409-9fcf-220cb0e4dc3a', 'Stop Making Sense', '5f4ad828-bb45-4867-9ae9-295cfe22449d', NULL, 9.90, 2, '2019-12-29 18:23:45', NULL),
(18, 2, 'Sex Pistols', 'e5db18cb-4b1f-496d-a308-548b611090d3', 'Never Mind the Bollocks', '11c6c574-6442-45f8-9c25-110675725f2f', NULL, 15.00, 1, '2019-12-29 18:23:45', NULL),
(19, 2, 'The Clash', '8f92558c-2baa-4758-8c38-615519e9deda', 'London Calling', '7bec22a0-eb73-4b79-a619-b253d5c2af87', NULL, 11.99, 1, '2019-12-29 18:23:45', NULL),
(20, 12, 'Atari Teenage Riot', 'fe404dd9-09b2-4ac8-a0e5-8da1c4027061', 'The Future of War', 'fcba15e2-3d1e-40b3-996c-be22450bda82', 'https://coverartarchive.org/release/aeaef39a-879d-41d1-8f6e-298cbee17771/21867740528-250.jpg', 21.50, 2, '2019-12-29 18:23:45', NULL),
(21, 12, 'Sonic Youth', '5cbef01b-cc35-4f52-af7b-d0df0c4f61b9', 'EVOL', '22079997-d0d3-449a-83e0-e8ac1942740f', NULL, 24.99, 3, '2019-12-29 18:23:45', NULL),
(22, 2, 'H₂O', '7dceb9fe-9c4f-41d8-8528-4c6bf529f919', 'Nothing to Prove', '60464f78-9697-4458-adfd-0e2a0109c9f5', 'https://coverartarchive.org/release/52937b1d-9124-4116-af39-f650ebacdd84/front-250.jpg', 18.99, 5, '2019-12-29 18:23:45', NULL),
(23, 2, 'Turnstile', '7b748dac-f5ce-45a7-9b95-c1d8b5b013ed', 'Time & Space', '36a6b0c0-24d3-4cae-9e7c-96ba0da9a331', 'https://coverartarchive.org/release/c05b7ae0-dab4-46b4-a5f8-2e7510eba1fb/front-250.jpg', 24.99, 5, '2019-12-29 18:23:45', NULL),
(25, 2, 'Off With Their Heads', '552eb96a-7e91-439d-82d2-099804b75939', 'Home', 'ae6938f1-a7a1-4864-892e-778e27f17426', NULL, 15.99, 1, '2019-12-29 18:23:45', NULL),
(26, 2, 'Social Distortion', 'e1e05cce-3922-44e1-8f20-015abe5e309d', 'Somewhere Between Heaven and Hell', '68f75281-39f2-43fc-a63a-76a8854c777c', NULL, 15.99, 2, '2019-12-29 18:23:45', NULL),
(27, 7, 'Bob Marley & The Wailers', 'c296e10c-110a-4103-9e77-47bfebb7fb2e', 'Uprising', '62ed2ddd-498c-4d93-9b8c-d352d38e9ea9', 'https://coverartarchive.org/release/ab20031f-200c-44e8-88fb-4fca32ecbf38/front-250.jpg', 29.99, 3, '2019-12-29 18:23:45', NULL),
(30, 2, 'Suicidal Tendencies', 'e9e2a634-984f-4c10-bf7b-7970179e1ef1', 'Join the Army', '6c5e4cc7-9955-4281-a017-463be6e71b09', 'https://coverartarchive.org/release/439148c3-0e6a-3f3d-81f3-fea3d09e5280/front-250.jpg', 14.99, 1, '2019-12-29 18:23:45', NULL),
(31, 2, 'Cock Sparrer', 'bbcc9824-31c0-4c70-a7af-d24090ea161e', 'Forever', '4171be5b-6904-40de-b1f7-07c73bbb6690', NULL, 17.50, 4, '2019-12-29 18:23:45', NULL),
(32, 2, 'SNFU', 'ca94290f-d456-4091-9fc4-fa83512f544f', 'The One Voted Most Likely to Succeed', 'fcaf21bb-915c-34bb-ab08-abb35588746f', NULL, 17.50, 0, '2019-12-29 18:23:45', NULL),
(33, 2, 'Descendents', 'f035837e-4117-438d-a524-cacf43500e68', 'Milo Goes to College', '72837739-550b-3a21-8d7a-3bb898562b6a', NULL, 32.50, 2, '2019-12-29 18:23:45', NULL),
(34, 7, 'Peter Tosh', '7db6aae5-6644-4513-9bfc-ca2e79d4469c', 'Mama Africa', '38d30631-9341-4e62-9d10-2cd372b3e0f4', NULL, 22.50, 1, '2019-12-29 18:23:45', NULL),
(35, 1, 'The Doors', '9efff43b-3b29-4082-824e-bc82f646f93d', 'L.A. Woman', 'e68f23df-61e3-4264-bfc3-17ac3a6f856b', NULL, 21.99, 5, '2019-12-31 02:04:09', '2019-12-31 02:04:09'),
(37, 2, 'Ramones', 'd6ed7887-a401-47a8-893c-34b967444d26', 'End of the Century', '58dcd354-a89a-48ea-9e6e-e258cb23e11d', 'https://cdn.shopify.com/s/files/1/0068/0042/products/ETH6077C-LP_250x.jpg', 19.90, 4, '2019-12-31 02:18:00', '2019-12-31 02:50:17');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `active`, `admin`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Jane Doe', 'jane.doe@example.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$ShcEwlk7enuqPlPn9QkKaujMXlBo8OF0eFE3KPFWe2IHF7BRcbrou', NULL, '2019-12-29 18:23:42', NULL),
(3, 'ITF User 0', 'itf_user_0@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$HDv77zURONxB978f1NJfTuTCyxj821YgJJJgDyFEqSph5d8Vv0.kW', NULL, '2019-12-29 18:23:42', NULL),
(4, 'ITF User 1', 'itf_user_1@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$NGW8PNDT5mnsaF0OAUfkkeBhmYQX6bzW2qENxwSE9jYfmi7TJUEPC', NULL, '2019-12-29 18:23:42', NULL),
(5, 'ITF User 2', 'itf_user_2@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$i02DLQxw1l3ytzwvMD/rpeucY8uLISh3984ilXjo3pvRFM5SBe/cG', NULL, '2019-12-29 18:23:42', NULL),
(6, 'ITF User 3', 'itf_user_3@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$loLeSNdpJh/DQsOis1wEfOxtweSCraYObFcOh0GttwU.ws05JCuyC', NULL, '2019-12-29 18:23:42', NULL),
(7, 'ITF User 4', 'itf_user_4@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$y3VJFY2bmCdemnES4BaZ3uQSmx6cFn646blNKvJm06Ei2BFaLZHbi', NULL, '2019-12-29 18:23:42', NULL),
(8, 'ITF User 5', 'itf_user_5@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$coRVS5Txsx0WsE5ef6gTgu5TbBfQYOvVxGMoKbicKZUtHP0lwWdlS', NULL, '2019-12-29 18:23:42', NULL),
(9, 'ITF User 6', 'itf_user_6@mailinator.com', 1, 0, '2019-12-29 18:23:42', '$2y$10$XrqobT7JFTJ6UjEBmGgR8.sM37o.KgpOuIX2TuFygK2fJy071kN1q', NULL, '2019-12-29 18:23:42', NULL),
(10, 'ITF User 7', 'itf_user_7@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$/YoshAYwcPOWYDGB5I5u4uq2SnDyoYq.JPQvR0ZVDBwMzz3NglHg2', NULL, '2019-12-29 18:23:43', NULL),
(11, 'ITF User 8', 'itf_user_8@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$53nIR2..v/TAraRooTr/O..K48ehm9fnEsdp.qFD1xpSOnz33Seh6', NULL, '2019-12-29 18:23:43', NULL),
(12, 'ITF User 9', 'itf_user_9@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$tlwMeZzgymTgrT0m/5lbweO0jepyAd2OQ1N.Y2MW2U/1OaMWxHM36', NULL, '2019-12-29 18:23:43', NULL),
(13, 'ITF User 10', 'itf_user_10@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$Oqb8HrTeC0oUR4eQ68rtX.7al/D7Uwjo2DkY9ArRbPJ/62VtsGStW', NULL, '2019-12-29 18:23:43', NULL),
(14, 'ITF User 11', 'itf_user_11@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$KFYarjzKnXQQzrVV8OPplujCh5QIUWNyMMJG9w6RuVZnURMZq8ilu', NULL, '2019-12-29 18:23:43', NULL),
(15, 'ITF User 12', 'itf_user_12@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$FppTqmTts5apwOAdm5AXmeqr0BoyvfDc6ak35z5lgwwqxsvqU8/CS', NULL, '2019-12-29 18:23:43', NULL),
(16, 'ITF User 13', 'itf_user_13@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$l5sREaSk7nMiuDWTYPNFge0ULjMMCH2guesHQX/MQq18ePc.rAipq', NULL, '2019-12-29 18:23:43', NULL),
(17, 'ITF User 14', 'itf_user_14@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$jzai.syiHxuJ/vttUbREiuMjF5pD4eMXn77VMBtdiHo43ihou9Mhq', NULL, '2019-12-29 18:23:43', NULL),
(18, 'ITF User 15', 'itf_user_15@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$L/CcI96iDmrf4zeEvz2u7OtUeD8MIT6sFM3Lt6LuK3oeboO85XrJa', NULL, '2019-12-29 18:23:43', NULL),
(19, 'ITF User 16', 'itf_user_16@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$S04od/HLf2kxG8FTgO.5aeMQvilZUgRfKLAbPVefHgZ8Hqp2PTYQW', NULL, '2019-12-29 18:23:43', NULL),
(20, 'ITF User 17', 'itf_user_17@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$CYw1rbjQks4YAvXPWe/...D6zUWjgiN0GPkesKDMELm4DOrOuqebm', NULL, '2019-12-29 18:23:43', NULL),
(21, 'ITF User 18', 'itf_user_18@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$BB1nxdert64/GxiBqj8uSuN7FQYnAYKJLUZeVZ.DEIXM7bhP7uzq2', NULL, '2019-12-29 18:23:43', NULL),
(22, 'ITF User 19', 'itf_user_19@mailinator.com', 1, 0, '2019-12-29 18:23:43', '$2y$10$idNQPgOTXogkmvewTXNuI.kX9nvnXXarKMN0RrJiOAcnTAz.Z.I1u', NULL, '2019-12-29 18:23:43', NULL),
(23, 'ITF User 20', 'itf_user_20@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$BBMRtNcvTzokOVQxU2dI9.Bl42RSZcCL6E7KJb8fmrUt5EA14i3cO', NULL, '2019-12-29 18:23:44', NULL),
(24, 'ITF User 21', 'itf_user_21@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$6qCKQ2ssRUq183K7Gr5PJ.P3a/m4HVdp73.hQTWVjW33SdtHZqqV.', NULL, '2019-12-29 18:23:44', NULL),
(25, 'ITF User 22', 'itf_user_22@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$H.40USDFUQ14kmld3RVo.OaI84k.bzN9av1OQLnzQn2Aebscb6qdG', NULL, '2019-12-29 18:23:44', NULL),
(26, 'ITF User 23', 'itf_user_23@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$l4E0R.KeKk8y.xHfqrH9S.0tr0Q6ollrr6NUGRJoKYiK/5G7jOSEi', NULL, '2019-12-29 18:23:44', NULL),
(27, 'ITF User 24', 'itf_user_24@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$bMz2WBjESmxd23Q2Ia0VKujFgGRZzB1gHpxFQ6ZHNA1SfEBBPisnC', NULL, '2019-12-29 18:23:44', NULL),
(28, 'ITF User 25', 'itf_user_25@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$6k.lPzX.8L5poBfWZWF51ejP9YW2wEwgB9zr4He04mwU0c8tRWN2a', NULL, '2019-12-29 18:23:44', NULL),
(29, 'ITF User 26', 'itf_user_26@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$smqhEUPA2MhJg8deQVNC5OqB/B/4sUySi1DaA7NUAQl8C8nw0LaUC', NULL, '2019-12-29 18:23:44', NULL),
(30, 'ITF User 27', 'itf_user_27@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$ctMhdVPcO7ae9R8nuoBANePb1OwBSxidR9pWMRsxeYcZgkuL0Ksl.', NULL, '2019-12-29 18:23:44', NULL),
(31, 'ITF User 28', 'itf_user_28@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$zTUbSByFjipCQK/aGm1WLODsqvLM8f5XkWf9mXp1qI8bW6g8qaMN.', NULL, '2019-12-29 18:23:44', NULL),
(32, 'ITF User 29', 'itf_user_29@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$k4yKguLcHt..RBeWOZ9HquEMfp5aIqbr7r1GFcIFB6MzNnBQtPO86', NULL, '2019-12-29 18:23:44', NULL),
(33, 'ITF User 30', 'itf_user_30@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$ikKkp0Sp87RmPE35NaIFnuDb/O3Fb/kwK/Orz/BqX02SeKUgC0bz6', NULL, '2019-12-29 18:23:44', NULL),
(34, 'ITF User 31', 'itf_user_31@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$rsUKvXMSgLTPZg8E/xRsuu.81eOz.9Mn22bM9.K4O97fK.bhJ40Vm', NULL, '2019-12-29 18:23:44', NULL),
(35, 'ITF User 32', 'itf_user_32@mailinator.com', 1, 0, '2019-12-29 18:23:44', '$2y$10$yoQNKeo1Ee1ARCGwZnFLV.HjPpRlHdQUp6z72RM2UZ/3hipRJcgVC', NULL, '2019-12-29 18:23:44', NULL),
(36, 'ITF User 33', 'itf_user_33@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$oFAmHkhX5KQPDXk.Qlworuk27z6iT3S6Y/6xDcqaS89.2OSlL.RxS', NULL, '2019-12-29 18:23:45', NULL),
(37, 'ITF User 34', 'itf_user_34@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$6i.kRFKQsmjYEOrSYoiUeOauPggk3eAMcdT.VDtFKf.nB170XmFMK', NULL, '2019-12-29 18:23:45', NULL),
(38, 'ITF User 35', 'itf_user_35@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$es3juEBGBTUI3cPHwBEkRurZEbadQkPcY1JyyBrnz5pZSsByEgSY.', NULL, '2019-12-29 18:23:45', NULL),
(39, 'ITF User 36', 'itf_user_36@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$3BprnF08JhN.rxUwrWPDM.wmkXY5Qj7DhjYNBtJOM.3hsWmHoV0S2', NULL, '2019-12-29 18:23:45', NULL),
(40, 'ITF User 37', 'itf_user_37@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$dbLj2flYXzwl79f.StL9xegWkFdHwlDouBCi3fNDGiIPduuYBjVP6', NULL, '2019-12-29 18:23:45', NULL),
(41, 'ITF User 38', 'itf_user_38@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$ho2neuyo92dol7U3qndF6.QB1DK2kymuPNGbgNfl9tfgDrcjF5FyO', NULL, '2019-12-29 18:23:45', NULL),
(42, 'ITF User 39', 'itf_user_39@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$W8oSisdQzhkpQVcSuz/PlOWA2DKkRsad47FxJsSEiEmVSmKxmY4E.', NULL, '2019-12-29 18:23:45', NULL),
(43, 'ITF User 40', 'itf_user_40@mailinator.com', 1, 0, '2019-12-29 18:23:45', '$2y$10$xP3zU/leZ3TotK3TtRthoexb6Fl19WqrdBiwN2AVRWqs7Zdrs/1Yi', NULL, '2019-12-29 18:23:45', NULL),
(44, 'Dieter Vanhemel', 'r0670539@student.thomasmore.be', 1, 1, NULL, '$2y$10$86v6E00iwEwuX6H9TUH23OtHYQkiUDcrESVIE1.AS2Re3kNvIHU5i', NULL, '2020-01-02 18:34:26', '2020-01-02 18:34:26');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `orderlines`
--
ALTER TABLE `orderlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderlines_order_id_foreign` (`order_id`);

--
-- Indexen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexen voor tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexen voor tabel `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `records_genre_id_foreign` (`genre_id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT voor een tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `orderlines`
--
ALTER TABLE `orderlines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `records`
--
ALTER TABLE `records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `orderlines`
--
ALTER TABLE `orderlines`
  ADD CONSTRAINT `orderlines_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
