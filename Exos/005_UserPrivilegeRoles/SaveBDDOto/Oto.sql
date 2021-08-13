-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 13 août 2021 à 09:01
-- Version du serveur :  10.5.10-MariaDB-0ubuntu0.21.04.1
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Oto`
--

-- --------------------------------------------------------

--
-- Structure de la table `ask`
--

CREATE TABLE `ask` (
  `id_client` int(11) NOT NULL,
  `id_commercial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `buyVehicle`
--

CREATE TABLE `buyVehicle` (
  `id_buy` int(11) NOT NULL,
  `buy_date` datetime NOT NULL,
  `buy_funding` char(10) NOT NULL,
  `id_storageVehicles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `buyVehicle`
--

INSERT INTO `buyVehicle` (`id_buy`, `buy_date`, `buy_funding`, `id_storageVehicles`) VALUES
(1, '2008-12-10 12:12:23', 'CRED', 1),
(2, '2012-05-03 15:26:12', 'COMPT', 2),
(3, '2021-05-12 17:12:58', 'COMPT', 3),
(4, '1932-03-01 16:23:22', 'COMPT', 4),
(5, '2000-11-01 14:52:32', 'CRED', 5);

-- --------------------------------------------------------

--
-- Structure de la table `checks`
--

CREATE TABLE `checks` (
  `id_buy` int(11) NOT NULL,
  `id_storageVehicles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `request_client` char(25) NOT NULL,
  `name_client` char(25) NOT NULL,
  `lastName_client` char(25) NOT NULL,
  `mail_client` char(40) DEFAULT NULL,
  `phoneNumber_client` varchar(20) DEFAULT NULL,
  `status_client` char(10) NOT NULL,
  `adress_client` char(50) NOT NULL,
  `zipCode_client` varchar(10) NOT NULL,
  `city_client` varchar(20) NOT NULL,
  `country_client` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `request_client`, `name_client`, `lastName_client`, `mail_client`, `phoneNumber_client`, `status_client`, `adress_client`, `zipCode_client`, `city_client`, `country_client`) VALUES
(1, 'achat vehicule', 'ARTHUR', 'Roi', '', '0612324520', 'PART', '3, Rue Bis', '80000', 'Kaamelot', 'Angleterre'),
(2, 'options', 'KARADOC', 'Lucien', '', '0722429570', 'PRO', '30, Avenue des pendus', '75000', 'St Just', 'France'),
(3, 'accessoires', 'JOSETTE', 'Lucienne', 'luciennejo@caramail.com', '0612142336', 'PART', '7, chemin des dahus', '06200', 'Vesubie', 'France'),
(4, 'reparations', 'TONY', 'Montana', '', '099555927', 'PRO', '112,Via Cabra', '32178', 'Roma', 'Italy'),
(5, 'pose', 'VICTOR', 'Nettoyeur', 'servicessecrets@gouf.fr', '0615231436', 'PART', '50, Avenue des palmiers', '62000', 'St Omer', 'France'),
(6, 'entretien', 'HECTOR', 'Humungus', '', '0482181666', 'PRO', '3 ZI les montieres', '13600', 'Marseille', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `id_commercial` int(11) NOT NULL,
  `spe_commercial` char(10) NOT NULL,
  `name_commercial` char(25) NOT NULL,
  `lastName_commercial` char(25) NOT NULL,
  `mail_commercial` char(40) NOT NULL,
  `phone_commercial` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`id_commercial`, `spe_commercial`, `name_commercial`, `lastName_commercial`, `mail_commercial`, `phone_commercial`) VALUES
(1, 'PART', 'CONVENANT', 'Jean-Claude', 'JC@oto.fr', '0301052485'),
(2, 'PRO', 'N GOBO', 'Lucienne', 'ngobo@oto.fr', '0204052389');

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE `maintenance` (
  `id_maintenance` int(11) NOT NULL,
  `id_technician` int(11) NOT NULL,
  `type_maintenance` char(10) NOT NULL,
  `price_maintenance` decimal(6,2) NOT NULL,
  `date_maintenance` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `maintenance`
--

INSERT INTO `maintenance` (`id_maintenance`, `id_technician`, `type_maintenance`, `price_maintenance`, `date_maintenance`) VALUES
(1, 1, 'ATELIER', '200.00', '2008-12-10 12:12:23');

-- --------------------------------------------------------

--
-- Structure de la table `need`
--

CREATE TABLE `need` (
  `id_maintenance` int(11) NOT NULL,
  `id_repair` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `id_options` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `id_options` int(11) NOT NULL,
  `type_options` char(50) NOT NULL,
  `price_options` decimal(10,2) NOT NULL,
  `date_options` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `options`
--

INSERT INTO `options` (`id_options`, `type_options`, `price_options`, `date_options`) VALUES
(1, 'POSE GYROPHARE', '230.50', '2008-12-10 12:12:23'),
(2, 'FREINS', '150.20', '2018-11-10 14:16:52');

-- --------------------------------------------------------

--
-- Structure de la table `repair`
--

CREATE TABLE `repair` (
  `id_repair` int(11) NOT NULL,
  `type_repair` char(120) NOT NULL,
  `price_repair` decimal(6,2) NOT NULL,
  `date_repair` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `repair`
--

INSERT INTO `repair` (`id_repair`, `type_repair`, `price_repair`, `date_repair`) VALUES
(1, 'CONFORMITE', '0.00', '2008-12-10 12:12:23');

-- --------------------------------------------------------

--
-- Structure de la table `request`
--

CREATE TABLE `request` (
  `id_commercial` int(11) NOT NULL,
  `id_buy` int(11) NOT NULL,
  `id_maintenance` int(11) NOT NULL,
  `id_repair` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `finalQuote_price_HT` decimal(15,2) NOT NULL,
  `finalQuote_price_TTC` decimal(15,2) NOT NULL,
  `VAT_value` decimal(4,2) NOT NULL,
  `quote_date` datetime NOT NULL,
  `quote_accept` smallint(6) DEFAULT NULL,
  `quote_paid` smallint(6) DEFAULT NULL,
  `quote_paidDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `request`
--

INSERT INTO `request` (`id_commercial`, `id_buy`, `id_maintenance`, `id_repair`, `id_client`, `finalQuote_price_HT`, `finalQuote_price_TTC`, `VAT_value`, `quote_date`, `quote_accept`, `quote_paid`, `quote_paidDate`) VALUES
(1, 1, 1, 1, 5, '15000.00', '15206.00', '20.60', '2008-12-10 12:12:23', 1, 1, '2008-12-10 12:12:23');

-- --------------------------------------------------------

--
-- Structure de la table `storageVehicles`
--

CREATE TABLE `storageVehicles` (
  `id_storageVehicles` int(11) NOT NULL,
  `name_storageVehicles` char(50) NOT NULL,
  `brand_storageVehicles` varchar(50) DEFAULT NULL,
  `stock_storageVehicles` int(11) DEFAULT NULL,
  `price_storageVehicles` decimal(15,2) NOT NULL,
  `age_storageVehicles` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `storageVehicles`
--

INSERT INTO `storageVehicles` (`id_storageVehicles`, `name_storageVehicles`, `brand_storageVehicles`, `stock_storageVehicles`, `price_storageVehicles`, `age_storageVehicles`) VALUES
(1, 'Megane', 'Renault', 3, '8090.00', 0),
(2, 'Panda', 'Fiat', 2, '15000.00', 2003),
(3, '306', 'Peugeot', 5, '7000.00', 1995),
(4, 'Mad Cat', 'Inner Sphere', 1, '300000.00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `storedProducts`
--

CREATE TABLE `storedProducts` (
  `id_products` int(11) NOT NULL,
  `name_storedProducts` char(50) NOT NULL,
  `price_storedProducts` decimal(6,2) NOT NULL,
  `stock_storedProducts` int(11) DEFAULT NULL,
  `id_technician` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `storedProducts`
--

INSERT INTO `storedProducts` (`id_products`, `name_storedProducts`, `price_storedProducts`, `stock_storedProducts`, `id_technician`) VALUES
(1, 'sapin déodorant', '3.99', 3, 0),
(2, 'clip a lunettes', '5.47', 0, 1),
(3, 'porte gobelet 5G', '3.23', 10, 2),
(4, 'autoradio', '200.00', 5, 1),
(5, 'ethylotest', '1.00', 230, 3),
(6, 'liquide de frein marque HBg', '66.66', 17, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ask`
--
ALTER TABLE `ask`
  ADD PRIMARY KEY (`id_client`,`id_commercial`),
  ADD KEY `id_commercial` (`id_commercial`);

--
-- Index pour la table `buyVehicle`
--
ALTER TABLE `buyVehicle`
  ADD PRIMARY KEY (`id_buy`);

--
-- Index pour la table `checks`
--
ALTER TABLE `checks`
  ADD PRIMARY KEY (`id_buy`,`id_storageVehicles`),
  ADD KEY `id_storageVehicles` (`id_storageVehicles`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`id_commercial`);

--
-- Index pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id_maintenance`);

--
-- Index pour la table `need`
--
ALTER TABLE `need`
  ADD PRIMARY KEY (`id_maintenance`,`id_repair`,`id_products`,`id_options`),
  ADD KEY `id_repair` (`id_repair`),
  ADD KEY `id_products` (`id_products`),
  ADD KEY `id_options` (`id_options`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id_options`);

--
-- Index pour la table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`id_repair`);

--
-- Index pour la table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_commercial`,`id_buy`,`id_maintenance`,`id_repair`),
  ADD KEY `id_buy` (`id_buy`),
  ADD KEY `id_maintenance` (`id_maintenance`),
  ADD KEY `id_repair` (`id_repair`);

--
-- Index pour la table `storageVehicles`
--
ALTER TABLE `storageVehicles`
  ADD PRIMARY KEY (`id_storageVehicles`);

--
-- Index pour la table `storedProducts`
--
ALTER TABLE `storedProducts`
  ADD PRIMARY KEY (`id_products`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `buyVehicle`
--
ALTER TABLE `buyVehicle`
  MODIFY `id_buy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `commercial`
--
ALTER TABLE `commercial`
  MODIFY `id_commercial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id_maintenance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id_options` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `repair`
--
ALTER TABLE `repair`
  MODIFY `id_repair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `storageVehicles`
--
ALTER TABLE `storageVehicles`
  MODIFY `id_storageVehicles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `storedProducts`
--
ALTER TABLE `storedProducts`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ask`
--
ALTER TABLE `ask`
  ADD CONSTRAINT `ask_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `ask_ibfk_2` FOREIGN KEY (`id_commercial`) REFERENCES `commercial` (`id_commercial`);

--
-- Contraintes pour la table `checks`
--
ALTER TABLE `checks`
  ADD CONSTRAINT `checks_ibfk_1` FOREIGN KEY (`id_buy`) REFERENCES `buyVehicle` (`id_buy`),
  ADD CONSTRAINT `checks_ibfk_2` FOREIGN KEY (`id_storageVehicles`) REFERENCES `storageVehicles` (`id_storageVehicles`);

--
-- Contraintes pour la table `need`
--
ALTER TABLE `need`
  ADD CONSTRAINT `need_ibfk_1` FOREIGN KEY (`id_maintenance`) REFERENCES `maintenance` (`id_maintenance`),
  ADD CONSTRAINT `need_ibfk_2` FOREIGN KEY (`id_repair`) REFERENCES `repair` (`id_repair`),
  ADD CONSTRAINT `need_ibfk_3` FOREIGN KEY (`id_products`) REFERENCES `storedProducts` (`id_products`),
  ADD CONSTRAINT `need_ibfk_4` FOREIGN KEY (`id_options`) REFERENCES `options` (`id_options`);

--
-- Contraintes pour la table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`id_commercial`) REFERENCES `commercial` (`id_commercial`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`id_buy`) REFERENCES `buyVehicle` (`id_buy`),
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`id_maintenance`) REFERENCES `maintenance` (`id_maintenance`),
  ADD CONSTRAINT `request_ibfk_4` FOREIGN KEY (`id_repair`) REFERENCES `repair` (`id_repair`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
