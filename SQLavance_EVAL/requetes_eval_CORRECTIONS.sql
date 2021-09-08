-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne, les noms et prénoms 
-- des employés qui ont des enfants. Présenter d'abord ceux qui en ont le plus.
select e.emp_lastname , e.emp_firstname, e.emp_children 
from employees e 
where e.emp_children > 0
order by e.emp_children DESC;

-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.
select c.cus_lastname , c.cus_firstname , c2.cou_name 
from customers c 
join countries c2 on c.cus_countries_id = c2.cou_id 
where c2.cou_name <> 'France';

-- Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.
select c.cus_city , c.cus_countries_id , c2.cou_name 
from customers c 
join countries c2 on c.cus_countries_id = c2.cou_id 
order by c.cus_city  ASC;

-- Q4. Afficher le nom des clients dont les fiches ont été modifiées
select c.cus_lastname , c.cus_update_date 
from customers c 
where c.cus_update_date is not null;

-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose 
-- dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?
select c.cus_lastname , c.cus_city 
from customers c 
where c.cus_city like 'A%';


select * 
from customers c
where c.cus_firstname ='zOê';


-- Q6. Quel est le produit dont le prix de vente est le moins cher ? 
-- Afficher le prix, l'id et le nom du produit.
select p.pro_price , p.pro_id , p.pro_name 
from products p
order by p.pro_price ASC
limit 1;


select * from products p2 where p2.pro_pric e = (
	select min(p.pro_price) from products p
);


-- Q7. Lister les produits qui n'ont jamais été vendus
select * 
from products p 
where p.pro_id  not in (
	select od.ode_pro_id 
	from orders_details od 
);


select p.pro_id , od.ode_id 
from products p left join orders_details od on od.ode_pro_id = p.pro_id 
where od.ode_id is null;


-- Q8. Afficher les produits commandés par Madame Pikatchien.
select p.pro_name , p.pro_price , c.cus_lastname 
from customers c 
join orders o on o.ord_cus_id = c.cus_id 
join orders_details od on od.ode_ord_id = o.ord_id 
join products p on p.pro_id = od.ode_pro_id
where c.cus_lastname = 'pikatchien'; 


-- Q9. Afficher le catalogue des produits par catégorie, 
-- le nom des produits et de la catégorie doivent être affichés.
select p.pro_name , c.cat_name 
from products p 
join categories c on c.cat_id = p.pro_cat_id
where c.cat_name = 'Barbec'
order by c.cat_name; 

select p.pro_name , c.cat_name 
from products p, categories c 
where c.cat_id = p.pro_cat_id and c.cat_name = 'Barbec'
order by c.cat_name;


-- Q10. Afficher l'organigramme du magasin de Compiègne 
-- Afficher le nom et prénom des employés, classés par ordre alphabétique, 
-- ainsi que celui de leur supérieur hiérarchique 
-- (et éventuellement leurs postes respectifs, si vous y parvenez).
select e.emp_firstname , e.emp_lastname , chef.emp_firstname , chef.emp_lastname , s.sho_city 
from employees e 
join shops s on s.sho_id = e.emp_sho_id
join employees chef on chef.emp_id = e.emp_superior_id 
where s.sho_city = 'compiegne';


-- Q11. Quel produit a été vendu avec la remise la plus élevée ? 
-- Afficher le numéro et le nom du produit, le numéro de commande, 
-- le numéro de ligne de commande, et le montant de la remise.
select p.pro_id , p.pro_name, o.ord_id , od2.ode_id , od2.ode_unit_price*od2.ode_quantity*(od2.ode_discount/100)
from products p 
join orders_details od2 on p.pro_id = od2.ode_pro_id 
join orders o on o.ord_id = od2.ode_ord_id 
where od2.ode_discount = 
(
	select max(od.ode_discount) 
	from orders_details od
);

-- Q12. Combien y-a-t-il de clients canadiens ? 
-- Afficher dans une colonne intitulée 'Nb clients Canada'
select count(*) as 'Nb clients Canada'
from customers c 
where c.cus_countries_id = 'CA';



-- Q13. Afficher le détail des commandes de 2020.
select o.ord_id , o.ord_order_date , od.ode_unit_price , od.ode_quantity 
from orders o
join orders_details od on od.ode_ord_id = o.ord_id 
where year(o.ord_order_date) = 2020;


-- Q14. Afficher les coordonnées des fournisseurs pour lesquels des 
-- commandes ont été passées.
select DISTINCT s.sup_name 
from orders_details od 
join products p on od.ode_pro_id = p.pro_id 
join suppliers s on s.sup_id = p.pro_sup_id;

select s.sup_name 
from orders_details od 
join products p on od.ode_pro_id = p.pro_id 
join suppliers s on s.sup_id = p.pro_sup_id
group by s.sup_name ; -- c'est moins bien !!!



select s.sup_name 
from suppliers s 
where s.sup_id in (
	select p.pro_sup_id 
	from products p 
	where p.pro_id in (
		select od.ode_pro_id 
		from orders_details od
	)
); 

-- Q15. Quel est le chiffre d'affaires de 2020 ?
select SUM(od.ode_unit_price * od.ode_quantity * (1-(od.ode_discount/100))) as 'CA'
from orders o 
join orders_details od on o.ord_id = od.ode_ord_id 
where year(o.ord_order_date) = 2020;


-- Q16. Lister le total de chaque commande par total décroissant. 
-- Afficher le numéro de commande, la date, le total et le nom du client).
select o.ord_id, o.ord_order_date , sum(od.ode_unit_price * od.ode_quantity * (1-(od.ode_discount/100))) as 'CA'
from orders o 
join orders_details od on o.ord_id = od.ode_ord_id 
group by o.ord_id ;


-- Q17. Quel est le montant moyen des commandes?
select sum(od.ode_unit_price * od.ode_quantity * (1-(od.ode_discount/100))) / count(distinct o.ord_id)
from orders o 
join orders_details od on o.ord_id = od.ode_ord_id 
;


select sum(od.ode_unit_price * od.ode_quantity * (1-(od.ode_discount/100))) as 'ca'
from orders o 
join orders_details od on o.ord_id = od.ode_ord_id 
group by o.ord_id;



-- Q18. La version 2020 du produit barb004 s'appelle désormais Camper et, 
-- bonne nouvelle, son prix subit une baisse de 10%. 
-- Mettre à jour la fiche de ce produit.

update products 
set pro_name ='Camper2', pro_price = round(pro_price  * 0.9)
where pro_ref ='barb004';

update products 
set pro_name ='test';

select p.pro_name, p.pro_price from products p where p.pro_ref ='barb004';


-- Q19. L'inflation en France l'année dernière a été de 1,1%. 
-- Appliquer cette augmentation à la gamme de parasols.
update products 
set pro_price = round(pro_price * 1.1)
where pro_id in (
	select p.pro_id 
	from products p 
	where p.pro_cat_id  in (
		select c.cat_id 
		from categories c 
		where c.cat_name = 'parasols'
	)
);

select p.pro_price 
	from products p 
	where p.pro_cat_id  in (
		select c.cat_id 
		from categories c 
		where c.cat_name = 'parasols'
	)
;



-- Q20. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". 
-- Vous devez utiliser une sous-requête sans indiquer de valeurs de clés.
	delete from products 
	where 
	pro_id in (
		select p.pro_id 
		from products p 
		where p.pro_id not in (select ode_pro_id from orders_details od )
	)
	and
	pro_id in (
		select p.pro_id 
		from products p 
		where p.pro_cat_id  in (
			select c.cat_id 
			from categories c 
			where c.cat_name = 'tondeuses electriques'
		)
	)



























