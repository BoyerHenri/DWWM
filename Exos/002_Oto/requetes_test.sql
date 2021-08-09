-- Affiche les clients ITALIENS
USE oto;
SELECT name_client AS "NOM",lastName_client AS "PRENOM",status_client AS "TYPE" FROM `client` WHERE country_client="Italy"