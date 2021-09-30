-- ***************** 
-- *Initialisations*
-- *****************

-- Nuke sur la base si elle existe
DROP DATABASE IF EXISTS ArcheryAmiens;
CREATE DATABASE ArcheryAmiens;
USE ArcheryAmiens;

-- ********
-- *Tables*
-- ********

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers(
   sup_id INT(10) NOT NULL AUTO_INCREMENT,
   sup_type CHAR(5), -- CONST ou IMPOR
   sup_name VARCHAR(50) NOT NULL,
   sup_address VARCHAR(50) NOT NULL,
   sup_zipcode VARCHAR(10) NOT NULL,
   sup_city VARCHAR(30) NOT NULL,
   sup_country VARCHAR(30) NOT NULL,
   sup_contact VARCHAR(30) NOT NULL,
   sup_mail VARCHAR(50),
   sup_phone VARCHAR(30),
   --
   PRIMARY KEY(sup_id)
);

--

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories(
   cat_id INT(10) NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(50) NOT NULL,
   cat_sub_id INT(10), -- Sous catégorie ID
   --
   PRIMARY KEY(cat_id),
   KEY cat_sub_id(cat_sub_id)
);

--

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
   cus_id INT(10) NOT NULL AUTO_INCREMENT,
   cus_coefTax DECIMAL(4,2), -- Coefficient TAXES en fonction de la catégorie du client (pro ou particulier)
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
   --
   PRIMARY KEY(cus_id),
   UNIQUE(cus_login)
);

--
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
   orders_id INT(10) NOT NULL AUTO_INCREMENT,
   orders_cus_id INT(10),
   orders_order_date DATETIME,
   orders_paid_date DATETIME,
   orders_send_date DATETIME,
   orders_receive_date DATETIME,
   orders_send_address TEXT,
   orders_send_billing TEXT,
   --
   PRIMARY KEY(orders_id),
   FOREIGN KEY(orders_cus_id) REFERENCES customers(cus_id)
);

--
DROP TABLE IF EXISTS products;
CREATE TABLE products(										
   pro_id INT(10) NOT NULL AUTO_INCREMENT,
   pro_short_lib VARCHAR(25), -- Libellé court
   pro_long_lib VARCHAR(50), -- Libellé long (description)
   pro_price DECIMAL(7,2), -- Forme : 00000,00 € Hors Taxe
   pro_color VARCHAR(50),
   pro_name VARCHAR(50),
   pro_stock SMALLINT,
   pro_alertstock SMALLINT,
   pro_add_date DATETIME,
   pro_update_date DATETIME,
   pro_available SMALLINT, -- 0 : Desactivé. | 1 : Actif.
   pro_url_picture CHAR(100) NOT NULL,
   pro_cat_id INT(10),
   pro_sup_id INT(10),
   --
   PRIMARY KEY(pro_id),
   FOREIGN KEY(pro_cat_id) REFERENCES categories(cat_id),
   FOREIGN KEY(pro_sup_id) REFERENCES suppliers(sup_id)
);

--
DROP TABLE IF EXISTS orders_details;
CREATE TABLE orders_details(
   orders_details_id INT(10) NOT NULL AUTO_INCREMENT,
   orders_details_pro_id INT(10),
   orders_details_orders_id INT(10),
   orders_details_quantity SMALLINT,
   orders_details_unit_price DECIMAL(6,2),
   orders_details_discount DECIMAL(4,2),
   orders_details_payment CHAR(4), -- IMMédiat ou DIFféré
   --
   PRIMARY KEY(orders_details_id),
   FOREIGN KEY(orders_details_pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(orders_details_orders_id) REFERENCES orders(orders_id)
);



