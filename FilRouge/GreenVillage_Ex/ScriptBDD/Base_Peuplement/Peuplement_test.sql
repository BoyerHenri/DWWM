-- Pointe sur la base de données
use green_village;

-- Efface les données préalables pour test : évite d'incrémenter inutilement les doublons, et remet l'incrément à zéro
/*
SET FOREIGN_KEY_CHECKS=0;
    TRUNCATE TABLE products;
    TRUNCATE TABLE suppliers;
    TRUNCATE TABLE categories;
    TRUNCATE TABLE catteam;
    TRUNCATE TABLE customers;
    TRUNCATE TABLE sellers;
    TRUNCATE TABLE orders;
    TRUNCATE TABLE orders_details;
    TRUNCATE TABLE storage_orders;
    TRUNCATE TABLE aftersale;
    TRUNCATE TABLE accounting;
SET FOREIGN_KEY_CHECKS=1;
*/

-- **********************
-- *Table Test SUPPLIERS*
-- **********************

-- Efface les données préalables pour test 
DELETE FROM suppliers;
--
insert into suppliers(sup_type,sup_name,sup_address,sup_zipcode,sup_city,sup_country,sup_contact,sup_mail,sup_phone)
values ('IMPOR','ChinaSounds','3, Ping Pong Avenue','99300','Hyan','China','Li Tchou Long','lichou@chinas.si','9854247854'),
('CONST','Aux Chants, luthier','1, Chemin de l eglise','83000','Briançon','France','Hugues CAPET','hugcap@aol.fr','0620145295'),
('IMPOR','Deutch Music','5, Reichtag Obtenkommandatur','99520','Berlin','Allemagne','Hanz Schultz','schthanz@yahoo.de','2147986575');

-- ***********************
-- *Table Test CATEGORIES*
-- ***********************
-- Efface les données préalables pour test 
DELETE FROM categories;
--
insert into categories(cat_name,cat_sub_id,cat_sub_name)
values('Divers',1,'Divers'),
('Instruments à cordes',2,'Guitare'),
('Cuivres',2,'Instruments à vent');

-- **********************
-- *Table Test CUSTOMERS*
-- **********************
-- Efface les données préalables pour test 
DELETE FROM customers;
--
insert into customers(cus_coef,cus_name,cus_lastname,cus_address,cus_zipcode,cus_city,cus_country,cus_mail,cus_phone,cus_login,cus_password,cus_add_date,cus_update_date)
values (20,'DULAC','Lancelot','Chatêau Kaamelot','99745','Londres','Angleterre','lancdu@kaam.uk','9955776633','kingarthur','123456','2008-08-20','2008-08-20'),
(20,'DALTON','Arwell','Chemin du pénitencier','06200','Nice','France','daltonarw@aol.com','0615231436','jaifaim','456789','2010-12-05','2010-12-05'),
(10,'BRASSENS','Georges','Conservatoire de Lyon','69200','Lyon','France','gorille@gare.fr','0179325478','geobra','000000','2020-06-12','2020-06-12');

-- *********************
-- *Table test PRODUCTS*
-- *********************
DELETE FROM products;
--
insert into products(pro_short_lib,pro_long_lib,pro_price,pro_stock,pro_alertstock,pro_available,pro_urlpicture)
values ('Triangle','Idéal pour débuter, fabrication artisanale',75.50,10,2,1,'../images_prod/triangle.png'),
('Guitare','Style vintage, disponible en gaucher',175.00,4,1,1,'../images_prod/guit_web.png'),
('Cor de chasse','Trés à la mode à la campagne',450.00,2,0,1,'../images_prod/cor_chasse.png');

-- ********************
-- *Table Test ORDERS*
-- ********************
-- Efface les données préalables pour test 
DELETE FROM orders;
--
insert into orders(order_order_date,order_paid_date,order_send_date,order_receive_date,order_send_address,order_send_billing)
values ('2012-02-04','2012-02-04','2012-04-04','2012-03-04','Addresse client','Addresse client'),
('2020-06-08','2020-06-08','2020-07-08','2020-09-08','Camping la Prison 5,Rue de la Bastille 75000 Paris','Addresse Client'),
('2021-08-02','2021-09-03','2021-08-02','2021-08-08','Conservatoire de Lyon, Avenue Matisse 69200 Lyon','Mairie de Lyon, rue du Bouffon 69200 Lyon');

-- ***************************
-- *Table Test ORDERS DETAILS*
-- ***************************
-- Efface les données préalables pour test 
DELETE FROM orders_details;
--
insert into orders_details(ordetails_quantity,ordetails_unit_price,ordetails_discount,ordetails_payment)
values (1,75.50,0,'IMM'),
(3,450.00,10,'IMM'),
(2,175.00,0,'DIF');























