-- Restauration et sauvegarde de la BDD

-- Sauvegarde BDD
mysqldump --user='root' --password='root' --databases 'green_village' > green_village_BACKUP.sql

-- Restauration BDD
mysql --user'=root' --password='root' < green_village_BACKUP.sql