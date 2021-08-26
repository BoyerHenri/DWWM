-- **********
-- * GESCOM *
-- **********
/*
Factures : les mentions obligatoires
La date de la facture. ...
Le numéro de la facture. ...
La date de la vente ou de la prestation de service. ...
L'identité du vendeur ou du prestataire de services. ...
L'identité de l'acheteur ou du client. ...
Numéro du bon de commande. ...
Numéro d'identification à la TVA.
*/
DROP PROCEDURE IF EXISTS facture;
DELIMITER |
CREATE PROCEDURE facture(p_id_com INT)
BEGIN
    SELECT ord_order_date AS 'DATE',
    ord_id AS 'N°',
    sup_name AS 'Servi par...',
    CONCAT(cus_lastname,' ',cus_firstname) AS 'Client',
    cat_name AS 'Article',
    pro_name AS 'Nom',
    ode_quantity AS 'Quantité',
    ode_unit_price AS 'Prix unitaire',
    ode_discount AS 'Remise de...',
    ROUND(SUM((ode_unit_price*ode_quantity)-((ode_unit_price*ode_quantity)*(ode_discount/100))),2) AS 'PRIX TOTAL',
    -- ROUND(SUM((ode_quantity*ode_unit_price)-((ode_quantity*ode_unit_price)*(ode_discount/100))),2) AS 'PRIX TOTAL',
    ord_order_date AS 'Facture émise le',
    ord_payment_date AS 'Payée le',
    CONCAT(YEAR(ord_order_date),MONTH(ord_order_date),ord_id) AS 'Facture N°'

    FROM orders
    JOIN customers
    ON ord_cus_id=cus_id
    JOIN orders_details
    ON ord_id=ode_ord_id
    JOIN products
    ON ode_pro_id=pro_id
    JOIN suppliers
    ON pro_sup_id=sup_id
    JOIN categories
    ON pro_cat_id=cat_id

    WHERE ode_id=p_id_com;
END |
DELIMITER ;
--
CALL facture(8);