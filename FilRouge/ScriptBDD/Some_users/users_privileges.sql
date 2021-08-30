-- Cree un user-exemple pour la TEAM CATALOG
DROP USER IF EXISTS 'catalog_team'@'localhost'; -- Pour éviter les doublons lors des tests
CREATE USER 'catalog_team'@'localhost' IDENTIFIED BY 'gibson';
GRANT SELECT,INSERT,UPDATE ON `green_village`.products TO 'catalog_team'@'localhost';

-- Cree un user-exemple pour UN VISITEUR
DROP USER IF EXISTS 'visitor'@'localhost'; -- Pour éviter les doublons lors des tests
CREATE USER 'visitor'@'localhost' IDENTIFIED BY 'rock';
GRANT SELECT ON `green_village`.products TO 'visitor'@'localhost';

-- Cree un user-exemple pour UN CLIENT
DROP USER IF EXISTS 'client'@'localhost'; -- Pour éviter les doublons lors des tests
CREATE USER 'client'@'localhost' IDENTIFIED BY 'pognon';
GRANT SELECT,INSERT,UPDATE ON `green_village`.products TO 'client'@'localhost';

-- Cree un user-exemple pour LA GESTION
DROP USER IF EXISTS 'gestion'@'localhost'; -- Pour éviter les doublons lors des tests
CREATE USER 'gestion'@'localhost' IDENTIFIED BY 'soprano';
GRANT SELECT,INSERT,UPDATE ON `green_village`.* TO 'gestion'@'localhost';

-- Cree un user-exemple pour L'ADMIN
DROP USER IF EXISTS 'admin_green'@'localhost'; -- Pour éviter les doublons lors des tests
CREATE USER 'admin_green'@'localhost' IDENTIFIED BY 'dieu666';
GRANT ALL PRIVILEGES ON `green_village`.* TO 'admin_green'@'localhost' WITH GRANT OPTION;

-- Fin de l'intervention users
FLUSH PRIVILEGES;