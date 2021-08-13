-- Util 1
-- Creation du user
create user 'util1'@'localhost' identified by '0000'
-- Don des privileges (tous)
grant all privileges on Oto.*
to 'util1'@'localhost'
identified by '0000'

-- Efface l'user
-- drop user 'util1'@'localhost';

-- Util 2
-- Creation du user
create user 'util2'@'localhost' identified by '0000'
-- Don des privileges (tselectionner seleument)
grant select on Oto.*
to 'util2'@'localhost'
identified by '0000'

-- Efface l'user
-- drop user 'util2'@'localhost';
-- Util 3
-- Creation du user
create user 'util3'@'localhost' identified by '0000'
-- Don des privileges (afficher seulement une table : commercial)
grant select on Oto.maintenance
to 'util3'@'localhost'
identified by '0000'


-- Efface l'user
-- drop user 'util3'@'localhost';
