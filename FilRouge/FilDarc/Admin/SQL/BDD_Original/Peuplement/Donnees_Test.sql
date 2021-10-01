-- *****************
-- * ArcheryAmiens *
-- *****************

-- -----------------------------------
-- | Données test pour ArcheryAmiens 
-- | TO DO			      
-- |                         
-- | orders_details
-- | orders
-- | 
-- |                   
-- -----------------------------------

-- Pointe sur la table
USE ArcheryAmiens;

-- Peuplement de la table CATEGORIES

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
("Consommables",NULL),
("Flèches",NULL),
-- Sous catégories, quelques exemples
("Tenues",3),              						  				       ("Ciblerie",4),	
("Tubes nus",7),
("Carquois",3),
("Kits de découverte",1),			                
("Plumes et vannes",6);            			
*/

-- Peuplement de la table SUPPLIERS

--
DELETE FROM suppliers;
--

INSERT INTO suppliers(sup_type,sup_name,sup_address,sup_zipcode,sup_city,sup_country,sup_contact,sup_mail,sup_phone)
-- sup_type : CONSTructeur ou IMPORtateur
VALUES 
("CONST","Hoyt Archery","593, N Wright Brothers Dr","84116","Salt Lake City","USA","Kimberly LOUISE","kimloui@hoyt.com","+18013632990"),
("CONST","Arco Sport Spigarelli","Via Prenestina,252","00177","Roma","Italia","Tonio GUISEPPE","arcosportspigarelli.com","+39062148351"),
("IMPOR","Sporta SAS","32, Rue du Roi","4280","Angre","Belgique","Benoît POELWORTH","sporta@aol.com","+32879654752"),
("IMPOR","SystemArc","8, Av. de la mine, ZA des pins","06200","Nice","France","Jean DARC","jdarc@orange.fr","+33612231436");


-- Peuplement de la table CUSTOMERS

--
DELETE FROM customers;
--

INSERT INTO customers(cus_coefTax,cus_name,cus_lastname,cus_address,cus_zipcode,cus_city,cus_country,cus_mail,cus_phone,cus_login,cus_password,cus_add_date,cus_update_date)
-- cus_coefTax : Taxes en fonction de la catégorie du client : PRO, PARTiculier, ASSociation
VALUES
(20.6,"Marie","WILVIE","32, rue du pendu","80000","Amiens","France","mariwil@sfr.fr","+33678491425","marie","1234","2021-09-16","2021-09-18"),
(20.6,"Sebastien","FLUTE","1, avenue des rives","06200","Nice","France","sebflu@sfr.fr","+33612345678","sflute","1234","2018-02-02","2021-03-10"),
(20.6,"Jacques","VALINDON","3, place des champs","75000","Paris","France","valja@free.fr","+33478965214","jval","1234","2018-07-22","2021-02-02"),
(20.6,"Robin","DUBOIS","7, chemin des sens","13000","Marseille","France","arcclub@free.fr","+33578952142","robin","1234","2012-06-10","2021-03-14");


-- Peuplement de la base PRODUCTS

--
DELETE FROM products;
--

INSERT INTO products(pro_short_lib,pro_long_lib,pro_price,pro_color,pro_name,pro_stock,pro_alertstock,pro_add_date,pro_update_date,pro_available,pro_url_picture,pro_cat_id,pro_sup_id)
VALUES
("Poulie droitier","Hoyt Prevail, année 2020","1200","Rouge","Prevail",2,1,"2020-09-18","2020-09-18",1,"jpg",1,1),
("Viseur gaucher","Arc-systéme SD-10","140","Noir","SD-10",4,1,"2020-03-12","2020-03-12",1,"jpg",2,3),
("Plastron","Plastron Avalon, droitier","10.50","Blanc","Plastron Avalon",5,1,"2020-01-10","2020-01-10",1,"jpg",3,4),
("Chronotir","Chronotir et feux","2000","Noir","Chronotir",0,1,"2018-03-11","2020-07-05",0,"jpg",4,4),
("Empenneuse","Empenneuse SPIGA","35","Bleue","EMP-SPIGA",5,1,"2020-03-01","2020-03-01",1,"jpg",5,2),
("Colle","Colle Fletchtite","3.50","-","Fletchtite",5,3,"2020-09-18",NULL,1,"jpg",6,1),
("Lot tubes","Tubes ACC, lot de 12","80","-","ACC Easton",2,1,"2021-06-10",NULL,1,"jpg",7,1),
("T-Shirt","T-Shirt Ukkha","39.90","Blanc","Ukkha",4,2,"2021-02-14",NULL,1,"jpg",8,3),
("Cible","Cible mousse booster","250","Noir","Booster",4,2,"2021-02-02",NULL,1,"jpg",9,3),
("Tubes Nus","Alu, débutants","40","-","Easton Jazz",0,1,"2021-02-05",NULL,0,"jpg",10,1),
("Carquois","Carquois droitier, cuir","90","Cuir","Carquois",1,1,"2021-03-08","2021-03-08",1,"jpg",11,2),
("Kit","Kit classique, découverte.","130","Jaune","Kit découverte",2,1,"2021-03-03","2021-03-03",1,"jpg",12,2),
("Plumes","Elivannes XS, sachet de 50","15","Bleues","Elivannes",4,2,"2020-01-01","2021-10-03",1,"jpg",13,1);

