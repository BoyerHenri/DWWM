DROP DATABASE IF EXISTS livresque; 
CREATE DATABASE livresque;
USE livresque;

CREATE TABLE Livres(
   isbn CHAR(13),
   Titre VARCHAR(255) NOT NULL,
   PRIMARY KEY(isbn)
);

CREATE TABLE Auteur(
   id_auteur BIGINT,
   nom VARCHAR(255) NOT NULL,
   penom VARCHAR(255),
   PRIMARY KEY(id_auteur)
);

CREATE TABLE Ecrire(
   isbn CHAR(13),
   id_auteur BIGINT,
   PRIMARY KEY(isbn, id_auteur),
   FOREIGN KEY(isbn) REFERENCES Livres(isbn),
   FOREIGN KEY(id_auteur) REFERENCES Auteur(id_auteur)
);
