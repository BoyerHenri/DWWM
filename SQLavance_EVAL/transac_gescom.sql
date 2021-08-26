-- *********************
-- *GESCOM TRANSACTIONS*
-- *********************
-- Etape préalable, création de la ligne de la table posts indiquant les employés à la retraite
USE gescom_afpa;
INSERT INTO posts(pos_libelle)
VALUES ('Retraité');

/*  DESCRIPTION DES ACTIONS A EFFECTUER
1. Chercher le pépinniériste le plus ANCIEN = Monsieur Z.
2. Augmenter son salaire de 5%
3. Recuperer le emp_pos_id de HANNAH Amity
4. Retirer HANNAH Amity des effectifs de la table employees
5. Mettre à jour le emp_pos_id du pepinieriste Z avec celui de HANNAH Amity. 
*/
