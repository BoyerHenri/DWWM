<?php     
    require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
    $db = connexionBase(); // Appel de la fonction de connexion
    $pro_id = $_GET["pro_id"];
    // Requete
    // $requete="UPDATE produits ";
       
    /*
    $requete = "SELECT * FROM produits "; // On applique les selects sur la table
    $requete=$requete."JOIN categories ON cat_id=pro_cat_id ";   // Avec les join
    $requete=$requete." WHERE pro_id=".$pro_id; // Et les where
    */

    // La concatenation permet d'alleger les code en visuel
    // $result = $db->query($requete);
    
    // Renvoi de l'enregistrement sous forme d'un objet
    //$produit = $result->fetch(PDO::FETCH_OBJ);

    // Modifications

/*
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
<label for="REF" class="form-label">Libéllé</label>
<input type="text" class="form-control" id="REF" placeholder="  <?php echo $produit->pro_libelle; ?>">

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
Date de modication :<?php echo date("Y-m-d"); ?>
*/
    // Dates
    //$requete=$requete." SET pro_d_modif=".date("Y-m-d h:m:s");
   // $requete=$requete." WHERE pro_id=".$pro_id;
    // $requete=$requete."  $requete="UPDATE produits 
    $libel=$_GET['LIB'];
    // $requete=$requete."SET pro_libelle='".$lib."'";
    // Where ?
    // $requete=$requete." WHERE pro_id=".$pro_id;
    // Lancement de la requete créee dans la variable
    // $result = $db->query($requete);
    // Renvoi de l'enregistrement sous forme d'un objet
    // $produit = $result->fetch(PDO::FETCH_OBJ);
    //
    echo "Données modifiées sur ".$pro_id."ff ".$libel;
?>  
        
