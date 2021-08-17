-- N'ayant pas eu la correction de ma base de données, j'ai effectué
-- l'eval avec la BDD que j'avais sous la main : tantôt la mienne, tantôt celle d'exemple. 

-- De plus, ayant eu un crash PC et une reinstall compléte, j'ai fait ce que j'ai
-- pu sans aide, avec le temps qui me restait et les informations que je trouvais.

-- Cree un groupe sur la BDD gescom dédiée au marketing
create role gescom_marketing

-- Affectation des priviléges, sur les tables PRODUITS,CATEGORIES,CLIENTS,COMMANDES,DETAIL COMMANDES
-- Consultation, ajout et suppression
grant SELECT,INSERT,UPDATE
on gescom_afpa.products
to gescom_marketing;

grant SELECT,INSERT,UPDATE
on gescom_afpa.categories
to gescom_marketing;

-- Consultation uniquement
grant SELECT
on gescom_afpa.customers
to gescom_marketing;

grant SELECT
on gescom_afpa.orders
to gescom_marketing;

grant SELECT
on gescom_afpa.orders_details
to gescom_marketing
