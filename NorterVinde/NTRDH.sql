-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 13 oct. 2021 à 14:31
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
-- Base de données : `NTRDH`
--
CREATE DATABASE IF NOT EXISTS `NTRDH` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `NTRDH`;

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
  `quantity_per_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'Chai CHIN', 1, '10', '100.0000', 39, 0, 10, 1, 1, NULL),
(2, 'Chang', 1, '24 - 12 oz bottles', '19.0000', 17, 40, 25, 0, 1, NULL),
(3, 'Aniseed Syrup', 2, '12 - 550 ml bottles', '10.0000', 13, 70, 25, 1, 1, NULL),
(4, 'd', 2, '48 - 6 oz jars', '22.0000', 53, 0, 0, 1, 2, NULL),
(5, 'Chef Anton\'s Gumbo Mix', 2, '36 boxes', '21.3500', 0, 0, 0, 1, 2, NULL),
(6, 'ccc', 2, 'ddd8 oz jars', '25.0000', 120, 0, 25, 1, 3, NULL),
(7, 'abc', 7, '123', '100.0000', 15, 0, 10, 1, 3, NULL),
(8, 'Northwoods Cranberry Sauce', 2, '12 - 12 oz jars', '40.0000', 6, 0, 0, 0, 3, NULL),
(9, 'Mishi Kobe Niku', 6, '18 - 500 g pkgs.', '97.0000', 29, 0, 0, 1, 4, NULL),
(10, 'Ikura', 8, '12 - 200 ml jars', '31.0000', 31, 0, 0, 0, 4, NULL),
(11, 'Queso Cabrales', 4, '2 l', '21.0000', 22, 30, 30, 1, 5, NULL),
(12, 'Queso Manchego La Pastora', 4, '10 - 500 g pkgs.', '38.0000', 86, 0, 0, 0, 5, NULL),
(13, 'Konbu', 8, '2 kg box', '6.0000', 24, 0, 5, 1, 6, NULL),
(14, 'Tofu', 7, '40 - 100 g pkgs.', '23.2500', 35, 0, 0, 0, 6, NULL),
(15, 'Genen Shouyu', 2, '24 - 250 ml bottles', '15.5000', 39, 0, 5, 1, 6, NULL),
(16, 'Pavlova', 3, '32 - 500 g boxes', '17.4500', 29, 0, 10, 0, 7, NULL),
(17, 'Alice Mutton', 6, '20 - 1 kg tins', '39.0000', 0, 0, 0, 1, 7, NULL),
(18, 'Carnarvon Tigers', 8, '16 kg pkg.', '62.5000', 42, 0, 0, 0, 7, NULL),
(19, 'Teatime Chocolate Biscuits', 3, '10 boxes x 12 pieces', '9.2000', 25, 0, 5, 0, 8, NULL),
(20, 'Sir Rodney\'s Marmalade', 3, '30 gift boxes', '81.0000', 40, 0, 0, 0, 8, NULL),
(21, 'Sir Rodney\'s Scones', 3, '24 pkgs. x 4 pieces', '10.0000', 3, 40, 5, 0, 8, NULL),
(22, 'Gustaf\'s Knckebrd', 5, '24 - 500 g pkgs.', '21.0000', 104, 0, 25, 0, 9, NULL),
(23, 'Tunnbrd', 5, '12 - 250 g pkgs.', '9.0000', 61, 0, 25, 0, 9, NULL),
(24, 'Guaran Fantstica', 1, '12 - 355 ml cans', '4.5000', 20, 0, 0, 1, 10, NULL),
(25, 'NuNuCa Nu-Nougat-Creme', 3, '20 - 450 g glasses', '14.0000', 76, 0, 30, 0, 11, NULL),
(26, 'Gumbr Gummibrchen', 3, '100 - 250 g bags', '31.2300', 15, 0, 0, 0, 11, NULL),
(27, 'Schoggi Schokolade', 3, '100 - 100 g pieces', '43.9000', 49, 0, 30, 0, 11, NULL),
(28, 'Rssle Sauerkraut', 7, '25 - 825 g cans', '45.6000', 26, 0, 0, 1, 12, NULL),
(29, 'Thringer Rostbratwurst', 6, '50 bags x 30 sausgs.', '123.7900', 0, 0, 0, 1, 12, NULL),
(30, 'Nord-Ost Matjeshering', 8, '10 - 200 g glasses', '25.8900', 10, 0, 15, 0, 13, NULL),
(31, 'Gorgonzola Telino', 4, '12 - 100 g pkgs', '12.5000', 0, 70, 20, 0, 14, NULL),
(32, 'Mascarpone Fabioli', 4, '24 - 200 g pkgs.', '32.0000', 9, 40, 25, 0, 14, NULL),
(33, 'Geitost', 4, '500 g', '2.5000', 112, 0, 20, 0, 15, NULL),
(34, 'Sasquatch Ale', 1, '24 - 12 oz bottles', '14.0000', 111, 0, 15, 0, 16, NULL),
(35, 'Steeleye Stout', 1, '24 - 12 oz bottles', '18.0000', 20, 0, 15, 0, 16, NULL),
(36, 'Inlagd Sill', 8, '24 - 250 g  jars', '19.0000', 112, 0, 20, 0, 17, NULL),
(37, 'Gravad lax', 8, '12 - 500 g pkgs.', '26.0000', 11, 50, 25, 0, 17, NULL),
(38, 'Cte de Blaye', 1, '12 - 75 cl bottles', '263.5000', 17, 0, 15, 0, 18, NULL),
(39, 'Chartreuse verte', 1, '750 cc per bottle', '18.0000', 69, 0, 5, 0, 18, NULL),
(40, 'Boston Crab Meat', 8, '24 - 4 oz tins', '18.4000', 123, 0, 30, 0, 19, NULL),
(41, 'Jack\'s New England Clam Chowder', 8, '12 - 12 oz cans', '9.6500', 85, 0, 10, 0, 19, NULL),
(42, 'Singaporean Hokkien Fried Mee', 5, '32 - 1 kg pkgs.', '14.0000', 26, 0, 0, 1, 20, NULL),
(43, 'Ipoh Coffee', 1, '16 - 500 g tins', '46.0000', 17, 10, 25, 0, 20, NULL),
(44, 'Gula Malacca', 2, '20 - 2 kg bags', '19.4500', 27, 0, 15, 0, 20, NULL),
(45, 'Rogede sild', 8, '1k pkg.', '9.5000', 5, 70, 15, 0, 21, NULL),
(46, 'Spegesild', 8, '4 - 450 g glasses', '12.0000', 95, 0, 0, 0, 21, NULL),
(47, 'Zaanse koeken', 3, '10 - 4 oz boxes', '9.5000', 36, 0, 0, 0, 22, NULL),
(48, 'Chocolade', 3, '10 pkgs.', '12.7500', 15, 70, 25, 0, 22, NULL),
(49, 'Maxilaku', 3, '24 - 50 g pkgs.', '20.0000', 10, 60, 15, 0, 23, NULL),
(50, 'Valkoinen suklaa', 3, '12 - 100 g bars', '16.2500', 65, 0, 30, 0, 23, NULL),
(51, 'Manjimup Dried Apples', 7, '50 - 300 g pkgs.', '53.0000', 20, 0, 10, 0, 24, NULL),
(52, 'Filo Mix', 5, '16 - 2 kg boxes', '7.0000', 38, 0, 25, 0, 24, NULL),
(53, 'Perth Pasties', 6, '48 pieces', '32.8000', 0, 0, 0, 1, 24, NULL),
(54, 'Tourtire', 6, '16 pies', '7.4500', 21, 0, 10, 0, 25, NULL),
(55, 'Pt chinois', 6, '24 boxes x 2 pies', '24.0000', 115, 0, 20, 0, 25, NULL),
(56, 'Gnocchi di nonna Alice', 5, '24 - 250 g pkgs.', '38.0000', 21, 10, 30, 0, 26, NULL),
(57, 'Ravioli Angelo', 5, '24 - 250 g pkgs.', '19.5000', 36, 0, 20, 0, 26, NULL),
(58, 'Escargots de Bourgogne', 8, '24 pieces', '13.2500', 62, 0, 20, 0, 27, NULL),
(59, 'Raclette Courdavault', 4, '5 kg pkg.', '55.0000', 79, 0, 0, 0, 28, NULL),
(60, 'Camembert Pierrot', 4, '15 - 300 g rounds', '34.0000', 19, 0, 0, 0, 28, NULL),
(61, 'Sirop d\'rable', 2, '24 - 500 ml bottles', '28.5000', 113, 0, 25, 0, 29, NULL),
(62, 'Tarte au sucre', 3, '48 pies', '49.3000', 17, 0, 0, 0, 29, NULL),
(63, 'Vegie-spread', 2, '15 - 625 g jars', '43.9000', 24, 0, 5, 0, 7, NULL),
(64, 'Wimmers gute Semmelkndel', 5, '20 bags x 4 pieces', '33.2500', 22, 80, 30, 0, 12, NULL),
(65, 'Louisiana Fiery Hot Pepper Sauce', 2, '32 - 8 oz bottles', '21.0500', 76, 0, 0, 0, 2, NULL),
(66, 'Louisiana Hot Spiced Okra', 2, '24 - 8 oz jars', '17.0000', 4, 100, 20, 0, 2, NULL),
(67, 'Laughing Lumberjack Lager', 1, '24 - 12 oz bottles', '14.0000', 52, 0, 10, 0, 16, NULL),
(68, 'Scottish Longbreads', 3, '10 boxes x 8 pieces', '12.5000', 6, 10, 15, 0, 8, NULL),
(69, 'Gudbrandsdalsost', 4, '10 kg pkg.', '36.0000', 26, 0, 15, 0, 15, NULL),
(70, 'Outback Lager', 1, '24 - 355 ml bottles', '15.0000', 15, 10, 30, 0, 7, NULL),
(71, 'Flotemysost', 4, '10 - 500 g pkgs.', '21.5000', 26, 0, 0, 0, 15, NULL),
(72, 'Mozzarella di Giovanni', 4, '24 - 200 g pkgs.', '34.8000', 14, 0, 0, 0, 14, NULL),
(73, 'Rd Kaviar', 8, '24 - 150 g jars', '15.0000', 101, 0, 5, 0, 17, NULL),
(74, 'Longlife Tofu', 7, '5 kg pkg.', '10.0000', 4, 20, 5, 0, 4, NULL),
(75, 'Rhnbru Klosterbier', 1, '24 - 0.5 l bottles', '7.7500', 125, 0, 25, 0, 12, NULL),
(76, 'Lakkalikri', 1, '500 ml', '18.0000', 57, 0, 20, 0, 23, NULL),
(77, 'Original Frankfurter grne Soe', 2, '12 boxes', '13.0000', 32, 0, 15, 0, 12, NULL),
(80, 'Jeremy2', 1, '2 x 4 Boxers', '1.0000', 1, 1, 1, 1, 1, NULL),
(81, 'Henry II', 2, '4', '750.0000', 1, 1, 1, 1, 5, NULL),
(83, 'Paul', 3, '2', '200.0000', 5, 2, 1, 0, 13, NULL),
(84, 'Barbecue', 5, '3', '100.0000', 100, 5, 3, 1, 1, ''),
(85, 'Xaviier éé', 1, '1', '0.0500', 1, 1, 1, 1, 6, NULL),
(86, 'Ailton', 4, '1', '0.2500', 200, 1, 10, 1, 14, NULL),
(88, 'vv', 10, '5', '10.0000', 10, 10, 10, 1, 1, NULL);

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
(1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#'),
(3, 'Grandma Kelly\'s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL),
(4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai\r\nMusashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL),
(5, 'Cooperativa de Quesos \'Las Cabras\'', 'Antonio del Valle Saavedra ', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL),
(6, 'Mayumi\'s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko\r\nChuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi\'s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#'),
(7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St.\r\nMoonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL),
(8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King\'s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL),
(9, 'PB Knckebrd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Gteborg', NULL, 'S-345 67', 'Sweden ', '031-987 65 43', '031-987 65 91', NULL),
(10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'So Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL),
(11, 'Heli Swaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstrae 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL),
(12, 'Plutzer Lebensmittelgromrkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#'),
(13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL),
(14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#'),
(15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL),
(16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue\r\nSuite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL),
(17, 'Svensk Sjfda AB', 'Michael Bjrn', 'Sales Representative', 'Brovallavgen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL),
(18, 'Aux joyeux ecclsiastiques', 'Guylne Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL),
(19, 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept.\r\n2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL),
(20, 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL),
(21, 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild\r\nFiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL),
(22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop\r\nRijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL),
(23, 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL),
(24, 'G\'day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade\r\nHunter\'s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G\'day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#'),
(25, 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL),
(26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL),
(27, 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL),
(28, 'Gai pturage', 'Eliane Noz', 'Sales Representative', 'Bat. B\r\n3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL),
(29, 'Forts d\'rables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Qubec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);

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
(1, 'boyerhenri@sfr.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$qUUuvk6L9fmKll4SCInBAQ$rGd8/8drLWJKlmHZYooYkqQfLyesRC2+sZ/srZesuv0'),
(2, 'batman@asylum.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$fOQcAVmWXA/8/bY60Gho0g$3CWbzzFqnRN0kNtLuWNsYnDtI+TMjhw6iFKCc4Nf3Oo');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
