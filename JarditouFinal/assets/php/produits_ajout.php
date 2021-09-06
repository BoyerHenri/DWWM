<!DOCTYPE html>
 
<html lang="fr">   
    <head>
        <meta charset="UTF-8">
        <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1,0 shrink-to-fit=no"> 
	    <!--Integration de BOOTSTRAP-->  
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!-- Tittle -->
        <title>Atelier PHP N°4 - Ajout données</title>
        <!-- Connection BDD -->
        <?php   
            require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
            $db = connexionBase(); // Appel de la fonction de connexion
            $pro_id = $_GET["pro_id"];
            $requete = "SELECT * FROM produits "; // On applique les selects sur la table
            $requete=$requete."JOIN categories ON cat_id=pro_cat_id ";   // Avec les join
            $requete=$requete." WHERE pro_id=".$pro_id; // Et les where
            // La concatenation permet d'alleger les code en visuel
            $result = $db->query($requete);
            // Renvoi de l'enregistrement sous forme d'un objet
            $produit = $result->fetch(PDO::FETCH_OBJ);
        ?>
   </head>

   <!-- Tableau des produits -->
   <body> 
        <!--Nav Bar-->
        <div class="row">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <!-- Brand -->
                    <a class="navbar-brand" href="#">Jarditou.com</a>
                    <!-- Menu Extensible -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>   
                    <div class="collapse navbar-collapse" id="collapsibleNavbar">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="../../index.php">Accueil</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Mon compte</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../../formulaire.php">Contact</a>
                            </li>
                        </ul>
                    </div>      
                </nav>
            </div>				
        </div>

        <!-- Details produits -->
        <form action="ajoutScript.php?pro_id=.$produit->pro_id" method="get">
            <div>
                <!-- Details -->
                <br>
                <label for="ID" class="form-label">ID</label>
                <input type="number" class="form-control" id="ID" placeholder="  <?php echo $produit->pro_id; ?>">

                <br>
                <label for="CID" class="form-label">Cat. ID</label>
                <input type="number" class="form-control" id="CID" placeholder="  <?php echo $produit->pro_cat_id; ?>">
                
                <br>
                <label for="REF" class="form-label">Ref.</label>
                <input type="number" class="form-control" id="REF" placeholder="  <?php echo $produit->pro_ref; ?>">

                <br>
                <label for="LIB" class="form-label">Libéllé</label>
                <input type="text" class="form-control" id="LIB" name="LIB" placeholder="  <?php echo $produit->pro_libelle; ?>">

                <br>
                <label for="PDES" class="form-label">Description</label>
                <textarea class="form-control" id="PDES" placeholder="  <?php echo $produit->pro_description; ?>"></textarea>

                <br>
                <label for="PRI" class="form-label">Prix</label>
                <input type="number" class="form-control" id="PRI" placeholder="  <?php echo $produit->pro_prix; ?>">

                <br>
                <label for="STO" class="form-label">Libellé</label>
                <input type="text" class="form-control" id="STO" placeholder="  <?php echo $produit->pro_stock; ?>">

                <br>
                <label for="COU" class="form-label">Couleur</label>
                <input type="text" class="form-control" id="COU" placeholder="  <?php echo $produit->pro_couleur; ?>">

                <br>
                <label for="PHO" class="form-label">Photo</label>
                <input type="text" class="form-control" id="PHO" placeholder="  <?php echo $produit->pro_photo; ?>">
                
                <!-- Radio button disponibilité-->
                <br>
                <div class="form-check form-check-inline mr-10">
                    Produit bloqué : 
                    <input class="form-check-input" type="radio" name="BLOCKED" id="OUI" value="OUI" <?php if($produit->pro_bloque==1) { echo "checked"; }?> value="OUI">
                    <label class="form-check-label" for="OUI">Oui</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="BLOCKED" id="NON" value="NON" <?php if($produit->pro_bloque!=1) { echo "checked"; }?> value="NON">
                    <label class="form-check-label" for="NON">Non</label>
                </div>
                
                <!-- Dates -->                
                <br>
                Date d'ajout :<?php echo $produit->pro_d_ajout; ?>
                <br>
                Date de modication :<?php echo date("Y-m-d h:m:s"); ?>
            <div>

            <!-- Nav Buttons -->
            <br>
            <a href="../../tableau.php" class="btn btn-dark" tabindex="-1" role="button">Retour</a>
            <?php
                // Valide l'ajout dans la BDD
                echo "<a href='ajoutScript.php?pro_id=".$produit->pro_id."' class='btn btn-dark' tabindex='-1' role='button'>Valider !</a>"; 
            ?>
        </form>
        <!--JS Bootstrap-->
	    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
   </body>
 </html>