<?php
    include("connexion_bdd.php");
    $db=connexionBase();

    // Recupération des données transmises
    $inscription_login_i=$_POST["login_i"];
    $inscription_mdp_i=$_POST["mdp_i"];
    $inscription_mdp_verif_i=$_POST["mdp_i_v"];
    // To DO
    $inscription_name="Abc";
    $inscription_prename="DEF";
    $inscription_mail="abc@ol.fr";
    $inscription_dateAjout=date();
    $inscription_dateModif=null;
    // Affichage pour debug
    echo ">".$inscription_login_i."<br>";
    echo ">".$inscription_mdp_i."<br>";
    echo ">".$inscription_mdp_verif_i."<br>";
    //
    echo ">".$inscription_dateAjout."<br>";
    echo ">".$inscription_dateModif."<br>";
    // Scripts de vérification
    $validage=0;
    if ($inscription_mdp_i==$inscription_mdp_verif_i){
        // Mdp identique
        $validage=1;
        // echo "<script>alert('Mot de passe correct !');</script>";
    } else if ($inscription_mdp_i!=$inscription_mdp_verif_i){
        // Mdp de passe non identique
        $validage=0;
        // echo "<script>alert('Veuillez confirmer votre mot de passe');</script>";
    }
    // Mots de passe ok, on inscrit dans la BDD
    if ($validage==1){
         
        try {
            $requete="
            INSERT INTO users(users_name,users_prename,users_mail,users_login,users_mdp,users_dateAjout,users_dateModif)
             VALUES (:users_name,:users_prename,:users_mail,:users_login,:users_mdp,:users_dateAjout,:users_dateModif)";
             echo $requete;
             //
             $result=$db->prepare($requete);
             //
             $result->execute(array(
                "users_name"=>$inscription_name,
                "users_prename"=> $inscription_prename,
                "users_mail"=>$inscription_mail,
                "users_login"=> $inscription_login_i,
                "users_mdp"=>$inscription_mdp_i,
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
            echo 'Erreur : ' . $e->getMessage() . '<br>';
            echo 'N° : ' . $e->getCode() . '<br>';
            die('Connexion au serveur impossible.');
        }
    }
    //header('Location:../../connect.php');
    //exit;
?>