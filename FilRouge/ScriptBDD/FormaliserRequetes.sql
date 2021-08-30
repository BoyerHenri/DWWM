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
