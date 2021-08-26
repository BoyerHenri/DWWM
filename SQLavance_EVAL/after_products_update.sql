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
        DECLARE pro_stock_alert_c INT;
        DECLARE qte_a_comm INT;

        -- SETTINGS
        SET date_c=CURDATE();
        SET pro_stock_c=new.pro_stock;
        SET pro_stock_alert_c=new.pro_stock_alert;
        SET codart_c=new.pro_id;
        SET qte_a_comm=pro_stock_alert_c-pro_stock_c;
        
        -- Condition de remplissage TRUE
        IF pro_stock_c<pro_stock_alert_c
        THEN
            SET qte_c=qte_a_comm;
            INSERT INTO commander_articles(codart,qte,`date`)
            VALUES(codart_c,qte_c,date_c);  
        END IF;   
    END |
DELIMITER ;
-- Test
UPDATE `products` SET `pro_stock` = '1' WHERE `products`.`pro_id` = 8

