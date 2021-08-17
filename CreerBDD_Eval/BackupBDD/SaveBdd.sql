-- N'ayant pas eu la correction de ma base de données, j'ai effectué la
-- sauvegarde/restauration avec la base test "BddGescom_Afpa_Complete"

-- De plus, ayant eu un crash PC et une reinstall compléte, j'ai fait ce que j'ai
-- pu sans aide, avec le temps qui me restait et les informations que je trouvais.

-- *********
-- Backup :
-- Dans le dossier de reception du backup voulu, dans un terminal :

mysqldump --user=root --password=root gescom_afpa --databases > Backup_afpa.sql;

-- Il y a deux backups, ayant fait un essai je ne voulais pas corrompre une sauvegarde

-- ************
-- Resaturation
mysql --user=root --password=root < Backup_afpa.sql;
