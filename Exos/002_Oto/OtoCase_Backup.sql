-- Initialisations
-- Nuke sur la base si elle existe
DROP DATABASE IF EXISTS Oto;
-- Cree et pointe sur la base ainsi créee
CREATE DATABASE Oto;
USE Oto;

-- Création des tables
-- BDD Client
-- status_client = Type de client PRO ou PARTAUTO_INCREMENT
CREATE TABLE client(
   id_client  SMALLINT NOT NULL AUTO_INCREMENT,
   request_client CHAR(25) NOT NULL,
   name_client CHAR(25) NOT NULL,
   lastName_client CHAR(25) NOT NULL,
   mail_client CHAR(25),
   phoneNumber_client SMALLINT,
   status_client CHAR(25) NOT NULL,
   adress_client CHAR(50) NOT NULL,
   zipCode_client SMALLINT NOT NULL,
   city_client CHAR(20) NOT NULL,
   country_client CHAR(20),
   -- Contraintes
   PRIMARY KEY (id_client),
   UNIQUE (mail_client)
);
-- Liste des commerciaux
-- spe_commercial = Type de vente PRO ou PART
CREATE TABLE commercial(
   id_commercial SMALLINT NOT NULL AUTO_INCREMENT,
   spe_commercial CHAR(5) NOT NULL,
   name_commercial CHAR(25) NOT NULL,
   lastName_commercial CHAR(20) NOT NULL,
   mail_commercial CHAR(50) NOT NULL,
   phone_commercial SMALLINT NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_commercial)
);
-- Service VENTE
-- buy_funding = Type de finacement, CRED ou CASH
CREATE TABLE buyVehicle(
   id_buy SMALLINT NOT NULL AUTO_INCREMENT,
   buy_date DATETIME NOT NULL,
   buy_funding CHAR(10) NOT NULL,
   id_storageVehicles SMALLINT,
   -- Contraintes
   PRIMARY KEY (id_buy)
);
-- Service ATELIER
-- type_maintenance = Description de la maintenance.
CREATE TABLE maintenance(
   id_maintenance SMALLINT NOT NULL AUTO_INCREMENT,
   id_technician SMALLINT NOT NULL,
   type_maintenance CHAR(50) NOT NULL,
   price_maintenance DECIMAL(6,2) NOT NULL,
   date_maintenance DATETIME NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_maintenance)
);
-- type_repair = Description de la maintenance.
CREATE TABLE repair(
   id_repair SMALLINT NOT NULL AUTO_INCREMENT,
   type_repair CHAR(50) NOT NULL,
   price_repair DECIMAL(6,2) NOT NULL,
   date_repair DATETIME NOT NULL,
   -- Contraintes
   PRIMARY KEY(id_repair)
);
-- Service MAGASIN
CREATE TABLE storedProducts(
   id_products SMALLINT NOT NULL AUTO_INCREMENT,
   name_storedProducts CHAR(20) NOT NULL,
   price_storedProducts DECIMAL(6,2) NOT NULL,
   stock_storedProducts SMALLINT,
   id_technician SMALLINT NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_products)
);
CREATE TABLE options(
   id_options SMALLINT NOT NULL AUTO_INCREMENT,
   type_options CHAR(50) NOT NULL,
   price_options DECIMAL(6,2) NOT NULL,
   date_options DATETIME NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_options)
);
-- Stocks vehicules
CREATE TABLE storageVehicles(
   id_storageVehicles SMALLINT NOT NULL AUTO_INCREMENT,
   name_storageVehicles CHAR(50) NOT NULL,
   brand_storageVehicles VARCHAR(50),
   stock_storageVehicles SMALLINT,
   price_storageVehicles DECIMAL(15,2) NOT NULL,
   age_storageVehicles SMALLINT NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_storageVehicles)
);

-- Lien entre les tables
CREATE TABLE ask(
   id_client SMALLINT,
   id_commercial SMALLINT,
   PRIMARY KEY (id_client,id_commercial),
   FOREIGN KEY (id_client) REFERENCES client(id_client),
   FOREIGN KEY (id_commercial) REFERENCES commercial(id_commercial)
);
-- Facturation et demande
-- finalQuote_price_HT = comprend le prix total de l'intervention (main d'oeuvre, produit HORS TAXE)
-- quote_accept = devis emis, accepté ou non (0 / 1)
-- VAT_value = Valeur TVA
-- quote_date = Date de l'émission du devis
CREATE TABLE request(
   id_commercial SMALLINT,
   id_buy SMALLINT,
   id_maintenance SMALLINT,
   id_repair SMALLINT,
   id_client SMALLINT NOT NULL,
   finalQuote_price_HT DECIMAL(6,2) NOT NULL,
   finalQuote_price_TTC DECIMAL(6,2) NOT NULL,
   VAT_value DECIMAL(4,2) NOT NULL,
   quote_date DATETIME NOT NULL,
   quote_accept SMALLINT,
   quote_paid SMALLINT,
   quote_paidDate DATETIME NOT NULL,
   PRIMARY KEY (id_commercial,id_buy,id_maintenance,id_repair),
   FOREIGN KEY (id_commercial) REFERENCES commercial(id_commercial),
   FOREIGN KEY (id_buy) REFERENCES buyVehicle(id_buy),
   FOREIGN KEY (id_maintenance) REFERENCES maintenance(id_maintenance),
   FOREIGN KEY (id_repair) REFERENCES repair(id_repair)
);
-- Verification du stock de vehicules
CREATE TABLE checks(
   id_buy SMALLINT,
   id_storageVehicles SMALLINT,
   PRIMARY KEY (id_buy,id_storageVehicles),
   FOREIGN KEY (id_buy) REFERENCES buyVehicle(id_buy),
   FOREIGN KEY (id_storageVehicles) REFERENCES storageVehicles(id_storageVehicles)
);
-- Verification du stock en magasin
CREATE TABLE need(
   id_maintenance SMALLINT,
   id_repair SMALLINT,
   id_products SMALLINT,
   id_options SMALLINT,
   PRIMARY KEY (id_maintenance,id_repair,id_products,id_options),
   FOREIGN KEY (id_maintenance) REFERENCES maintenance(id_maintenance),
   FOREIGN KEY (id_repair) REFERENCES repair(id_repair),
   FOREIGN KEY (id_products) REFERENCES storedProducts(id_products),
   FOREIGN KEY (id_options) REFERENCES options(id_options)
);


