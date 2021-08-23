
-- *********
-- * HOTEL *
-- *********

-- 1.Afficher la liste des hôtels avec leur station.
CREATE VIEW v_liste_hotel_station
AS
SELECT hot_nom,sta_nom
FROM hotel
JOIN station
ON hot_sta_id=sta_id

-- 2.Afficher la liste des chambres et leur hôtel
CREATE VIEW v_chambre_hotel
AS 
SELECT hot_nom,cha_numero
FROM hotel
JOIN chambre
ON hot_sta_id=cha_hot_id

-- 3.Afficher la liste des réservations avec le nom des clients
CREATE VIEW v_reservations_clients
AS 
SELECT res_id AS 'Ident Resa',CONCAT(cli_nom,' ',cli_prenom) AS 'Client'
FROM clients
JOIN reservation
ON cli_id=res_cli_id

-- 4.Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station
CREATE VIEW v_chambre_nom_hotel_station
AS 
SELECT cha_numero,hot_nom,sta_nom
FROM chambre
JOIN hotel
ON cha_hot_id=hot_id
JOIN station
ON hot_sta_id=sta_id

-- 5.Afficher les réservations avec le nom du client et le nom de l'hôtel
CREATE VIEW v_resa_nomclient_nomhotel
AS 
SELECT res_id,cli_nom,hot_nom
FROM reservation
JOIN clients
ON res_cli_id=cli_id
JOIN chambre
ON res_cha_id=cha_hot_id
JOIN hotel
ON cha_hot_id=hot_id

-- **********
-- * GESCOM *
-- **********

-- 1.v_Details correspondant à la requête : _A partir de la table orders_details, afficher par code produit, la somme des 
-- quantités commandées et le prix total correspondant : on nommera la colonne correspondant à la somme des quantités commandées, 
-- QteTot et le prix total, PrixTot.
DROP VIEW IF EXISTS v_Details;
CREATE VIEW v_Details
AS
SELECT sum(ode_quantity)
FROM orders_details