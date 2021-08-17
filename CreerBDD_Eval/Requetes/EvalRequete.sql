-- Pointe sur la BDD
use gescom_afpa;

-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne, 
-- les noms et prénoms des employés qui ont des enfants. Présenter d'abord ceux qui en ont le plus.
select concat(emp_lastname,' ',emp_firstname) as 'Employé', emp_children as 'Nb enfants'
from employees
order by emp_children desc,'Employé' desc

-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.
select cus_lastname,cus_firstname,cus_countries_id
from customers
where cus_countries_id not like 'FR'

-- Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.
select cus_city,cus_countries_id,cou_name
from countries
join customers
on cus_countries_id=cou_id
order by cus_city

-- Q4. Afficher le nom des clients dont les fiches ont été modifiées
select cus_lastname,cus_update_date 
from customers
where cus_update_date is not null

-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont 
-- elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?
select cus_id,cus_countries_id,cus_city,cus_lastname,cus_firstname
from customers
where cus_city like '%divos%'

-- Q6. Quel est le produit dont le prix de vente est le moins cher ? 
-- Afficher le prix, l'id et le nom du produit.
select pro_name,pro_id,pro_price
from products
where pro_price=(select min(pro_price) from products)

-- Q7. Lister les produits qui n'ont jamais été vendus
select pro_id,pro_ref,pro_name,pro_update_date
from products
WHERE pro_update_date is NULL

-- Q8. Afficher les produits commandés par Madame Pikatchien.
select pro_id,pro_ref,pro_color,pro_name,cus_id,cus_lastname,ord_id,ode_id
from customers
join orders
on cus_id=ord_cus_id
join orders_details
on ord_id=ode_ord_id
join products
on ode_pro_id=pro_id
where cus_lastname='Pikatchien'

-- Q9. Afficher le catalogue des produits par catégorie, le nom des produits et 
-- de la catégorie doivent être affichés.
select cat_id,cat_name,pro_name
from categories
join products
on pro_cat_id=cat_id

-- Q10. Afficher l'organigramme du magasin de Compiègne Afficher le nom et 
-- prénom des employés, classés par ordre alphabétique, ainsi que celui de leur supérieur 
-- hiérarchique (et éventuellement leurs postes respectifs, si vous y parvenez).
select concat(e.emp_firstname,' ',e.emp_lastname) as 'Employé', concat(s.emp_firstname,' ',s.emp_lastname) as 'Supérieur'
from  `employees` as e
join `employees`  as s
on e.emp_superior_id=s.emp_id
where e.emp_sho_id=3
order by e.emp_lastname asc




