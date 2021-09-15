<?php
    //
    
    session_start();
    $_SESSION["login"] = "webmaster";
    echo $_SESSION["login"];
    //
    echo "<br>";
    //
    // session_start();
    $_SESSION["login"] = "webmaster";
    $_SESSION["role"] = "admin";
    echo"- session ID : ".session_id();
    echo "<br>";
    //
    if ($_SESSION["login"]) 
    {
        echo"Vous êtes autorisé à voir cette page.";  
    } 
    else 
    {
        echo"Cette page nécessite une identification.";  
    }
    //
    echo "<br>";
    session_start();
    if ( ! isset($_SESSION["login"]) ) 
    {
        header("Location:index.php");
        exit;
    }
    // Reste du code (PHP/HTML)
    echo"Bonjour ".$_SESSION["login"]."<br>";  
    //
    echo "<br>";
    echo"- Nom de la session : ".session_name();
    echo "<br>";
    // 
    session_name("afpa");
    echo"- Nom de la session : ".session_name();

    // Destruction propre de la session
    $_SESSION["login"] = "";
    $_SESSION["role"] = "";
    unset($_SESSION["login"]);
    unset($_SESSION["role"]);
    if (ini_get("session.use_cookies")) 
    {
        setcookie(session_name(), '', time()-1);
        echo "<br>Session nuked !<br>";
    }
    session_destroy();
    //
    echo "<br><br>";
    $password_hash = password_hash("vacances", PASSWORD_DEFAULT);
    echo "Mot de passe haché : ".$password_hash; 
    echo "<br><br>";
?>