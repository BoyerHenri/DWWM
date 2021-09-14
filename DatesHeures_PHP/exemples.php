<?php
    echo time()."<br>";
    //
    $date = date("d/m/Y");
    echo"Nous sommes le ".$date."<br>";

    // Ou directement :
    echo"Nous sommes le ".date("d/m/Y")."<br>";
    echo date("H:i:s")."<br>";


    // on déclare une instance de l'objet PHP 'DateTime' : 
    $oDate = new DateTime();
    var_dump($oDate);
    echo "<br><br>";

    $oDate = new DateTime("01-01-2018");
    var_dump($oDate);
    echo "<br><br>";

    // $macolonne_sql est issue d'une requête SQL; avec pour valeur 2018-11-16 11:26:51 (par exemple) 
    $oDate = new DateTime($macolonne_sql);
    echo $oDate->format("d/m/Y H:\hi");
    echo "<br><br>";

    $datePattern = "/^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$/";
    $date = "01-10-2019";

    if (preg_match($datePattern,$date))
    {
        echo "Date ".$date." valide.<br>";
    }
    else 
    {
        echo "Date ".$date." erronée.<br>";
    }

    // CheckDate
    echo "<br><br>";
    $date = "01/10/2019";


    /* 
    * - On découpe la chaîne $date selon '/' avec la fonction explode() qui retourne un tableau 
    * - Les éléments du tableau sont directement afffecté à des variables ($dd, $mm, $yyyy) dans un ordre respectif grâce à la fonction list()      
    */
    list($dd, $mm, $yyyy) = explode('/', $date);

    /* Les variables $dd, $mm, $yyyy sont des chaînes, or la fonction checkdate()  
    * n'accepte que des entiers
    */
    echo gettype($dd); // indique que $dd est une chaîne

    /* On va donc 'caster' c'est-à-dire changer le type d'une variable,
    * ici on veut un entier, la syntaxe est de l'indiquer avec (int) 
    * devant la variable
    */ 
    $dd = (int) $dd;

    echo gettype($dd); // $dd est désormais bien un entier

    $mm = (int) $mm;
    $yyyy = (int) $yyyy;

    if (!checkdate($mm, $dd, $yyyy))
    {         
        echo"Date ".$date." est erronée.";
    }


    // Récupérer les erreurs de l'objet DateTime
    $dateTime = DateTime::createFromFormat('m/d/Y', $date);

    $errors = DateTime::getLastErrors();

    if (!empty($errors['warning_count'])) 
    {
    return FALSE;
    }

?>