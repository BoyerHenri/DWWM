

-- Creer un trigger

CREATE TRIGGER ajout_categorie
BEFORE INSERT ON categories
FOR EACH ROW
SET NEW.cat_name = UPPER(NEW.cat_name);


-- rajouter +1 dans une colonne lors d'un ajout

CREATE TRIGGER incre_client
BEFORE INSERT ON client
FOR EACH ROW
UPDATE nbrclient
SET nbclient.nbClient = nbclient.nbClient + 1;


-- rajouter +1 dans une colonne lors d'une commande effectue

CREATE TRIGGER point_fidelite
BEFORE INSERT ON commande
FOR EACH ROW
UPDATE client
SET point = point + 1
WHERE client.idclient = new.idclient;


-- reduire -1 dans une colonne lors d'une commande efface

CREATE TRIGGER annuler_point
AFTER DELETE ON commande
FOR EACH ROW
UPDATE client
SET point = point - 1
WHERE client.idclient = old.idclient;





















