<?php     
    require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
    $db = connexionBase();       // Appel de la fonction de connexion

    // Recuperations des données (OFFLINE)
    $pro_id=$_POST["ID"];
    $pro_cat_id=$_POST["CID"];
    $pro_ref=$_POST["REF"];
    $pro_libelle=$_POST["LIB"];
    $pro_description=$_POST["PDES"];
    $pro_prix=$_POST["PRI"];
    $pro_stock=$_POST["STO"];
    $pro_couleur=$_POST["COU"];
    $pro_photo=$_POST["PHO"];

    $pro_d_ajout=date("Y-m-d");
    $pro_d_modif=null;
    
    $pro_blocked=$_POST["BLOCKED"]=='OUI'?1:0;

    // Affichage des données pour test
    echo "Données modifiées sur ".$pro_id."<br>";
    $fic=$pro_id; // Memorise le pro_id
    echo "Cat. ".$pro_cat_id."<br>";
    echo "Ref. ".$pro_ref."<br>";
    echo "Lib. ".$pro_libelle."<br>";
    echo "Des. ".$pro_description."<br>";
    echo "Prix. ".$pro_prix."<br>";
    echo "Stock. ".$pro_stock."<br>";
    echo "Couleur. ".$pro_couleur."<br>";
    echo "Img. ".$pro_photo."<br>";
    //
    echo "Blocked ? ".$pro_blocked."<br>";
    //
    echo "Date Modif. ".$pro_d_modif."<br>";
    
    // Update des données 
    
    $requete="INSERT INTO produits(";
    // $requete=$requete."pro_id,"; // AUTO-INCREMENT
    $requete=$requete."pro_cat_id,";
    $requete=$requete."pro_ref,";
    $requete=$requete."pro_libelle,";
    $requete=$requete."pro_description,";
    $requete=$requete."pro_prix,";
    $requete=$requete."pro_stock,";
    $requete=$requete."pro_couleur,";
    $requete=$requete."pro_photo,";
    $requete=$requete."pro_d_ajout,";
    $requete=$requete."pro_d_modif,";
    $requete=$requete."pro_bloque";
    $requete=$requete.") ";
  
    $requete=$requete." VALUES (:procatid,:proref,:prolib,:prodes,:propri,:prosto,:proucou,:propho,:prodajout,:prodmodif,:problo)";
    
    echo "<br><br>".$requete; // Affiche requete pour debugage

    // Lancement de la requete créee dans la variable
    $result=$db->prepare($requete);

    // Recherche d'erreur
    try {
    $result->execute(array(
        "procatid"=>$pro_cat_id,
        "proref"=>$pro_ref,
        "prolib"=>$pro_libelle,
        "prodes"=>$pro_description,
        "propri"=>$pro_prix,
        "prosto"=>$pro_stock,
        "proucou"=>$pro_couleur,
        "propho"=>$pro_photo,
        "prodajout"=> $pro_d_ajout,
        "prodmodif"=>$pro_d_modif,
        "problo"=>$pro_blocked
    ));
    //  Debogage on
    $nb_insert = $result->rowCount();
    echo $nb_insert.' insertion effectuée<br/>';
    unset($db);
    }
    catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage() . '<br>';
        echo 'N° : ' . $e->getCode() . '<br>';
        die('Connexion au serveur impossible.');
    }
    
    // Fin d'ajout, redirection
    header("Location:../../tableau.php");

?>  
        
