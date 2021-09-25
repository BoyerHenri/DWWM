-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 30 août 2021 à 14:26
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
-- Base de données : `green_village`
--
CREATE DATABASE IF NOT EXISTS `green_village` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `green_village`;

-- --------------------------------------------------------

--
-- Structure de la table `accounting`
--

CREATE TABLE IF NOT EXISTS `accounting` (
  `acc_cus_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `acc_name` varchar(25) NOT NULL,
  `acc_firstname` varchar(25) NOT NULL,
  `acc_mail` varchar(25) DEFAULT NULL,
  `acc_phone` varchar(25) DEFAULT NULL,
  `acc_cat` char(5) DEFAULT NULL,
  PRIMARY KEY (`acc_cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `accounting`
--

INSERT INTO `accounting` (`acc_cus_id`, `acc_name`, `acc_firstname`, `acc_mail`, `acc_phone`, `acc_cat`) VALUES
(1, 'Jean-Luc', 'MOLASSON', 'pcf@lesautres.com', '0947102244', 'PRO'),
(2, 'Isabelle', 'TROGNON', 'isatro@bou.fr', '0703884421', 'PAR'),
(3, 'Felix', 'MOUTRIN', 'femou@free.fr', '0104009911', 'PAR');

-- --------------------------------------------------------

--
-- Structure de la table `aftersale`
--

CREATE TABLE IF NOT EXISTS `aftersale` (
  `aft_cus_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `aft_name` varchar(25) NOT NULL,
  `aft_firstname` varchar(25) NOT NULL,
  `aft_mail` varchar(25) DEFAULT NULL,
  `aft_phone` varchar(25) DEFAULT NULL,
  `aft_cat` char(5) DEFAULT NULL,
  PRIMARY KEY (`aft_cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aftersale`
--

INSERT INTO `aftersale` (`aft_cus_id`, `aft_name`, `aft_firstname`, `aft_mail`, `aft_phone`, `aft_cat`) VALUES
(1, 'Lucien', 'ARISTIDE', 'arlu@aol.com', '025573614', 'PAR'),
(2, 'Hyppolite', 'BOUILLON', 'hippoboul@sfr.fr', '0425132599', 'PAR'),
(3, 'Elodie', 'MERFINE', 'hotgirl@aol.com', '0852564752', 'PRO');

-- --------------------------------------------------------

--
-- Structure de la table `belongs`
--

CREATE TABLE IF NOT EXISTS `belongs` (
  `pro_id` smallint(6) NOT NULL,
  `cat_id` smallint(6) NOT NULL,
  PRIMARY KEY (`pro_id`,`cat_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) NOT NULL,
  `cat_sub_id` smallint(6) DEFAULT NULL,
  `cat_sub_name` varchar(30) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_sub_id`, `cat_sub_name`) VALUES
(1, 'Divers', 1, 'Divers'),
(2, 'Instruments à cordes', 2, 'Guitare'),
(3, 'Cuivres', 2, 'Instruments à vent');

-- --------------------------------------------------------

--
-- Structure de la table `catteam`
--

CREATE TABLE IF NOT EXISTS `catteam` (
  `catteam_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `catt_order_id` smallint(6) DEFAULT NULL,
  `catt_name` varchar(25) NOT NULL,
  `catt_firstname` varchar(25) NOT NULL,
  `catt_mail` varchar(25) DEFAULT NULL,
  `catt_phone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`catteam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `catteam`
--

INSERT INTO `catteam` (`catteam_id`, `catt_order_id`, `catt_name`, `catt_firstname`, `catt_mail`, `catt_phone`) VALUES
(1, 1, 'José', 'BOVIN', 'jobo@sfr.fr', '0604080305'),
(2, 2, 'Huguette', 'MOUTRIN', 'hugmo@orange.fr', '0108090212'),
(3, 3, 'Justin', 'BRIDOU', 'purporc@free.fr', '0278987574');

-- --------------------------------------------------------

--
-- Structure de la table `concern`
--

CREATE TABLE IF NOT EXISTS `concern` (
  `pro_id` smallint(6) NOT NULL,
  `ordetails_id` smallint(6) NOT NULL,
  PRIMARY KEY (`pro_id`,`ordetails_id`),
  KEY `ordetails_id` (`ordetails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cus_coef` decimal(4,2) DEFAULT NULL,
  `cus_name` varchar(50) NOT NULL,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_address` varchar(50) NOT NULL,
  `cus_zipcode` varchar(10) NOT NULL,
  `cus_city` varchar(30) NOT NULL,
  `cus_country` varchar(30) NOT NULL,
  `cus_mail` varchar(50) DEFAULT NULL,
  `cus_phone` varchar(30) DEFAULT NULL,
  `cus_login` varchar(30) NOT NULL,
  `cus_password` varchar(30) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  UNIQUE KEY `cus_login` (`cus_login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`cus_id`, `cus_coef`, `cus_name`, `cus_lastname`, `cus_address`, `cus_zipcode`, `cus_city`, `cus_country`, `cus_mail`, `cus_phone`, `cus_login`, `cus_password`, `cus_add_date`, `cus_update_date`) VALUES
(1, '20.00', 'DULAC', 'Lancelot', 'Chatêau Kaamelot', '99745', 'Londres', 'Angleterre', 'lancdu@kaam.uk', '9955776633', 'kingarthur', '123456', '2008-08-20 00:00:00', '2008-08-20 00:00:00'),
(2, '20.00', 'DALTON', 'Arwell', 'Chemin du pénitencier', '06200', 'Nice', 'France', 'daltonarw@aol.com', '0615231436', 'jaifaim', '456789', '2010-12-05 00:00:00', '2010-12-05 00:00:00'),
(3, '10.00', 'BRASSENS', 'Georges', 'Conservatoire de Lyon', '69200', 'Lyon', 'France', 'gorille@gare.fr', '0179325478', 'geobra', '000000', '2020-06-12 00:00:00', '2020-06-12 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `fill`
--

CREATE TABLE IF NOT EXISTS `fill` (
  `catteam_id` smallint(6) NOT NULL,
  `sto_sup_id` smallint(6) NOT NULL,
  PRIMARY KEY (`catteam_id`,`sto_sup_id`),
  KEY `sto_sup_id` (`sto_sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `manage`
--

CREATE TABLE IF NOT EXISTS `manage` (
  `pro_id` smallint(6) NOT NULL,
  `catteam_id` smallint(6) NOT NULL,
  PRIMARY KEY (`pro_id`,`catteam_id`),
  KEY `catteam_id` (`catteam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `order_cus_id` smallint(6) DEFAULT NULL,
  `order_order_date` datetime DEFAULT NULL,
  `order_paid_date` datetime DEFAULT NULL,
  `order_send_date` datetime DEFAULT NULL,
  `order_receive_date` datetime DEFAULT NULL,
  `order_send_address` text DEFAULT NULL,
  `order_send_billing` text DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`order_id`, `order_cus_id`, `order_order_date`, `order_paid_date`, `order_send_date`, `order_receive_date`, `order_send_address`, `order_send_billing`) VALUES
(1, 2, '2012-02-04 00:00:00', '2012-02-04 00:00:00', '2012-04-04 00:00:00', '2012-03-04 00:00:00', 'Addresse client', 'Addresse client'),
(2, 1, '2020-06-08 00:00:00', '2020-06-08 00:00:00', '2020-07-08 00:00:00', '2020-09-08 00:00:00', 'Camping la Prison 5,Rue de la Bastille 75000 Paris', 'Addresse Client'),
(3, 3, '2021-08-02 00:00:00', '2021-09-03 00:00:00', '2021-08-02 00:00:00', '2021-08-08 00:00:00', 'Conservatoire de Lyon, Avenue Matisse 69200 Lyon', 'Mairie de Lyon, rue du Bouffon 69200 Lyon');

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

CREATE TABLE IF NOT EXISTS `orders_details` (
  `ordetails_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ordetails_quantity` smallint(6) DEFAULT NULL,
  `ordetails_unit_price` decimal(6,2) DEFAULT NULL,
  `ordetails_discount` decimal(4,2) DEFAULT NULL,
  `ordetails_payment` char(4) DEFAULT NULL,
  `ordetails_orders_id` smallint(6) DEFAULT NULL,
  `ordetails_product_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ordetails_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders_details`
--

INSERT INTO `orders_details` (`ordetails_id`, `ordetails_quantity`, `ordetails_unit_price`, `ordetails_discount`, `ordetails_payment`, `ordetails_orders_id`, `ordetails_product_id`) VALUES
(1, 1, '75.50', '0.00', 'IMM', 1, 1),
(2, 3, '450.00', '10.00', 'IMM', 2, 3),
(3, 2, '175.00', '0.00', 'DIF', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pro_sup_id` smallint(6) DEFAULT NULL,
  `pro_cat_id` smallint(6) DEFAULT NULL,
  `pro_short_lib` varchar(25) DEFAULT NULL,
  `pro_long_lib` varchar(50) DEFAULT NULL,
  `pro_price` decimal(7,2) DEFAULT NULL,
  `pro_stock` smallint(6) DEFAULT NULL,
  `pro_alertstock` smallint(6) DEFAULT NULL,
  `pro_available` smallint(6) DEFAULT NULL,
  `pro_urlpicture` char(100) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`pro_id`, `pro_sup_id`, `pro_cat_id`, `pro_short_lib`, `pro_long_lib`, `pro_price`, `pro_stock`, `pro_alertstock`, `pro_available`, `pro_urlpicture`) VALUES
(1, 1, 1, 'Triangle', 'Idéal pour débuter, fabrication artisanale', '75.50', 10, 2, 1, '../images_prod/triangle.png'),
(2, 2, 2, 'Guitare', 'Style vintage, disponible en gaucher', '175.00', 4, 1, 1, '../images_prod/guit_web.png'),
(3, 3, 3, 'Cor de chasse', 'Trés à la mode à la campagne', '450.00', 2, 0, 1, '../images_prod/cor_chasse.png');

-- --------------------------------------------------------

--
-- Structure de la table `sellers`
--

CREATE TABLE IF NOT EXISTS `sellers` (
  `seller_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(25) NOT NULL,
  `seller_firstname` varchar(25) NOT NULL,
  `seller_mail` varchar(25) DEFAULT NULL,
  `seller_phone` varchar(25) DEFAULT NULL,
  `seller_cat` char(5) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `seller_name`, `seller_firstname`, `seller_mail`, `seller_phone`, `seller_cat`) VALUES
(1, 'KLINK', 'Colonel', 'stalag13@auch.de', '0199883355', 'PRO'),
(2, 'LIOU', 'Lucy', 'killbill@tarent.com', '0622553345', 'PAR'),
(3, 'LEDUC', 'Eugéne', 'violet@cathe.com', '0406228832', 'PAR');

-- --------------------------------------------------------

--
-- Structure de la table `selling`
--

CREATE TABLE IF NOT EXISTS `selling` (
  `pro_id` smallint(6) NOT NULL,
  `sup_id` smallint(6) NOT NULL,
  PRIMARY KEY (`pro_id`,`sup_id`),
  KEY `sup_id` (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `send`
--

CREATE TABLE IF NOT EXISTS `send` (
  `sup_id` smallint(6) NOT NULL,
  `sto_sup_id` smallint(6) NOT NULL,
  PRIMARY KEY (`sup_id`,`sto_sup_id`),
  KEY `sto_sup_id` (`sto_sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `specify`
--

CREATE TABLE IF NOT EXISTS `specify` (
  `order_id` smallint(6) NOT NULL,
  `ordetails_id` smallint(6) NOT NULL,
  PRIMARY KEY (`order_id`,`ordetails_id`),
  KEY `ordetails_id` (`ordetails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `storage_orders`
--

CREATE TABLE IF NOT EXISTS `storage_orders` (
  `sto_sup_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sto_sup_date` datetime NOT NULL,
  `sto_sup_paid_date` datetime NOT NULL,
  `sto_sup_send_date` datetime NOT NULL,
  `sto_sup_receive_date` datetime NOT NULL,
  PRIMARY KEY (`sto_sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `storage_orders`
--

INSERT INTO `storage_orders` (`sto_sup_id`, `sto_sup_date`, `sto_sup_paid_date`, `sto_sup_send_date`, `sto_sup_receive_date`) VALUES
(1, '2008-10-06 00:00:00', '2007-05-03 00:00:00', '2002-12-07 00:00:00', '2000-01-03 00:00:00'),
(2, '2021-08-03 00:00:00', '2021-08-04 00:00:00', '2021-07-03 00:00:00', '2021-07-05 00:00:00'),
(3, '1999-12-12 00:00:00', '1998-07-06 00:00:00', '1998-03-07 00:00:00', '1999-03-02 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sup_type` char(5) DEFAULT NULL,
  `sup_name` varchar(50) NOT NULL,
  `sup_address` varchar(50) NOT NULL,
  `sup_zipcode` varchar(10) NOT NULL,
  `sup_city` varchar(30) NOT NULL,
  `sup_country` varchar(30) NOT NULL,
  `sup_contact` varchar(30) NOT NULL,
  `sup_mail` varchar(50) DEFAULT NULL,
  `sup_phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_type`, `sup_name`, `sup_address`, `sup_zipcode`, `sup_city`, `sup_country`, `sup_contact`, `sup_mail`, `sup_phone`) VALUES
(1, 'IMPOR', 'ChinaSounds', '3, Ping Pong Avenue', '99300', 'Hyan', 'China', 'Li Tchou Long', 'lichou@chinas.si', '9854247854'),
(2, 'CONST', 'Aux Chants, luthier', '1, Chemin de l eglise', '83000', 'Briançon', 'France', 'Hugues CAPET', 'hugcap@aol.fr', '0620145295'),
(3, 'IMPOR', 'Deutch Music', '5, Reichtag Obtenkommandatur', '99520', 'Berlin', 'Allemagne', 'Hanz Schultz', 'schthanz@yahoo.de', '2147986575');

-- --------------------------------------------------------

--
-- Structure de la table `support`
--

CREATE TABLE IF NOT EXISTS `support` (
  `cus_id` smallint(6) NOT NULL,
  `seller_id` smallint(6) NOT NULL,
  `acc_cus_id` smallint(6) NOT NULL,
  `aft_cus_id` smallint(6) NOT NULL,
  PRIMARY KEY (`cus_id`,`seller_id`,`acc_cus_id`,`aft_cus_id`),
  KEY `seller_id` (`seller_id`),
  KEY `acc_cus_id` (`acc_cus_id`),
  KEY `aft_cus_id` (`aft_cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `take`
--

CREATE TABLE IF NOT EXISTS `take` (
  `cus_id` smallint(6) NOT NULL,
  `order_id` smallint(6) NOT NULL,
  PRIMARY KEY (`cus_id`,`order_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `belongs`
--
ALTER TABLE `belongs`
  ADD CONSTRAINT `belongs_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`),
  ADD CONSTRAINT `belongs_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Contraintes pour la table `concern`
--
ALTER TABLE `concern`
  ADD CONSTRAINT `concern_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`),
  ADD CONSTRAINT `concern_ibfk_2` FOREIGN KEY (`ordetails_id`) REFERENCES `orders_details` (`ordetails_id`);

--
-- Contraintes pour la table `fill`
--
ALTER TABLE `fill`
  ADD CONSTRAINT `fill_ibfk_1` FOREIGN KEY (`catteam_id`) REFERENCES `catteam` (`catteam_id`),
  ADD CONSTRAINT `fill_ibfk_2` FOREIGN KEY (`sto_sup_id`) REFERENCES `storage_orders` (`sto_sup_id`);

--
-- Contraintes pour la table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`),
  ADD CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`catteam_id`) REFERENCES `catteam` (`catteam_id`);

--
-- Contraintes pour la table `selling`
--
ALTER TABLE `selling`
  ADD CONSTRAINT `selling_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`),
  ADD CONSTRAINT `selling_ibfk_2` FOREIGN KEY (`sup_id`) REFERENCES `suppliers` (`sup_id`);

--
-- Contraintes pour la table `send`
--
ALTER TABLE `send`
  ADD CONSTRAINT `send_ibfk_1` FOREIGN KEY (`sup_id`) REFERENCES `suppliers` (`sup_id`),
  ADD CONSTRAINT `send_ibfk_2` FOREIGN KEY (`sto_sup_id`) REFERENCES `storage_orders` (`sto_sup_id`);

--
-- Contraintes pour la table `specify`
--
ALTER TABLE `specify`
  ADD CONSTRAINT `specify_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `specify_ibfk_2` FOREIGN KEY (`ordetails_id`) REFERENCES `orders_details` (`ordetails_id`);

--
-- Contraintes pour la table `support`
--
ALTER TABLE `support`
  ADD CONSTRAINT `support_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`),
  ADD CONSTRAINT `support_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`),
  ADD CONSTRAINT `support_ibfk_3` FOREIGN KEY (`acc_cus_id`) REFERENCES `accounting` (`acc_cus_id`),
  ADD CONSTRAINT `support_ibfk_4` FOREIGN KEY (`aft_cus_id`) REFERENCES `aftersale` (`aft_cus_id`);

--
-- Contraintes pour la table `take`
--
ALTER TABLE `take`
  ADD CONSTRAINT `take_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`),
  ADD CONSTRAINT `take_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
