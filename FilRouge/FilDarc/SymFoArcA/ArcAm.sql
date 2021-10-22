-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 22 oct. 2021 à 12:01
-- Version du serveur :  10.3.31-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ArcAm`
--
CREATE DATABASE IF NOT EXISTS `ArcAm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ArcAm`;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211001093856', '2021-10-01 11:40:21', 30),
('DoctrineMigrations\\Version20211004134259', '2021-10-04 15:45:11', 97),
('DoctrineMigrations\\Version20211004145349', '2021-10-04 16:53:58', 213),
('DoctrineMigrations\\Version20211005070140', '2021-10-05 09:01:56', 76),
('DoctrineMigrations\\Version20211006121858', '2021-10-06 14:19:13', 19),
('DoctrineMigrations\\Version20211007073147', '2021-10-07 09:32:01', 18),
('DoctrineMigrations\\Version20211008094921', '2021-10-08 11:49:31', 32),
('DoctrineMigrations\\Version20211012140702', '2021-10-12 16:07:35', 83);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `required_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `ship_via` int(11) DEFAULT NULL,
  `freight` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `ship_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_region` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationorders_id` int(11) NOT NULL,
  `customer_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `unit_price` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `quantity` smallint(6) NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 0,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity_per_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `units_in_stock` smallint(6) NOT NULL DEFAULT 0,
  `units_on_order` smallint(6) NOT NULL DEFAULT 0,
  `reorder_level` smallint(6) NOT NULL DEFAULT 0,
  `discontinued` tinyint(1) NOT NULL DEFAULT 0,
  `supplier_id_id` int(11) DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `quantity_per_unit`, `unit_price`, `units_in_stock`, `units_on_order`, `reorder_level`, `discontinued`, `supplier_id_id`, `picture`) VALUES
(1, 'HOYT PREVAIL 40 X3 2017', 1, 'L\'arc à poulie le plus abouti de chez HOYT avec une géométrie améliorant la performance. Cames optimisées pour la vitesse et la performance au travers de leur longueur de tirage.', '1350.0000', 2, 0, 1, 0, 1, '1.jpeg'),
(96, 'Produit Test 2', 1, '5', '666.0000', 3, 2, 1, 1, 1, '96.jpeg'),
(97, 'Produit Test 3', 2, '10', '33.0000', 5, 0, 5, 1, 1, '97.jpeg'),
(98, 'Produit Test 4', 3, '1222', '25.0000', 5, 1, 3, 1, 1, '98.jpeg'),
(99, 'Core PULSE', 1, 'Arc débutant parfait pour l\'initiation. Avec viseur, 3 flèches, fausse corde, sacoche, protège bras et repose flèche.', '59.9000', 10, 0, 4, 1, 1, '99.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_page` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `contact_name`, `contact_title`, `address`, `city`, `region`, `postal_code`, `country`, `phone`, `fax`, `home_page`) VALUES
(1, 'ACME', 'BugsBunny', 'Rabbit', 'Trou du champ.', 'Tex Avery', NULL, '06200', 'FR', '0615231436', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'boyerhenri@sfr.fr', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$qUUuvk6L9fmKll4SCInBAQ$rGd8/8drLWJKlmHZYooYkqQfLyesRC2+sZ/srZesuv0'),
(2, 'batman@asylum.fr', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$fOQcAVmWXA/8/bY60Gho0g$3CWbzzFqnRN0kNtLuWNsYnDtI+TMjhw6iFKCc4Nf3Oo'),
(3, 'superman@sfr.fr', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Jf1Xdd6XDVuHsAuQo2+utw$SBaCTFck1JpfXI9/6jgd0LOYQat23ql5upErz/+aYIY'),
(5, 'pute@borgne.fr', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$UrTuquYREyty8xYGzqcW1A$0qKS6G/40hgUvJ6lG1vliYB8tdP7zLU8NZi2bq8U8kI');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEEC625E50E` (`relationorders_id`),
  ADD KEY `IDX_E52FFDEEB171EB6C` (`customer_id_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1DE18E50B` (`product_id_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5AA65F9C7D` (`supplier_id_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEB171EB6C` FOREIGN KEY (`customer_id_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `FK_E52FFDEEC625E50E` FOREIGN KEY (`relationorders_id`) REFERENCES `order_details` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1DE18E50B` FOREIGN KEY (`product_id_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5AA65F9C7D` FOREIGN KEY (`supplier_id_id`) REFERENCES `suppliers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
