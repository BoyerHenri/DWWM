-- ************************
-- * EXERCICES PROCEDURES *
-- ************************

-- Template
-- DROP PROCEDURE IF EXISTS Lst_Rush_Orders;
-- DELIMITER |
-- CREATE PROCEDURE Lst_Rush_Orders()
-- BEGIN
	    -- [SELECT]
        -- LastCommande;
-- END |
-- DELIMITER ;

-- Exercice 1 : création d'une procédure stockée sans paramètre
-- Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom 
-- des fournisseurs pour lesquels une commande a été passée.
-- Exécutez la pour vérifier qu'elle fonctionne conformément à votre attente.

-- Nuke la proc si elle existe deja (pour eviter les erreurs de doublon)
DROP PROCEDURE IF EXISTS Lst_Suppliers;
DELIMITER |
CREATE PROCEDURE Lst_Suppliers()
BEGIN
	SELECT cus_lastname
    FROM customers
    JOIN orders
	ON cus_id=ord_cus_id
    GROUP BY cus_lastname;
END |
DELIMITER ;
-- Appel de la procedure
CALL Lst_Suppliers();
-- Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :
SHOW CREATE PROCEDURE Lst_Suppliers;

-- Exercice 2 : création d'une procédure stockée avec un paramètre en entrée
-- Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente".
DROP PROCEDURE IF EXISTS Lst_Rush_Orders;
DELIMITER |
CREATE PROCEDURE Lst_Rush_Orders()
BEGIN
	SELECT ode_id,ord_status,pro_name
	FROM orders
	JOIN orders_details
	ON ord_id=ode_ord_id 
    JOIN products
	ON ode_pro_id=pro_id
	WHERE ord_status='commande urgente';
    END |
DELIMITER ;
-- Appel
CALL Lst_Rush_Orders();

-- Exercice 3 : création d'une procédure stockée avec plusieurs paramètres
-- Créer la procédure stockée CA_Supplier, qui pour un code fournisseur et 
-- une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée.
-- On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table suppliers.
-- Testez cette procédure avec différentes valeurs des paramètres.
DROP PROCEDURE IF EXISTS CA_Supplier;
DELIMITER |
CREATE PROCEDURE CA_Supplier(p_annee INT,p_id INT)
BEGIN
    -- Le sup existe
    SELECT sup_name AS 'NOM FOURNISSEUR',ROUND(SUM((ode_unit_price*ode_quantity)-((ode_unit_price*ode_quantity)*(ode_discount/100))),2) AS 'CA ANNUEL'
    FROM orders_details
    JOIN products
    ON ode_pro_id=pro_id
    JOIN suppliers
    ON pro_sup_id=sup_id
    JOIN orders
    ON ode_ord_id=ord_id
    WHERE YEAR(ord_order_date)=p_annee AND sup_id=p_id;
END |
DELIMITER ;
-- Appels 
-- Annee sans fournisseurs (aux armes !!)
CALL CA_supplier(1789,2);
-- Annee test
CALL CA_supplier(2000,1);
