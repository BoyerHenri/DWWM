-- C.A. par fournisseur
SELECT sup_id AS 'Grossiste N°',sup_name AS 'Nom',SUM(pro_price) AS 'C.A.'
FROM suppliers
JOIN products
ON pro_id=sup_id
GROUP BY sup_id

-- Liste des produits commandés pour l'année 2020, avec affichage du fournisseur
SELECT cat_sub_name AS 'Produit',pro_id AS 'ID Produit',ordetails_quantity AS 'Quantité',order_order_date AS 'Date',sup_name AS 'Grossiste'
FROM categories
JOIN products
ON pro_id=cat_id
JOIN orders_details
ON pro_id=ordetails_id
JOIN orders
ON order_id=ordetails_id
JOIN suppliers
ON pro_id=sup_id
WHERE YEAR(order_order_date)=2020

-- Suivi de commande client (Ex Client N°1)
SELECT order_id AS 'Commande N°',cat_sub_name AS 'Produit',ordetails_quantity AS 'Quantité',(ordetails_unit_price*ordetails_quantity) AS 'TOTAL',CONCAT(cus_name,' ',cus_lastname) AS 'Client',cus_id AS 'N° Client',order_receive_date AS 'Date livraison',order_order_date AS 'Date de la commande'
FROM orders
JOIN orders_details
ON order_id=ordetails_id
JOIN customers
ON cus_id=order_id
JOIN products
ON pro_id=ordetails_id
JOIN categories
ON pro_id=cat_id
WHERE cus_id=2

-- Repartition du C.A. Hors Taxes par type de client
-- Client partiuculer (coeff=20)
SELECT cus_id AS 'Cli ID',CONCAT(cus_name,' ',cus_lastname) AS 'Client',cus_coef AS 'TVA appliquable',ROUND(SUM((ordetails_quantity*ordetails_unit_price)-(ordetails_quantity*ordetails_unit_price)*(ordetails_discount/100)),2) AS 'C.A. Ht'
FROM customers
JOIN orders
ON cus_id=order_id
JOIN orders_details
ON order_id=ordetails_id
WHERE cus_coef=20
GROUP BY cus_id

-- Client pro (coeff=20)
SELECT cus_id AS 'Cli ID',CONCAT(cus_name,' ',cus_lastname) AS 'Client',cus_coef AS 'TVA appliquable',ROUND(SUM((ordetails_quantity*ordetails_unit_price)-(ordetails_quantity*ordetails_unit_price)*(ordetails_discount/100)),2) AS 'C.A. Ht'
FROM customers
JOIN orders
ON cus_id=order_id
JOIN orders_details
ON order_id=ordetails_id
WHERE cus_coef=10
GROUP BY cus_id

-- Afficher les commandes en cours de livraison
-- (N'ayant pas peuplé de base avec une commande en livraison, j'ai modifié en dur la BDD pour
-- avoir une order_recieve_date 0000-00-00 00:00:00)
SELECT cus_name AS 'Nom', cus_lastname AS 'Prenom'
FROM customers
JOIN orders
ON cus_id=order_id
WHERE order_receive_date='0000-00-00 00:00:00' 

-- Procedure stockée renvoyant le délai moyen entre la date de commande et la date de facturation
DROP PROCEDURE IF EXISTS moyenne_comm;
DELIMITER //
    CREATE PROCEDURE moyenne_comm()
    BEGIN
        SELECT ROUND(ABS(AVG(DATEDIFF(order_order_date,order_paid_date))),0) AS 'Delai moyen comm/fact en jours'
        FROM orders;
    END //
DELIMITER ;
-- Lancement de la procédure
CALL moyenne_comm();

-- Creer une vue correspondant à la jointure Produits-Fournisseurs
DROP VIEW IF EXISTS pro_fou;
CREATE VIEW pro_fou
AS
SELECT CONCAT(sup_id,'->',sup_name,' ',sup_address,' ',sup_zipcode,' ',sup_city,' ',sup_country) AS 'Grossiste',CONCAT(sup_contact,' ',sup_mail,' ',sup_phone) AS 'Contact',
CONCAT('   ',pro_id,'->',cat_name,' ',cat_sub_name) AS 'Produit',pro_short_lib AS 'Descr.',pro_long_lib AS 'Descr. Cat.',CONCAT(pro_stock,'/',pro_alertstock) AS 'Stock et stock d\'alerte'
FROM suppliers
JOIN products
ON pro_id=sup_id
JOIN categories
ON pro_id=cat_id
WHERE pro_sup_id=sup_id