-- *****************
-- * ArcheryAmiens *
-- *****************

-- Peuplement de la table categories
USE ArcheryAmiens;

-- 
DELETE FROM categories;
--

INSERT INTO categories(cat_name,cat_sub_id,cat_sub_name)
VALUES 
("Arcs.",1,"Arcs."),							-- 1
("Accessoires, arc.",2,"Accessoires."),				-- 2
("Accessoires, archer.",2,"Accessoires."),				-- 3
("Vie de club.",2,"Accessoires."),					-- 4
("Tenues.",3,"Accessoires."),						-- 5
("Flèches.",2,"Accessoires."),					-- 6
("Accessoires, flèches",6,"Accessoires."),				-- 7
("Outillages, consommables.",4,"Accessoires.");			-- 8

