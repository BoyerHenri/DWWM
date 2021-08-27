-- *********************
-- *GESCOM TRANSACTIONS*
-- *********************
-- Etape préalable, création de la ligne de la table posts indiquant les employés à la retraite
USE gescom_afpa;
INSERT INTO posts(pos_libelle)
VALUES ('Retraité');

/*  
    ***************************************************
    *DESCRIPTION DES ACTIONS A EFFECTUER BRAINSTORMING*
    ***************************************************
    1. Chercher le pépinniériste le plus ANCIEN = Monsieur Z.
    2. Recuperer les données de HANNAH Amity
    3. Augmenter le salaire de Mr.Z de 5% 
    4. MAJ du post de Amity->id retraite
    5. Mettre à jour le emp_pos_id du pepinieriste Z avec celui de HANNAH Amity. 
*/

-- Requetes une à une
-- Recherche du pepinieriste le plus ancien
SELECT emp_id,
emp_superior_id,
emp_pos_id,
emp_lastname,
emp_firstname,
emp_address,
emp_zipcode,
emp_city,
emp_mail,
emp_phone,
emp_salary,
MIN(emp_enter_date),
emp_gender,
emp_children,
emp_sho_id,
emp_dep_id, 
sho_city
FROM employees 
JOIN shops
ON emp_sho_id=sho_id 
WHERE emp_pos_id=14 AND sho_city='Arras';

-- LIster les pepinieristes
SELECT *
FROM employees 
JOIN shops
ON emp_sho_id=sho_id 
WHERE emp_pos_id=14

-- Recupére les données de la future retraitée
SELECT emp_id,
emp_superior_id,
emp_pos_id,
emp_lastname,
emp_firstname,
emp_address,
emp_zipcode,
emp_city,
emp_mail,
emp_phone,
emp_salary,
emp_enter_date,
emp_gender,
emp_children,
emp_sho_id,
emp_dep_id
FROM employees 
-- To do arras
WHERE emp_lastname='HANNAH' AND emp_firstname='Amity'

-- ***********************
-- *Procedure de swapping*
-- ***********************
DROP PROCEDURE IF EXISTS mise_en_retraite;
DELIMITER //
    CREATE PROCEDURE mise_en_retraite()
    BEGIN
        -- Declaration des variables afin de swapp
        -- Nouveau employé
        DECLARE new_emp_id INT(10);
        DECLARE new_emp_superior_id INT(10);
        DECLARE new_emp_pos_id INT(10);
        DECLARE new_emp_lastname VARCHAR(50);
        DECLARE new_emp_firstname VARCHAR(50);
        DECLARE new_emp_address VARCHAR(150);
        DECLARE new_emp_zipcode VARCHAR(5);
        DECLARE new_emp_city VARCHAR(50);
        DECLARE new_emp_mail VARCHAR(255);
        DECLARE new_emp_phone VARCHAR(10);
        DECLARE new_emp_salary DECIMAL(8,2);
        DECLARE new_emp_enter_date DATE;
        DECLARE new_emp_gender CHAR(1);
        DECLARE new_emp_children TINYINT(2);
        DECLARE new_emp_sho_id TINYINT(3);
        DECLARE new_emp_dep_id TINYINT(3);
        DECLARE new_emp_sho_city VARCHAR(26);

        -- Ancien employé
        DECLARE ret_emp_id INT(10);
        DECLARE ret_emp_superior_id INT(10);
        DECLARE ret_emp_pos_id INT(10);
        DECLARE ret_emp_lastname VARCHAR(50);
        DECLARE ret_emp_firstname VARCHAR(50);
        DECLARE ret_emp_address VARCHAR(150);
        DECLARE ret_emp_zipcode VARCHAR(5);
        DECLARE ret_emp_city VARCHAR(50);
        DECLARE ret_emp_mail VARCHAR(255);
        DECLARE ret_emp_phone VARCHAR(10);
        DECLARE ret_emp_salary DECIMAL(8,2);
        DECLARE ret_emp_enter_date DATE;
        DECLARE ret_emp_gender CHAR(1);
        DECLARE ret_emp_children TINYINT(2);
        DECLARE ret_emp_sho_id TINYINT(3);
        DECLARE ret_emp_dep_id TINYINT(3);
        DECLARE ret_emp_pos_libelle VARCHAR(50);

        -- Mise en mémoire du pépiniériste le plus expérimenté
        SELECT emp_id,
        emp_superior_id,
        emp_pos_id,
        emp_lastname,
        emp_firstname,
        emp_address,
        emp_zipcode,
        emp_city,
        emp_mail,
        emp_phone,
        emp_salary,
        MIN(emp_enter_date),
        emp_gender,
        emp_children,
        emp_sho_id,
        emp_dep_id,
        -- Shop
        sho_city

        INTO new_emp_id,
        new_emp_superior_id,
        new_emp_pos_id,
        new_emp_lastname,
        new_emp_firstname,
        new_emp_address,
        new_emp_zipcode,
        new_emp_city,
        new_emp_mail,
        new_emp_phone,
        new_emp_salary,
        new_emp_enter_date,
        new_emp_gender,
        new_emp_children,
        new_emp_sho_id,
        new_emp_dep_id,
        new_emp_sho_city

        -- Jointures
        FROM employees
        JOIN shops
        ON emp_sho_id=sho_id 
        -- Conditions
        WHERE emp_pos_id=14 AND sho_city='Arras';

        -- Mise en mémoire de l'ancien employé
         SELECT emp_id,
        emp_superior_id,
        emp_pos_id,
        emp_lastname,
        emp_firstname,
        emp_address,
        emp_zipcode,
        emp_city,
        emp_mail,
        emp_phone,
        emp_salary,
        emp_enter_date,
        emp_gender,
        emp_children,
        emp_sho_id,
        emp_dep_id,
        -- Poste/fonction
        pos_libelle
     
        INTO ret_emp_id,
        ret_emp_superior_id,
        ret_emp_pos_id,
        ret_emp_lastname,
        ret_emp_firstname,
        ret_emp_address,
        ret_emp_zipcode,
        ret_emp_city,
        ret_emp_mail,
        ret_emp_phone,
        ret_emp_salary,
        ret_emp_enter_date,
        ret_emp_gender,
        ret_emp_children,
        ret_emp_sho_id,
        ret_emp_dep_id,
        ret_emp_pos_libelle
        -- Jointures
        FROM employees
        JOIN posts
        ON emp_pos_id=pos_id
        -- Conditions
        WHERE emp_lastname='HANNAH' AND emp_firstname='Amity';

        -- **************
        -- *Remplacement*
        -- **************
        -- Promotion du nouveau
        UPDATE employees SET emp_pos_id=14 WHERE emp_enter_date=new_emp_enter_date;
        -- emp_salary=(emp_salary*1.05)
        -- Augmentation du nouveau (Par defaut Amity 2 Nouveau 20450 14 pepininieristes pour tests )
        UPDATE employees SET emp_salary=20450 WHERE emp_enter_date=new_emp_enter_date;
        -- Mise en retraite de l'employé (TO DO METTRE 36)
        UPDATE employees SET emp_pos_id=2 WHERE emp_lastname='HANNAH' AND emp_firstname='Amity';

        -- TO DO passer les pepinieristes sous le controle du  nouveau
    END //
DELIMITER ;
-- Test
CALL mise_en_retraite();




-- Zone de test et d'essais NUCLEAIRES (boum)

/*
--need to store the original values
SELECT
    *,CASE WHEN id=123 then 987 ELSE 123 END AS JoinId
    INTO #Temp
    FROM YourTable
    WHERE ID in (123,987)

--swap values
UPDATE y
    SET col1=t.col1
        ,col2=t.col2
    FROM YourTable        y
        INNER JOIN #Temp  t ON y.id =t.JoinId
    WHERE ID in (123,987)

    --

    UPDATE myTable
SET 
col1 = CASE WHEN col1 = 1 THEN 5 ELSE 1 END,
col2 = CASE WHEN col2 = 2 THEN 6 ELSE 2 END,
col3 = CASE WHEN col3 = 3 THEN 7 ELSE 3 END 
*/