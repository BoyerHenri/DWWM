-- Cas Oto
-- Ventes et services automobiles pour les particuliers et professionnels

-- Création de la base.
-- Effacement si existe déja.
DROP DATABASE IF EXISTS otoBase;
-- Création base.
CREATE DATABASE otoBase;
-- Pointe sur la base.
USE otoBase;

-- Création des tables.
-- Client
CREATE TABLE client(
   id_client SMALLINT,
   name_client CHAR(25) NOT NULL,
   prename_client CHAR(25) NOT NULL,
   mail_client CHAR(25),
   phoneNumber_client SMALLINT,
   request_client CHAR(25) NOT NULL, 
   status_client CHAR(25) NOT NULL, 
   PRIMARY KEY(id_client),
   UNIQUE(mail_client)
);

-- Demande du client
CREATE TABLE request(
   id_request SMALLINT,
   request_client CHAR(25) NOT NULL, 
   PRIMARY KEY(id_request)
);

-- Intervenant
CREATE TABLE commercial(
   id_commercial SMALLINT,
   spe_commercial CHAR(5) NOT NULL, 
   PRIMARY KEY(id_commercial)
);

-- Liaision CLIENT / DEMANDE
CREATE TABLE ask(
   id_client SMALLINT,
   id_request SMALLINT,
   PRIMARY KEY(id_client, id_request),
   FOREIGN KEY(id_client) REFERENCES client(id_client),
   FOREIGN KEY(id_request) REFERENCES request(id_request)
);




