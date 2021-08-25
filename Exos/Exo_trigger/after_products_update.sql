DROP TRIGGER IF EXISTS commander_articles;
DELIMITER |
    CREATE TRIGGER commander_articles
    AFTER UPDATE ON products
    FOR EACH ROW
    BEGIN
        -- DECLARATIONS
        DECLARE date_c DATE;
        DECLARE codart_c INT;
        DECLARE qte_c INT;
        DECLARE pro_stock_c INT;
        SELECT pro_id INTO codart_c FROM products WHERE codart_c=old.pro_id;
        SELECT pro_stock INTO pro_stock_c FROM products WHERE pro_stock_c=old.pro_stock;
        -- SETTINGS
        SET date_c=CURDATE();
        SET codart_c=new.pro_id;
        SET qte_c=25;
        --
        INSERT INTO commander_articles(codart,qte,`date`)
        --
        --
        VALUES(codart_c,qte_c,date_c);     
    END |
DELIMITER ;
-- UPDATE `products` SET `pro_price` = '11' WHERE `products`.`pro_id` = 29
-- UPDATE `products` SET `pro_stock` = '11' WHERE `products`.`pro_id` = 29

-- Création de la table Erreur
CREATE TABLE Erreur (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    erreur VARCHAR(255) UNIQUE);

-- Insertion de l'erreur qui nous intéresse
INSERT INTO Erreur (erreur) VALUES ('Erreur : sexe doit valoir "M", "F" ou NULL.');

-- Création du trigger
DELIMITER |
CREATE TRIGGER before_insert_animal BEFORE INSERT
ON Animal FOR EACH ROW
BEGIN
    IF NEW.sexe IS NOT NULL   -- le sexe n'est ni NULL
    AND NEW.sexe != 'M'       -- ni "M"
    AND NEW.sexe != 'F'       -- ni "F"
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : sexe doit valoir "M", "F" ou NULL.');
    END IF;
END |
DELIMITER ;


-- DECLARE sto_art_alert_c INT;
        -- DECLARE sto_art_c INT;
        -- DECLARE qte_co_c INT;
           
        -- DECLARE tot DOUBLE;
        -- SET
        -- SET id_c=codart;
        -- SET sto_art_alert_c=products.pro_stock_alert;
        -- SET @sto_art_alert_c=1;
        -- SELECT @sto_art_alert_c, pro_stock_alert FROM products;
        -- SET sto_art_alert_c=666;
        -- SET sto_art_c=pro_stock;

              -- SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        -- UPDATE commande SET total=tot WHERE id=id_c; -- on stock le total dans la table commande
        -- IF OLD.sto_art_c<OLD.sto_art_alert_c
            -- NEW.qte_co_c=OLD.sto_art_alert_c-OLD.sto_art_c;

            -- ENDIF;

