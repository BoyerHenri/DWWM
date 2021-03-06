<?php
    include("connexion_bdd.php");
    $db=connexionBase();

    // Recupération des données transmises
    //$inscription_login_i=$_POST["login_i"];
    $inscription_mdp_i=$_POST["mdp_i"];
    $inscription_mdp_verif_i=$_POST["mdp_i_v"];
    // To DO
    $inscription_login_i=$_POST["login_i"];;
    $inscription_name=$_POST["name_i"];;
    $inscription_prename=$_POST["prename_i"];;
    $inscription_mail=$_POST["login_mail"];
    $inscription_dateAjout=date("Y-m-d");
    $inscription_dateModif=Null;
    // Affichage pour debug
    /*
        echo ">".$inscription_login_i."<br>";
        echo ">".$inscription_mdp_i."<br>";
        echo ">".$inscription_mdp_verif_i."<br>";
        //
        echo ">".$inscription_dateAjout."<br>";
        echo ">".$inscription_dateModif."<br>";
        echo ">".$inscription_mail."<br>";
    */

    // Scripts de vérification
    $validage=0;
    if ($inscription_mdp_i==$inscription_mdp_verif_i){
        // Mdp identique
        $validage=1;
        // echo "<script>alert('Mot de passe correct !');</script>";
    } else if ($inscription_mdp_i!=$inscription_mdp_verif_i){
        // Mdp de passe non identique
        $validage=0;
        echo "
            <div style='text-align: center;'>Mot de passe non valide</div>
            ";
    }
    // Mots de passe ok, on inscrit dans la BDD
    // Maravage du mdp pour cryptage
    $pass_mixeur=password_hash($inscription_mdp_i,PASSWORD_DEFAULT);
    
    // Inscription BDD
    if ($validage==1){     
        try {
            $requete="
            INSERT INTO users(users_name,users_prename,users_mail,users_login,users_mdp,users_dateAjout,users_dateModif)
             VALUES (:users_name,:users_prename,:users_mail,:users_login,:users_mdp,:users_dateAjout,:users_dateModif)";
             // echo $requete."<br>"."All systems nominals !";
             //
             $result=$db->prepare($requete);
             //
             $result->execute(array(
                "users_name"=>$inscription_name,
                "users_prename"=> $inscription_prename,
                "users_mail"=>$inscription_mail,
                "users_login"=> $inscription_login_i,
                "users_mdp"=>$pass_mixeur,
                "users_dateAjout"=>$inscription_dateAjout,
                "users_dateModif"=>$inscription_dateModif     
             ));
            /*
             $requete->bindParam(':users_name,$inscription_name');
             $requete->bindParam(':users_prename,$inscription_prename');
             $requete->bindParam(':users_mail,$inscription_mail');
             $requete->bindParam(':users_name,$inscription_login_i');
             $requete->bindParam(':users_name,$inscription_mdp_i');
             $requete->bindParam(':users_name,$inscription_dateAjout');
             $requete->bindParam(':users_name,$inscription_dateModif');
             */
        } catch (Exception $e){
            //
            $numerror=$e->getCode();
            //
            //echo 'Erreur : ' . $e->getMessage() . '<br>';
            //echo 'N° : ' . $e->getCode() . '<br>';
            //die('Connexion au serveur impossible.');
        }
    }

    // Gestion des erreurs
    // 2300 Login deja existant
    echo "<br>>".$numerror."<br>";
    if ($numerror==23000) {
        $validage=0;
        echo "
            <div style='text-align: center;'>Email ou login déjà existant !</div>
            ";
    }
    // Renvoi page si correct, previens user le cas echeant
    if ($validage==1) {
        header('Location:../../espace_client.php');
        exit;
    } else{
        echo "
            <br>
            <br>
            <div style='text-align: center;'>
                <a href='../../espace_client.php'>RETOUR</a>
            </div>
            ";
    }
?>