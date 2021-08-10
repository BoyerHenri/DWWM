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
   id_client  INT NOT NULL AUTO_INCREMENT,
   -- request_client 'achat vehicule' et/ou 'options' et/ou 'accessoires' et/ou 'reparations' et/ou 'pose' et/ou 'entretien'
   request_client CHAR(25) NOT NULL,
   name_client CHAR(25) NOT NULL,
   lastName_client CHAR(25) NOT NULL,
   mail_client CHAR(40),
   phoneNumber_client VARCHAR(20),
   -- status_client : PRO ou PART
   status_client CHAR(10) NOT NULL,
   adress_client CHAR(50) NOT NULL,
   zipCode_client VARCHAR(10) NOT NULL,
   city_client VARCHAR(20) NOT NULL,
   country_client VARCHAR(20),
   -- Contraintes
   PRIMARY KEY (id_client)
);
-- Liste des commerciaux
-- spe_commercial = Type de vente PRO ou PART
CREATE TABLE commercial(
   id_commercial INT NOT NULL AUTO_INCREMENT,
   -- spe_commercial : PRO ou PART
   spe_commercial CHAR(10) NOT NULL,
   name_commercial CHAR(25) NOT NULL,
   lastName_commercial CHAR(25) NOT NULL,
   mail_commercial CHAR(40) NOT NULL,
   phone_commercial VARCHAR(20) NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_commercial)
);
-- Service VENTE
-- buy_funding = Type de finacement, CRED ou CASH
CREATE TABLE buyVehicle(
   id_buy INT NOT NULL AUTO_INCREMENT,
   buy_date DATETIME NOT NULL,
   -- buy_funding CRED ou COMPT
   buy_funding CHAR(10) NOT NULL,
   id_storageVehicles INT NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_buy)
);
-- Service ATELIER
-- type_maintenance = Description de la maintenance.
CREATE TABLE maintenance(
   id_maintenance INT NOT NULL AUTO_INCREMENT,
   id_technician INT NOT NULL,
   -- type_maintenance repair et/ou entretien et/ou pose
   type_maintenance CHAR(10) NOT NULL,
   price_maintenance DECIMAL(6,2) NOT NULL,
   date_maintenance DATETIME NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_maintenance)
);
-- type_repair = Description de la maintenance.
CREATE TABLE repair(
   id_repair INT NOT NULL AUTO_INCREMENT,
   -- type_repair Bréve description de l'intervention
   type_repair CHAR(120) NOT NULL,
   price_repair DECIMAL(6,2) NOT NULL,
   date_repair DATETIME NOT NULL,
   -- Contraintes
   PRIMARY KEY(id_repair)
);
-- Service MAGASIN
CREATE TABLE storedProducts(
   id_products INT NOT NULL AUTO_INCREMENT,
   name_storedProducts CHAR(50) NOT NULL,
   price_storedProducts DECIMAL(6,2) NOT NULL,
   stock_storedProducts INT,
   -- id_technician Indique le vendeur/l'intervennant/employé mise en rayon
   id_technician SMALLINT NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_products)
);
CREATE TABLE options(
   id_options INT NOT NULL AUTO_INCREMENT,
   -- type_options Bréve description de la pose
   type_options CHAR(50) NOT NULL,
   price_options DECIMAL(10,2) NOT NULL,
   date_options DATETIME NOT NULL,
   -- Contraintes
   PRIMARY KEY (id_options)
);
-- Stocks vehicules
CREATE TABLE storageVehicles(
   id_storageVehicles INT NOT NULL AUTO_INCREMENT,
   name_storageVehicles CHAR(50) NOT NULL,
   brand_storageVehicles VARCHAR(50),
   stock_storageVehicles INT,
   price_storageVehicles DECIMAL(15,2) NOT NULL,
   -- age_storageVehicles 0=Neuf X=Année première mise en circulation (occasion)
   age_storageVehicles SMALLINT,
   -- Contraintes
   PRIMARY KEY (id_storageVehicles)
);

-- Lien entre les tables
CREATE TABLE ask(
   id_client INT,
   id_commercial INT,
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
   id_commercial INT,
   id_buy INT,
   id_maintenance INT,
   id_repair INT,
   id_client INT NOT NULL,
   finalQuote_price_HT DECIMAL(15,2) NOT NULL,
   finalQuote_price_TTC DECIMAL(15,2) NOT NULL,
   VAT_value DECIMAL(4,2) NOT NULL,
   quote_date DATETIME NOT NULL,
   -- quote_accept 0=Devis emis 1=Devis accepté
   quote_accept SMALLINT,
   -- quote_paid 0=facture non payée 1=facture payée
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
   id_buy INT,
   id_storageVehicles INT,
   PRIMARY KEY (id_buy,id_storageVehicles),
   FOREIGN KEY (id_buy) REFERENCES buyVehicle(id_buy),
   FOREIGN KEY (id_storageVehicles) REFERENCES storageVehicles(id_storageVehicles)
);
-- Verification du stock en magasin
CREATE TABLE need(
   id_maintenance INT,
   id_repair INT,
   id_products INT,
   id_options INT,
   PRIMARY KEY (id_maintenance,id_repair,id_products,id_options),
   FOREIGN KEY (id_maintenance) REFERENCES maintenance(id_maintenance),
   FOREIGN KEY (id_repair) REFERENCES repair(id_repair),
   FOREIGN KEY (id_products) REFERENCES storedProducts(id_products),
   FOREIGN KEY (id_options) REFERENCES options(id_options)
);


