<?php
    /*
        $unixTime = time();
        $timeZone = new \DateTimeZone('Europe/Paris');
        
        $time = new \DateTime();
        $time->setTimestamp($unixTime)->setTimezone($timeZone);
        
        $formattedTime = $time->format('Y/m/d H:i:s');
        echo $formattedTime;
        echo "<br><br>";
        //
        $formattedTime = $time->format('Y/m/d H:i:s');
        echo $formattedTime;

        //
        echo "<br><br>";
        setlocale(LC_TIME, "C");
        echo strftime("%A");
    */

	// Exemples
   
    /*
    echo "<br><br>";
    $oDate=new DateTime();
    var_dump($oDate);
    echo "<br><br>";
    echo $oDate->format("d m Y A l");
    */
    
    // Exercices

    // 1-- Affichez la date du jour au format mardi 2 juillet 2019.
    echo "<br>Affichez la date du jour au format mardi 2 juillet 2019.<br>";
    $oDate=new DateTime();
    echo $oDate->format("l d F Y");
    echo "<br>";
    // 2-- Trouvez le numéro de semaine de la date suivante : 14/07/2019.
    echo "<br>Trouvez le numéro de semaine de la date suivante : 14/07/2019.<br>";
    $oDate=new DateTime("14-07-2019");
    echo $oDate->format("W");
    echo "<br>";
    // 3-- Combien reste-t-il de jours avant la fin de votre formation.
    echo "<br>Combien reste-t-il de jours avant la fin de votre formation.<br>";
    $datetime1 = new DateTime();
    $datetime2 = date_create("03-03-2021");
    $interval = date_diff($datetime1, $datetime2);
    echo $interval->format('%R%a days');
    echo "<br>";
    // 4-- Reprenez l'exercice 3, mais traitez le problème avec les fonctions de gestion du timestamp, time() et mktime().
    echo "<br>Reprenez l'exercice 3, mais traitez le problème avec les fonctions de gestion du timestamp, time() et mktime().<br>";
    $tim= time();
    $vieux_timestamp = mktime(0, 0, 0, 3, 3, 2021);
    $diff=round(($vieux_timestamp-$tim)/86400);
    echo 'Diff : '.$diff;
    echo "<br>";
    // 5-- Quelle sera la prochaine année bissextile ?
    echo "<br>Quelle sera la prochaine année bissextile ?<br>";
    // $annee=2016;
    // $bissex=date("m-d", strtotime("$annee-02-29")) == "02-29";
    // echo ">".$bissex;
    // Variante    
    $aa=date('Y');;
    echo "Recherche de la prochaine année bissextile... <br>"; 
    for($aa; $aa<=2100; $aa++) {
        if(bissextile($aa)) {
            echo '<font color="#CC0000"><strong>' . $aa . ' : Bissextile</strong></font><br>';
            echo "<br>FIN DE CALCUL<br>";
            break;
        } else {
            echo $aa . ' : Non bissextile<br>';
        }
    }
    // Fonction Bissextile
    function bissextile($annee) {
        if( (is_int($annee/4) && !is_int($annee/100)) || is_int($annee/400)) {
            // Année bissextile
            // vous remplacez le retour par ce que vou voulez
            return TRUE;
        } else {
            // Année NON bissextile
            // vous remplacez le retour par ce que vou voulez
            return FALSE;
        }
    }
    echo "<br>";
    // 6-- Montrez que la date du 17/17/2019 est erronée.
    $date="17/12/2019";
    echo "<br>Montrez que la date du ".$date." est erronée ou correcte.<br>";
    list($dd, $mm, $yyyy) = explode('/', $date);
    // echo gettype($dd); // indique que $dd est une chaîne
    $dd = (int) $dd;
    // echo gettype($dd); // $dd est désormais bien un entier
    $mm = (int) $mm;
    $yyyy = (int) $yyyy;
    //
    if (!checkdate($mm, $dd, $yyyy))
    {         
        echo"Date ".$date." est erronée.";
    } else {
        echo"Date ".$date." est correcte !.";
    }
    echo "<br>";
    // 7-- Affichez l'heure courante sous cette forme : 11h25.
    echo "<br>Affichez l'heure courante sous cette forme : 11h25.<br>";
    $oDate=new DateTime();
    $heure=$oDate->format("H");
    $minute=$oDate->format("i");
    echo $heure."H".$minute;
    echo "<br>";
    // 8 -- Ajoutez 1 mois à la date courante.
    echo "<br>Ajoutez 1 mois à la date courante.<br>";
    $oDate=new DateTime();
    $add=new DateInterval('P1M');
    $oDate->add($add);
    $sDate=$oDate->format(F);
    echo "Dans un mois nous serons en ".$sDate;
    echo "<br>";
?>
