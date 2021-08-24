-- Procedure stockée, exemple
DELIMITER |
CREATE PROCEDURE listeClient()
BEGIN
    SELECT * FROM customers;
END |
DELIMITER ;
-- Appel par
-- call listeClient();

-- Arguments en entree
DELIMITER |
CREATE PROCEDURE listeClientParVille(IN p_ville VARCHAR(50))
BEGIN
   SELECT cus_id, cus_lastname, cus_firstname, cus_address, cus_city 
   FROM customers
   WHERE cus_city = p_ville;
END |
DELIMITER ;
-- Appel par
-- call listeClientParVille('Amiens');

-- Plusieurs arguments en entrée
DELIMITER |
-- remarquez l'absence de sens (mention IN par défaut)
CREATE PROCEDURE ajoutCategorie(
    p_cat_name VARCHAR(50), 
    p_cat_parent_id INT(10)
)
BEGIN
   INSERT INTO categories(cat_name, cat_parent_id) VALUES (p_cat_name, p_cat_parent_id);
END |
DELIMITER ;
-- Appel par
-- CALL ajoutCategorie('Salons de jardin', 7);

-- Procedure stockee avec parametres de sortie
DELIMITER |
-- remarquez l'absence de sens (mention IN par défaut)
CREATE PROCEDURE calculTotal(
    p_produit_id VARCHAR(50), 
    OUT p_total INT(10)
)
BEGIN
   SELECT SUM(ode.ode_unit_price * ode.ode_quantity) INTO p_total
   FROM orders_details as ode
   JOIN products as p on p.pro_id = ode.ode_pro_id
   JOIN orders as ord on ord.ord_id = ode.ode_ord_id
   JOIN customers as c on c.cus_id = ord.ord_cus_id
   WHERE p.pro_id = p_produit_id;
END |
DELIMITER ;
-- Appel par
-- CALL calculTotal(7, @total);
-- SELECT @total AS 'prix total';

-- Exemple avec parametres sortants
DELIMITER |
CREATE PROCEDURE calculTotalProduit(
    p_produit_id VARCHAR(50), 
    OUT p_nom_produit VARCHAR(50), 
    OUT p_total INT(10)
)
BEGIN
   SELECT p.pro_name, SUM(ode.ode_unit_price * ode.ode_quantity) INTO p_nom_produit, p_total
   FROM orders_details AS ode
   JOIN products AS p ON p.pro_id = ode.ode_pro_id
   JOIN orders AS ord ON ord.ord_id = ode.ode_ord_id
   JOIN customers AS c ON c.cus_id = ord.ord_cus_id
   WHERE p.pro_id = p_produit_id;
END |
DELIMITER ;
-- CALL calculTotalProduit(19, @produit, @total);
-- SELECT @produit AS produit, @total AS 'prix total';

-- Procédure stockée avec paramètre(s) en entrée/sortie
DELIMITER |
CREATE PROCEDURE calculMontantFacture(
    IN p_order_id INT(10),
    INOUT p_total INT(10)
)
BEGIN
    SELECT p_total + (ode.ode_unit_price * ode.ode_quantity) INTO p_total
    FROM orders_details AS ode
    JOIN orders AS o ON o.ord_id = ode.ode_ord_id
    JOIN customers AS c ON c.cus_id = o.ord_cus_id
    WHERE o.ord_id = p_order_id;
END |
DELIMITER ;

-- Appel
SET @prix = 0; -- On initialise @prix à 0
CALL calculMontantFacture (13, @prix); -- Achat de Rouquine
SELECT @prix AS prix_intermediaire;
CALL calculMontantFacture (24, @prix); -- Achat de Cartouche
SELECT @prix AS prix_intermediaire;
CALL calculMontantFacture (42, @prix); -- Achat de Bilba
SELECT @prix AS prix_intermediaire;
CALL calculMontantFacture (61, @prix); -- Achat de Mimi
SELECT @prix AS total;

-- Procédure stockée avec déclaration de variable(s)
DELIMITER |
CREATE PROCEDURE ajoutFournisseur(
    IN p_nom VARCHAR(50), 
    IN p_countries_id CHAR(2),  
    IN p_address VARCHAR(150),
    IN p_zipcode VARCHAR(5),  
    IN p_contact VARCHAR(100),  
    IN p_phone VARCHAR(10),  
    IN p_mail VARCHAR(75)
)
BEGIN
   DECLARE v_ville VARCHAR (50);
   SET v_ville = 'Amiens';   

   INSERT INTO suppliers(sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail) VALUES (p_nom, v_ville, p_countries_id, p_address, p_zipcode, p_contact, p_phone, p_mail);
END |
DELIMITER ;
-- Appel par
-- Ajout d'un fournisseur
call ajoutFournisseur('Roses Aux Bois','FR','Parvis de la cathédrale','80000','Helene Enaff','0304050708','alain@deloin.fr');

-- Procédure stockée avec déclaration de variable(s)
DELIMITER $$
DROP PROCEDURE IF EXISTS verifClient $$
CREATE PROCEDURE verifClient(IN p_nom VARCHAR(50), 
                             IN p_prenom VARCHAR(50), 
                             IN p_adresse VARCHAR(150),
                             IN p_cp VARCHAR(5),
                             IN p_ville VARCHAR(50),
                             IN p_countries_id CHAR(2),
                             IN p_mail VARCHAR(255),
                             IN p_phone VARCHAR(10), 
                             IN p_password VARCHAR (60)
                             )  

BEGIN
  -- On déclare une variable p_existe qui stockera le résultat d'une requête 
  DECLARE p_existe varchar(50); 

  SET p_existe = (SELECT p_nom 
                  FROM customers 
                  WHERE cus_lastname = p_nom 
                  AND cus_firstname = p_prenom 
                  AND cus_address = p_adresse 
                  AND cus_zipcode = p_cp 
                  AND cus_city = p_ville 
                  AND cus_countries_id = p_countries_id 
                  AND cus_mail = p_mail
                  AND cus_phone = p_phone
                  AND cus_password = p_password  
                  );
  IF ISNULL(p_existe) 
  THEN
     -- la variable p_existe vaut NULL, le client n'existe pas en base
     -- on peut l'ajouter 
     INSERT INTO customers (cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city,  cus_countries_id, cus_mail, cus_phone, cus_password, cus_add_date) VALUES (p_nom, p_prenom, p_adresse, p_cp, p_ville, p_countries_id, p_mail, p_phone, p_password, NOW() );
   ELSE
      -- la variable p_existe n'est pas NULL, donc le client existe déjà en base
      -- on lève une erreur personNalisée avec l'instruction SIGNAL SQLSTATE (code 45000)           
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le client existe déjà';
   END IF;
END $$
DELIMITER ;
-- Appel par
-- Testons avec un nouveau client :
CALL verifClient('Despates', 'Ondine', '47 avenue Patrick Sébastien', '59280', 'Armentières', 'FR', 'o.despates@barilla.fr', '0102030405', 'az3rty');
-- Vérifier que ce client a bien été ajouté :
-- Et avec un client déjà présent :
SELECT * FROM customers ORDER BY cus_id DESC;
CALL verifClient('Despates', 'Ondine', '47 avenue Patrick Sébastien', '59280', 'Armentières', 'FR', 'o.despates@barilla.fr', '0102030405', 'az3rty');

-- Requêtes utiles
-- Lister les procédures stockées :
SHOW PROCEDURE STATUS
-- Supprimer une procédure :
DROP PROCEDURE nom_procedure