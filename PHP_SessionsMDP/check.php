<?php
    // INSERER LE DEBUT DE SESSION ICI
    session_start();
    $_SESSION["login"] = "admin";
    $_SESSION["psw"] = "1234";
    //
    echo "<br>Running...<br>";
    //
    $nom=$_POST["name"];
    $mdp=$_POST["password"];
    // Affichage pour test (à desactiver)
    echo ">Nom :".$nom."<br>";
    echo ">Pass :".$mdp."<br>";
    // Check si mdp correct
    if ($_SESSION["login"]==$nom && $_SESSION["psw"]==$mdp) {
        echo "bim";
    } else {
        echo '<script type="text/javascript">'
            . 'alert("ACCES REFUSE");'
            . '</script>';
        //
        //header("Location:index.php");
        //exit;
    }
    // Destruction propre de la session
    $_SESSION["login"] = "";
    $_SESSION["psw"] = "";
    unset($_SESSION["login"]);
    unset($_SESSION["psw"]);
    if (ini_get("session.use_cookies")) 
    {
        setcookie(session_name(), '', time()-1);
        echo "<br>Session nuked !<br>";
    }
    session_destroy();
?>