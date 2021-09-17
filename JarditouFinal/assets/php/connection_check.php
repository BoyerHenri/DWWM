<?php
    include("connexion_bdd.php");
    $db=connexionBase();

    // Recupération des données transmises
    //$inscription_login_i=$_POST["login_i"];
    $inscription_login_i=$_POST["login_c"];
    $inscription_mdp_i=$_POST["mdp_c"];
    // Affichage pour debug
    
        echo ">".$inscription_login_i."<br>";
        echo ">".$inscription_mdp_i."<br>";
        /*
        echo ">".$inscription_mdp_verif_i."<br>";
        //
        echo ">".$inscription_dateAjout."<br>";
        echo ">".$inscription_dateModif."<br>";
        echo ">".$inscription_mail."<br>";
    */

    // Scripts de vérification
    $requete = "SELECT users_id,users_name,users_prename,users_mail,users_login,users_mdp,users_dateAjout,users_dateModif FROM users WHERE users_login="."'".$inscription_login_i."'";
    echo $requete;
    $result=$db->query($requete);
    // Renvoi de l'enregistrement sous forme d'un objet
    $cli=$result->fetch(PDO::FETCH_OBJ);
    //
    $cli_id=$cli->users_id;
    $cli_name=$cli->users_name;
    $cli_prename=$cli->users_prename;
    $cli_mail=$cli->users_mail;
    $cli_login=$cli->users_login;
    $cli_mdp=$cli->users_mdp;
    $cli_dateA=$cli->users_dateAjout;
    $cli_dateM=$cli->users_dateModif;

    // Affichage des entrées pour debugage
    echo "<br> >".$cli_id."<br>";
    echo "<br> >".$cli_name."<br>";
    echo "<br> >".$cli_prename."<br>";
    echo "<br> >".$cli_mail."<br>";
    echo "<br> >".$cli_login."<br>";
    echo "<br> >".$cli_mdp."<br>";
    echo "<br> >".$cli_dateA."<br>";
    echo "<br> >".$cli_dateM."<br>";

    // Verifie si l'user existe ou non...
    if (!$result) 
    {
        $tableauErreurs = $db->errorInfo();
        echo $tableauErreur[2]; 
        die("Erreur dans la requête");
    }

    if ($result->rowCount() == 0) 
    {
        // Pas d'enregistrement
        echo "La table est vide";
    }

    /*
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
            
             $requete->bindParam(':users_name,$inscription_name');
             $requete->bindParam(':users_prename,$inscription_prename');
             $requete->bindParam(':users_mail,$inscription_mail');
             $requete->bindParam(':users_name,$inscription_login_i');
             $requete->bindParam(':users_name,$inscription_mdp_i');
             $requete->bindParam(':users_name,$inscription_dateAjout');
             $requete->bindParam(':users_name,$inscription_dateModif');
             
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
    */
    // Renvoi a la page espace client
    echo "
            <br>
            <br>
            <div style='text-align: center;'>
                <a href='../../espace_client.php'>RETOUR</a>
            </div>
        ";
?>