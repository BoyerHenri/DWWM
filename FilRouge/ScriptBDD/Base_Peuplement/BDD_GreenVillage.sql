-- ***************** 
-- *Initialisations*
-- *****************

-- Nuke sur la base si elle existe
DROP DATABASE IF EXISTS green_village;
-- Cree et pointe sur la base ainsi créee
CREATE DATABASE green_village;
USE green_village;

-- ********
-- *Tables*
-- ********

-- Produits
CREATE TABLE products(
   pro_id SMALLINT NOT NULL AUTO_INCREMENT,
   -- Id Fournisseur
   pro_sup_id SMALLINT, 
   -- Id catgories
   pro_cat_id SMALLINT, 
   -- Libellé court
   pro_short_lib VARCHAR(25),
   -- Lib long (description) 
   pro_long_lib VARCHAR(50),
   -- forme : 00000,00 € Hors taxe
   pro_price DECIMAL(7,2), 
   pro_stock SMALLINT,
   pro_alertstock SMALLINT,
   -- 0 : Desactivé. 1 : Actif.
   pro_available SMALLINT, 
   pro_urlpicture CHAR(100) NOT NULL,
   PRIMARY KEY(pro_id)
);

-- Grossistes
CREATE TABLE suppliers(
   sup_id SMALLINT NOT NULL AUTO_INCREMENT,
   -- CONST ou IMPOR
   sup_type CHAR(5), 
   sup_name VARCHAR(50) NOT NULL,
   sup_address VARCHAR(50) NOT NULL,
   sup_zipcode VARCHAR(10) NOT NULL,
   sup_city VARCHAR(30) NOT NULL,
   sup_country VARCHAR(30) NOT NULL,
   sup_contact VARCHAR(30) NOT NULL,
   sup_mail VARCHAR(50),
   sup_phone VARCHAR(30),
   PRIMARY KEY(sup_id)
);

-- Categories
CREATE TABLE categories(
   cat_id SMALLINT NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(30) NOT NULL,
   -- Sous catégorie
   cat_sub_id SMALLINT, 
   cat_sub_name VARCHAR(30) NOT NULL,
   PRIMARY KEY(cat_id)
);

-- Equipe vitrine & catalogue
CREATE TABLE catteam(
   catteam_id SMALLINT NOT NULL AUTO_INCREMENT,
   catt_order_id SMALLINT,
   catt_name VARCHAR(25) NOT NULL,
   catt_firstname VARCHAR(25) NOT NULL,
   catt_mail VARCHAR(25),
   catt_phone VARCHAR(25),
   PRIMARY KEY(catteam_id)
);

-- Clients
CREATE TABLE customers(
   cus_id SMALLINT NOT NULL AUTO_INCREMENT,
   -- Coefficient en fonction de la catégorie du client (pro ou particulier)
   cus_coef DECIMAL(4,2), 
   cus_name VARCHAR(50) NOT NULL,
   cus_lastname VARCHAR(50) NOT NULL,
   cus_address VARCHAR(50) NOT NULL,
   cus_zipcode VARCHAR(10) NOT NULL,
   cus_city VARCHAR(30) NOT NULL,
   cus_country VARCHAR(30) NOT NULL,
   cus_mail VARCHAR(50),
   cus_phone VARCHAR(30),
   cus_login VARCHAR(30) NOT NULL,
   cus_password VARCHAR(30) NOT NULL,
   cus_add_date DATETIME NOT NULL,
   cus_update_date DATETIME,
   PRIMARY KEY(cus_id),
   UNIQUE(cus_login)
);

-- Commerciaux
CREATE TABLE sellers(
   seller_id SMALLINT NOT NULL AUTO_INCREMENT,
   seller_name VARCHAR(25) NOT NULL,
   seller_firstname VARCHAR(25) NOT NULL,
   seller_mail VARCHAR(25),
   seller_phone VARCHAR(25),
   -- PRO ou PAR
   seller_cat CHAR(5), 
   PRIMARY KEY(seller_id)
);

-- Commandes
CREATE TABLE orders(
   order_id SMALLINT NOT NULL AUTO_INCREMENT,
   order_cus_id SMALLINT,
   order_order_date DATETIME,
   order_paid_date DATETIME,
   order_send_date DATETIME,
   order_receive_date DATETIME,
   order_send_address TEXT,
   order_send_billing TEXT,
   PRIMARY KEY(order_id)
);

CREATE TABLE orders_details(
   ordetails_id SMALLINT NOT NULL AUTO_INCREMENT,
   ordetails_quantity SMALLINT,
   ordetails_unit_price DECIMAL(6,2),
   ordetails_discount DECIMAL(4,2),
   -- IMM ou DIF
   ordetails_payment CHAR(4), 
   ordetails_orders_id SMALLINT,
   ordetails_product_id SMALLINT,
   PRIMARY KEY(ordetails_id)
);

-- *****************
-- *Services divers*
-- *****************

-- S.A.V.
CREATE TABLE aftersale(
   aft_cus_id SMALLINT NOT NULL AUTO_INCREMENT,
   aft_name VARCHAR(25) NOT NULL,
   aft_firstname VARCHAR(25) NOT NULL,
   aft_mail VARCHAR(25),
   aft_phone VARCHAR(25),
   -- PRO ou PAR
   aft_cat CHAR(5), 
   PRIMARY KEY(aft_cus_id)
);

-- Comptabilité
CREATE TABLE accounting(
   acc_cus_id SMALLINT NOT NULL AUTO_INCREMENT,
   acc_name VARCHAR(25) NOT NULL,
   acc_firstname VARCHAR(25) NOT NULL,
   acc_mail VARCHAR(25),
   acc_phone VARCHAR(25),
   -- PRO ou PAR
   acc_cat CHAR(5), 
   PRIMARY KEY(acc_cus_id)
);

-- Commandes grossistes via equipe catalogue
CREATE TABLE storage_orders(
   sto_sup_id SMALLINT NOT NULL AUTO_INCREMENT,
   sto_sup_date DATETIME NOT NULL,
   sto_sup_paid_date DATETIME NOT NULL,
   sto_sup_send_date DATETIME NOT NULL,
   sto_sup_receive_date DATETIME NOT NULL,
   PRIMARY KEY(sto_sup_id)
);

-- **********************
-- *Contraintes et liens*
-- **********************

CREATE TABLE selling(
   pro_id SMALLINT,
   sup_id SMALLINT,
   PRIMARY KEY(pro_id, sup_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);

CREATE TABLE belongs(
   pro_id SMALLINT,
   cat_id SMALLINT,
   PRIMARY KEY(pro_id, cat_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id)
);

CREATE TABLE manage(
   pro_id SMALLINT,
   catteam_id SMALLINT,
   PRIMARY KEY(pro_id, catteam_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(catteam_id) REFERENCES catteam(catteam_id)
);

CREATE TABLE fill(
   catteam_id SMALLINT,
   sto_sup_id SMALLINT,
   PRIMARY KEY(catteam_id, sto_sup_id),
   FOREIGN KEY(catteam_id) REFERENCES catteam(catteam_id),
   FOREIGN KEY(sto_sup_id) REFERENCES storage_orders(sto_sup_id)
);

CREATE TABLE support(
   cus_id SMALLINT,
   seller_id SMALLINT,
   acc_cus_id SMALLINT,
   aft_cus_id SMALLINT,
   PRIMARY KEY(cus_id, seller_id, acc_cus_id, aft_cus_id),
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id),
   FOREIGN KEY(seller_id) REFERENCES sellers(seller_id),
   FOREIGN KEY(acc_cus_id) REFERENCES accounting(acc_cus_id),
   FOREIGN KEY(aft_cus_id) REFERENCES aftersale(aft_cus_id)
);

CREATE TABLE take(
   cus_id SMALLINT,
   order_id SMALLINT,
   PRIMARY KEY(cus_id, order_id),
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id),
   FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

CREATE TABLE specify(
   order_id SMALLINT,
   ordetails_id SMALLINT,
   PRIMARY KEY(order_id, ordetails_id),
   FOREIGN KEY(order_id) REFERENCES orders(order_id),
   FOREIGN KEY(ordetails_id) REFERENCES orders_details(ordetails_id)
);

CREATE TABLE concern(
   pro_id SMALLINT,
   ordetails_id SMALLINT,
   PRIMARY KEY(pro_id, ordetails_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(ordetails_id) REFERENCES orders_details(ordetails_id)
);

CREATE TABLE send(
   sup_id SMALLINT,
   sto_sup_id SMALLINT,
   PRIMARY KEY(sup_id, sto_sup_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id),
   FOREIGN KEY(sto_sup_id) REFERENCES storage_orders(sto_sup_id)
);