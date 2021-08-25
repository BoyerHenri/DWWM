-- ******************
-- *commande-produit*
-- ******************

-- Dans cette base de données, la table commande possède un champ total pour stocker le total de la commande.
-- Lorsque vous ajoutez ou modifiez des produits dans la commande (avec la table lignedecommande), vous devez penser à 
-- recalculer le total de la commande et mettre à jour le champ total.
-- C'est exactement pour ca que les déclencheurs ont été créés.
-- Nous pourrions mettre en place un déclencheur sur la table lignedecommande, qui va se charger de recalculer 
-- le total puis mettre à jour la table commande.
DELIMITER |
    CREATE TRIGGER maj_total 
    AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stock le total dans la table commande
    END |
DELIMITER ;

INSERT INTO lignedecommande(id_commande,id_produit,quantite,prix)
-- values (4,2,10,200) -- Pas d'id donc echec
values (1,2,10,200) -- Choisir une commande qui exitse

--DELETE
DROP TRIGGER IF EXISTS maj_total_bis;
DELIMITER |
    CREATE TRIGGER maj_total_bis
    AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stock le total dans la table commande
    END |
DELIMITER ;
DELETE FROM `lignedecommande` WHERE `id_commande`=2;

--UPDATE
DROP TRIGGER IF EXISTS maj_total_ter;
DELIMITER |
    CREATE TRIGGER maj_total_bis
    AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stock le total dans la table commande
    END |
DELIMITER ;
