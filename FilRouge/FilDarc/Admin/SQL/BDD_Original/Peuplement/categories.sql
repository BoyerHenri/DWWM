-- *****************
-- * ArcheryAmiens *
-- *****************

-- Peuplement de la table categories
USE ArcheryAmiens;

-- 
DELETE FROM categories;
--

INSERT INTO categories(cat_name,cat_sub_id)
VALUES 
-- Catégories parentes, quelques exemples
("Arcs",NULL),							                
("Equipements de l'arc",NULL),		                    
("Equipements de l'archer",NULL),         				
("Vie du club",NULL),             					    
("Outillages",NULL),  
("Consommables",2),
("Flèches",NULL),
-- Sous catégories, quelques exemples
("Tenues",3),              						    					                        
("Ciblerie",4),	
("Tubes nus",7),
("Carquois",3),
("Kits de découverte",1),			                
("Plumes et vannes",6);            			

