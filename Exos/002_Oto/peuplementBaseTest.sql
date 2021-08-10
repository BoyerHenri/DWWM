USE Oto;
 
-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE client;
-- Test Ajout Client
INSERT INTO client(request_client,name_client,lastName_client,mail_client,phoneNumber_client,status_client,adress_client,zipCode_client,city_client,country_client)
VALUES            ('achat vehicule','ARTHUR','Roi','','0612324520','PART','3, Rue Bis','80000','Kaamelot','Angleterre'),
                  ('options','KARADOC','Lucien','','0722429570','PRO','30, Avenue des pendus','75000','St Just','France'),
 				  ('accessoires','JOSETTE','Lucienne','luciennejo@caramail.com','0612142336','PART','7, chemin des dahus','06200','Vesubie','France'),
 				  ('reparations','TONY','Montana','','099555927','PRO','112,Via Cabra','32178','Roma','Italy'),
				  ('pose','VICTOR','Nettoyeur','servicessecrets@gouf.fr','0615231436','PART','50, Avenue des palmiers','62000','St Omer','France'),
				  ('entretien','HECTOR','Humungus','','0482181666','PRO','3 ZI les montieres','13600','Marseille','France');

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE commercial;				  
-- Test Ajout Commerciaux
INSERT INTO commercial(spe_commercial,name_commercial,lastName_commercial,mail_commercial,phone_commercial)
VALUES 				  ('PART','CONVENANT','Jean-Claude','JC@oto.fr','0301052485'),
					  ('PRO','N GOBO','Lucienne','ngobo@oto.fr','0204052389');

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE buyVehicles;	  
-- Test Ajout SERVICE VENTES buyVehicles
INSERT INTO buyVehicle(buy_date,buy_funding,id_storageVehicles)
VALUES				   ('2008-12-10 12:12:23','CRED',1),
					   ('2012-05-03 15:26:12','COMPT',2),
					   ('2021-05-12 17:12:58','COMPT',3),
					   ('1932-03-01 16:23:22','COMPT',4),
					   ('2000-11-01 14:52:32','CRED',5);
  
-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE maintenance;
-- Test Ajout SERVICE ATELIER maintenance
INSERT INTO maintenance(id_technician,type_maintenance,price_maintenance,date_maintenance)
VALUE				   (1,'ATELIER',200,'2008-12-10 12:12:23');

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE repair;
-- Test Ajout SERVICE ATELIER repair
INSERT INTO repair(type_repair,price_repair,date_repair)
VALUE			  ('CONFORMITE',0,'2008-12-10 12:12:23');

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE storedProducts;
-- Test Ajout MAGASIN storedProducts
INSERT INTO storedProducts(name_storedProducts,price_storedProducts,stock_storedProducts,id_technician)
VALUES					  ('sapin déodorant',3.99,3,0),
						  ('clip a lunettes',5.47,0,1),
						  ('porte gobelet 5G',3.23,10,2),
				          ('autoradio',200,5,1),
				          ('ethylotest',1,230,3),
					      ('liquide de frein marque HBg',66.66,17,2);

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE options;						  
-- Test Ajout MAGASIN options
INSERT INTO options(type_options,price_options,date_options)
VALUES			   ('POSE GYROPHARE',230.50,'2008-12-10 12:12:23'),
				   ('FREINS',150.20,'2018-11-10 14:16:52');

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE storageVehicles;
-- Test Ajout MAGASIN storageVehicles
INSERT INTO storageVehicles(name_storageVehicles,brand_storageVehicles,stock_storageVehicles,price_storageVehicles,age_storageVehicles)
VALUE					   ('Megane','Renault',3,8090,0),
						   ('Panda','Fiat',2,15000,2003),
						   ('306','Peugeot',5,7000,1995),
						   ('Mad Cat','Inner Sphere',1,300000,0);

-- Vide la table si elle existe (pour test) *
-- TRUNCATE TABLE request;			
-- Test Ajout DONNEES FACTURATION request
INSERT INTO request(id_commercial,id_buy,id_maintenance,id_repair,id_client,finalQuote_price_HT,finalQuote_price_TTC,VAT_value,quote_date,quote_accept,quote_paid,quote_paidDate)
VALUE			   (1,1,1,1,5,15000,15206,20.6,'2008-12-10 12:12:23',1,1,'2008-12-10 12:12:23');