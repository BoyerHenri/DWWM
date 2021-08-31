<!-- bonjour.php -->
<html>
    <body>
        <?php
            echo "Hello le worlde ! \n";
            echo "<h1>Hello le worlde !</h1> \n";
        ?>
        <br>
        <h2>
            <?php  echo "Hello le worlde ! \n";?>
        </h2>
        <?php
            $variable="Pizza";
            $gout="4 fromages";
            echo "<h6>$variable</h6>\n".$gout;
            echo 'L\'église';
            // Tbaleaux
            $menu[0]="Kebab";
            $menu[1]="Pizza";
            $menu[2]="Sushis";
            $menu[3]="Barbecue";
        ?>
        <br>
        <?php
            // Portée des variables
            $a = $b = 2; 
            function somme(){ 
                global $a,$b; 
                $b=$a+$b; 
            } 
            somme(); 
            echo $b."<br>"; 
        ?>
        <br>
        <?php
            function Test1 () 
            { 
               static $a=0; 
               echo "$a<br />"; 
               $a++;
            } 
            // Appel de la fonction (3 fois)
            Test1(); 
            Test1(); 
            Test1();
            // Les variables variables
            $var1 = "bonjour";
            $$var1 = "le monde"; 
            echo '<br>'.$bonjour.'<br>';
            // Variables superglobales
            $_GET["societe"] = "Afpa";
            echo $_GET['societe']; 
            // Forcer le type d'une variable
            $a=15.125863;
            settype($a, "integer"); 
            echo $a; 
            //
            $a = 6.32172; 
            $b = intval($a); 
            $c = doubleval($a); 
            echo $a - $b - $c; 
            // Constantes
            define("EURO", 6.55957);
            echo EURO; // affiche 6.55957
            // Metaconstantes et fonctions de debogages
            $myVar = "bonjour";
            var_dump($myVar);
            // Errorlog et debogage
            $myVar = "KO";

            if ($myVar == "OK") 
            {   
            echo"C'est bon<br>";
            } 
            else 
            {
                echo"Ouh la la pas bien !<br>"; // Message affiché dans la page web
                $message = "Ouh la la pas bien ".__FILE__." ".__LINE__;        
                error_log($message);  
            }
            echo "<br>".$_SERVER[REQUEST_TIME]."";
        ?>
        <br>
        <br>
        <?php
            // print et printf
            $euro = 6.55957;
            printf("%.2f FF<br />",$euro);

            $money1 = 68.75;
            $money2 = 54.35;
            $money = $money1 + $money2;

            echo $money; // affiche 123.1;

            echo "affichage sans printf : ".$money."<br>";

            $monformat = sprintf("%01.2f", $money);

            echo $monformat; // affiche 123.10

            echo "affichage avec printf : ".$monformat."<br>";

            $year = "2002";
            $month = "4";
            $day = "5";

            $date = sprintf("%04d-%02d-%02d", $year, $month, $day);

            echo $date."<br>";
            echo "affichage avec sprintf : ".$date."<br>";
        ?>
    </body>
</html>