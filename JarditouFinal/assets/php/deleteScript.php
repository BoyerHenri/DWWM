<?php     
    require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
    $db = connexionBase();       // Appel de la fonction de connexion
   

    // Recuperations des données
    $pro_id=$_GET["pro_id"];
   
    // Requete de DELETE des données 
    $requete="DELETE FROM produits ";

    // Where ?
    $requete=$requete." WHERE pro_id=".$pro_id;

    echo "<br><br>".$requete; // Affiche requete pour debugage

    // Lancement de la requete créee dans la variable
    
    try {
        $result = $db->query($requete);
        // Renvoi de l'enregistrement sous forme d'un objet
        // Execution de la requéte
        $produit = $result->fetch(PDO::FETCH_OBJ);
    } catch (Exception $e) {
        echo '<br><br>Erreur : ' . $e->getMessage() . '<br>';
        echo 'N° : ' . $e->getCode() . '<br>';
        die('Connexion au serveur impossible.');
    }
    // Fin d'ajout, redirection
    header("Location:../../tableau.php");
    
?>  
        
