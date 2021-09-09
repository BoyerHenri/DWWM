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
        <title>Atelier PHP N°4 - page de détail</title>
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
        <form>
            <div>
                <!-- Details -->
                <br>
                <label for="ID" class="form-label">ID</label>
                <input type="number" class="form-control" id="ID" name="ID" placeholder="<?php echo $produit->pro_id; ?>" disabled>

                <br>
                <label for="REF" class="form-label">Réference</label>
                <input type="text" class="form-control" id="REF" name="REF" placeholder="<?php echo $produit->pro_ref; ?>" disabled>
                
                <br>
                <label for="CAT" class="form-label">Catégorie</label>
                <input type="text" class="form-control" id="CAT" name="CAT" placeholder="<?php echo $produit->cat_nom; ?>" disabled>

                <br>
                <label for="LIB" class="form-label">Libellé</label>
                <input type="text" class="form-control" id="LIB" name="LIB" placeholder="<?php echo $produit->pro_libelle; ?>" disabled>

                <br>
                <label for="PDES" class="form-label">Description</label>
                <textarea class="form-control" id="PDES" name="PDES" placeholder="<?php echo $produit->pro_description; ?>" disabled></textarea>
                
                <br>
                <label for="PRI" class="form-label">Prix</label>
                <input type="number" class="form-control" id="PRI" name="PRI" placeholder="<?php echo $produit->pro_prix; ?>" disabled>
                
                <br>
                <label for="STO" class="form-label">Stock</label>
                <input type="text" class="form-control" id="STO" name="STO" placeholder="<?php echo $produit->pro_stock; ?>" disabled>

                <br>
                <label for="COU" class="form-label">Couleur</label>
                <input type="text" class="form-control" id="COU" name="COU" placeholder="<?php echo $produit->pro_couleur; ?>" disabled>
                
                <!-- Radio button disponibilité-->
                <br>
                <div class="form-check form-check-inline mr-10">
                    Produit bloqué : 
                    <input class="form-check-input" type="radio" name="BLOCKED" id="OUI" value="OUI" <?php if($produit->pro_bloque==1) { echo "checked"; }?> value="OUI" disabled>
                    <label class="form-check-label" for="OUI">Oui</label>
                <!--</div>
                <div class="form-check form-check-inline"> -->
                    <input class="form-check-input" type="radio" name="BLOCKED" id="NON" value="NON" <?php if($produit->pro_bloque!=1) { echo "checked"; }?> value="NON" disabled>
                    <label class="form-check-label" for="NON">Non</label>
                </div>
                
                <!-- Dates -->                
                <br>
                Date d'ajout :<?php echo $produit->pro_d_ajout; ?>
                <br>
                Date de modication :<?php echo $produit->pro_d_modif; ?>
            <div>
            <br>
            <!-- Nav Buttons -->
            <a href="../../tableau.php" class="btn btn-dark" tabindex="-1" role="button">Retour</a>
                <!-- <a href="../../produit_ajout.php" class="btn btn-dark" tabindex="-1" role="button">Modifier</a> -->
            <?php
                // echo "<a href=\"assets/php/produit_ajout.php?pro_id=".$row->pro_id."\" title=\"".$row->pro_libelle."\">".$row->pro_libelle."</a>";					
                echo "<a href='produits_ajout.php?pro_id=".$produit->pro_id."' class='btn btn-dark mr-1' tabindex='1' role='button'>Modifier</a>"; // Modification
                // echo "input type='button' value='Changer la couleur de fond'."' class='btn btn-danger btn-sm' tabindex='1' role='button' onClick='ConfirmMessage()'>; // Delete
            ?>
            <!-- Passage d'une variable dans un champ HIDDEN ... -->
            <input type="hidden" id="varMigrant" value="<?php echo $produit->pro_id; ?>">
            <!-- ... afin de la récuperer dans le JS -->
            <input type='button' class='btn btn-danger btn-sm' value='SUPPRIMER PRODUIT' onClick='ConfirmMessage()'>
        </form>
        <!--JS Bootstrap-->
	    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
        <!-- Boite de confirmation -->
        <!-- JS Validation de formulaire -->
	    <script src="../js/confirm.js"></script>
   </body>
 </html>