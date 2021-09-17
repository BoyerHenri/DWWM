-- ************************
-- * Creation table users *
-- ************************
-- Nuke table si elle existe
DROP TABLE IF EXISTS users;
-- Creation table
CREATE TABLE users(
   users_id SMALLINT AUTO_INCREMENT,
   users_name VARCHAR(50) NOT NULL,
   users_prename VARCHAR(50) NOT NULL,
   users_mail VARCHAR(50) NOT NULL,
   users_login VARCHAR(50) NOT NULL,
   users_mdp VARCHAR(255) NOT NULL,
   users_dateAjout DATE,
   users_dateModif DATE,
   -- Declaration des cles primaires
   PRIMARY KEY(users_id),
   UNIQUE(users_mail),
   UNIQUE(users_login)
);

