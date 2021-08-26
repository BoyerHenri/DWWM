
-- **********
-- * GESCOM *
-- **********

-- Créez une vue qui affiche le catalogue produits. 
-- L'id, la référence et le nom des produits, ainsi que l'id et le nom de la catégorie doivent apparaître.
CREATE VIEW aff_cat
AS
SELECT pro_id,pro_ref,pro_name,cat_name,cat_id
FROM products
JOIN categories
ON pro_cat_id=cat_id
-- Affichage de la vue
select * FROM aff_cat
