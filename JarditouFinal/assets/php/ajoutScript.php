<?php     
    require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
    $db = connexionBase();       // Appel de la fonction de connexion
   
    // Recuperations des données
    $pro_id=$_POST["ID"];
    $pro_cat_id=$_POST["CID"];
    $pro_ref=$_POST["REF"];
    $pro_libelle=$_POST["LIB"];
    $pro_description=$_POST["PDES"];
    $pro_prix=$_POST["PRI"];
    $pro_stock=$_POST["STO"];
    $pro_couleur=$_POST["COU"];
    $pro_photo=$_POST["PHO"];

    $pro_blocked=$_POST["BLOCKED"];

    $pro_d_modif=date("Y-m-d");
 
    // Affichage des données pour test
    echo "Données modifiées sur ".$pro_id."<br>";
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
    $requete="UPDATE produits ";

    $requete=$requete."SET pro_id=".$pro_id.", ";
    $requete=$requete." pro_cat_id=".$pro_cat_id.", ";
    $requete=$requete." pro_ref='".$pro_ref."', ";
    $requete=$requete." pro_libelle='".$pro_libelle."', ";
    
    // Description, si pas modif, rien n'est appliqué
    if ($pro_description!=''){
        $requete=$requete." pro_description='".$pro_description."', ";
    }

    $requete=$requete." pro_prix=".$pro_prix.", ";
    $requete=$requete." pro_stock=".$pro_stock.", ";
    $requete=$requete." pro_couleur='".$pro_couleur."', ";
    $requete=$requete." pro_photo='".$pro_photo."', ";
    
    // Blocked or not
    if($pro_blocked=="OUI"){
        $requete=$requete." pro_bloque=1, ";
    } else{
        $requete=$requete." pro_bloque=0, ";
    }

    $requete=$requete." pro_d_modif='".$pro_d_modif."' ";

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
    
     // Ajout de la photo
     var_dump($_FILES); // Recupere le fichier
     echo $_FILES['FILE']['name']; /* nom du fichier */
     // Verification et enregistrement de l'image
     // On met les types autorisés dans un tableau (ici pour une image)
     $aMimeTypes = array("image/gif", "image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/tiff");
 
     // On extrait le type du fichier via l'extension FILE_INFO 
     
     $finfo = finfo_open(FILEINFO_MIME_TYPE);
     $mimetype = finfo_file($finfo, $_FILES["FILE"]["tmp_name"]);
     finfo_close($finfo);
     if (in_array($mimetype, $aMimeTypes))
     {
         // Le type est parmi ceux autorisés, donc OK, on va pouvoir 
         // déplacer et renommer le fichier 
         $extension = substr(strrchr($_FILES["FILE"]["name"], "."), 1);
         $name_fic=$pro_id.".".$extension;
         // Portable : /home/hbg/Documents/GitHub/DWWM/JarditouFinal/src/img/16.png
         // AFPA : /home/hbg/Documents/DepotsLocaux/DWWM/JarditouFinal/src/img/
         // TO DO -- PC
         // TO DO -- MAC
         move_uploaded_file($_FILES["FILE"]["tmp_name"], "/home/hbg/Documents/GitHub/DWWM/JarditouFinal/src/img/".$name_fic);    
         //$extension = substr(strrchr($_FILES["FILE"]["name"], "."), 1);
         echo "<br><br> >>".$name_fic;
     } 
     else 
     {
     // Le type n'est pas autorisé, donc ERREUR
         echo "<br>Type de fichier non autorisé";    
     exit;
     }

    // Fin d'ajout, redirection
    header("Location:../../tableau.php");
?>  
        
