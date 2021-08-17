-- Affiche les clients ITALIENS
USE Oto;
SELECT name_client AS "NOM",lastName_client AS "PRENOM",status_client AS "TYPE" FROM `client` WHERE country_client="Italy";

-- Liste les produits en magasin en rupture de stock
SELECT name_storedProducts AS "PRODUIT" FROM `storedProducts` WHERE stock_storedProducts=0;

-- Liste les commerciaux
SELECT lastName_commercial AS "PRENOM",spe_commercial AS "SPE" FROM `commercial`;

-- Liste les vehicules neufs
SELECT brand_storageVehicles AS "MARQUE" FROM `storageVehicles` WHERE age_storageVehicles=0;

-- Ventes de 2008
SELECT id_buy AS "VENTES DE 2008" FROM `request` WHERE YEAR(quote_date)='2008';
