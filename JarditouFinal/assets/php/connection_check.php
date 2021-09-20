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
    $mdp_dec=password_verify($inscription_mdp_i,$cli_mdp);
    //
    echo "<br> >>".$mdp_dec."<br>";
    echo "<br> =>".$cli_dateA."<br>";

    // echo "<br> >".$cli_dateM."<br>";

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

    // Verifie le MDP
    if (password_verify($inscription_mdp_i,$cli_mdp)) {
        echo "Le MDP est valide...";
    } else {
        echo "MDP invalide";
    }

    // Renvoi a la page espace client
    echo "
            <br>
            <br>
            <div style='text-align: center;'>
                <a href='../../espace_client.php'>RETOUR</a>
            </div>
        ";
?>