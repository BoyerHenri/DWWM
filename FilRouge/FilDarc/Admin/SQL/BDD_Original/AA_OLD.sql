-- ***************** 
-- *Initialisations*
-- *****************

-- Nuke sur la base si elle existe
DROP DATABASE IF EXISTS ArcheryAmiens;
-- Cree et pointe sur la base ainsi créee
CREATE DATABASE ArcheryAmiens;
USE ArcheryAmiens;

-- ********
-- *Tables*
-- ********

CREATE TABLE suppliers(                                                                      --
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
   PRIMARY KEY(sup_id)
);

CREATE TABLE categories(                                                                     --
   cat_id INT(10) NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(30) NOT NULL,
   cat_sub_id SMALLINT, -- Sous catégorie
   cat_sub_name VARCHAR(30) NOT NULL,
   PRIMARY KEY(cat_id)
);

CREATE TABLE customers(                                                                      --
   cus_id INT(10) NOT NULL AUTO_INCREMENT,
   cus_coef DECIMAL(4,2), -- Coefficient en fonction de la catégorie du client (pro ou particulier)
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

CREATE TABLE orders( 										--
   order_id INT(10) NOT NULL AUTO_INCREMENT,
   order_order_date DATETIME,
   order_paid_date DATETIME,
   order_send_date DATETIME,
   order_receive_date DATETIME,
   order_send_address TEXT,
   order_send_billing TEXT,
   cus_id INT(10) NOT NULL,
   PRIMARY KEY(order_id),
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE products(										--
   pro_id INT(10) NOT NULL AUTO_INCREMENT,
   pro_short_lib VARCHAR(25), -- Libellé court
   pro_long_lib VARCHAR(50), -- lib long (description)
   pro_price DECIMAL(7,2), -- forme : 00000,00 € Hors taxe
   pro_stock SMALLINT,
   pro_alertstock SMALLINT,
   pro_available SMALLINT, -- 0 : Desactivé. 1 : Actif.
   pro_urlpicture CHAR(100) NOT NULL,
   cat_id INT(10) NOT NULL,
   sup_id INT(10) NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);

CREATE TABLE orders_details(									--
   ordetails_id INT(10) NOT NULL AUTO_INCREMENT,
   ordetails_quantity SMALLINT,
   ordetails_unit_price DECIMAL(6,2),
   ordetails_discount DECIMAL(4,2),
   ordetails_payment CHAR(4), -- IMM ou DIF
   pro_id INT(10) NOT NULL,
   order_id INT(10) NOT NULL,
   PRIMARY KEY(ordetails_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id),
   FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
