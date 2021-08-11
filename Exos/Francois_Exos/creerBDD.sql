-- Nuke la base si existe
DROP DATABASE IF EXISTS Francois_exo;
CREATE DATABASE Francois_exo;
USE Francois_exo;

-- Creations des tables
CREATE TABLE Personne (
    per_num INT AUTO_INCREMENT,
    per_nom VARCHAR(25) NOT NULL,
    per_prenom VARCHAR(25) NOT NULL,
    per_adresse VARCHAR(50) NOT NULL,
    per_ville VARCHAR(15) NOT NULL,
    -- Contraintes
    PRIMARY KEY(per_num)
);

CREATE TABLE Groupe (
    gro_num INT AUTO_INCREMENT,
    gro_libelle VARCHAR(25),
    -- Contraintes
    PRIMARY KEY (gro_num)
);

-- Liaisons
CREATE TABLE Appartient(
    per_num INT,
    gro_num INT,
    FOREIGN KEY (per_num) REFERENCES Personne(per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num)
);
