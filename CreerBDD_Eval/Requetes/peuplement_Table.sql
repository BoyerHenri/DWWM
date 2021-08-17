USE gescom_struct;

-- Table catégories
DELETE FROM `categories`;
INSERT INTO `categories`(`cat_id`,`cat_name`,`cat_parent_id`)
VALUES                  (4,'barbecues',NULL),
                        (6,'outils',3);

-- Table customers
DELETE FROM `customers`;
INSERT INTO  `customers`(cus_id,cus_lastname,cus_firstname,cus_address,cus_zipcode,cus_city,cus_countries_id,cus_mail,cus_phone,cus_password,cus_add_date,cus_update_date)
VALUES                  (1,'Tony','MONTANA','4, Rue de la mafia','06200','Nice','France','don.corleone@mafia.fr','0301020405','cocaine','2020-12-12 12:12:12','2020-12-12 12:12:12'),
                        (2,'Eric','CARTMAN','1, Av du Porc','80000','Amiens','France','eric.cartman@sou.com','0405010708','suif','2008-06-03 17:20:35','2008-06-03 17:20:35');

-- Table employees
DELETE FROM `employees`;
INSERT INTO `employees`(emp_id,emp_superior_id,emp_pos_id,emp_lastname,emp_firstname,emp_address,emp_zipcode,emp_city,emp_mail,emp_phone,emp_salary,emp_enter_date,emp_gender,emp_children )
VALUES                 (1,NULL,1,'Joe','MENTEUR','3 Rue des hirondelles','80000','Amiens','hiasl@caramail.fr','0301040506','5000','2020-20-12 12:12:12','m',1),
                       (2,1,2,'July','BOUFFON','A la rue','13000','Marseille','carote@sfr.fr','0504060802','50','2010-5-5 8:8:30','f',7);

-- Table orders
DELETE FROM `orders`;
INSERT INTO `orders`(ord_id,ord_order_date,ord_payment_date,ord_ship_date,ord_reception_date,ord_status, ord_cus_id)
VALUES              (1,'2000-03-21 03:03:03','2010-04-25 03:03:03','2018-05-15 03:03:03','2003-02-11 03:03:03',NULL,5),
                    (2,'2012-10-17 03:03:03','2003-07-17 03:03:03','2011-04-10 03:03:03','2001-11-11 03:03:03', 'Client génant',7);

-- Table posts
DELETE FROM `posts`;
INSERT INTO `posts`(pos_id,pos_libelle)
VALUES             (1,'Maître Dieu Roi Président'),
                   (2,'Esclave');

-- Table suppliers
DELETE FROM `suppliers`;
INSERT INTO `suppliers`(sup_id,sup_name,sup_city,sup_countries_id,sup_address,sup_zipcode,sup_contact,sup_phone,sup_mail)
VALUES                 (1,'La Touffe','Marseille','France','10, rue des pendus','75000','Robert DeNiro','0201040699','ala@rue.fr'),
                       (2,'LES TONTONS RASEURS','Perpignan','France','24 chemin des écorchés','20000','Ston Anatopoulos','0608070201','kegab.grec@tomate.fr');