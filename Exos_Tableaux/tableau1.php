<style>
    table {
        text-align: center;
    }
</style>
<?php
    // ---------------------------------------
    // 1. Mois de l'année non bissextile
    // ---------------------------------------
    echo "<b>EX 1</b> <br>";
    $mois=array (
        "Janvier"=>31,
        "Février"=>28,
        "Mars"=>31,
        "Avril"=>30,
        "Mai"=>31,
        "Juin"=>30,
        "Juillet"=>31,
        "Aout"=>30,
        "Septembre"=>31,
        "Octobre"=>30,
        "Novembre"=>31,
        "Décembre"=>30
    );

    // Afficage des mois
    echo "Affichage du tableau<br>";
    affMois();
    // Entracte
    echo "<br><br>";
    // Tri du tableau
    asort($mois);
    echo "Après tri ASCENDANT<br>";
    affMois();
     // Entracte
     echo "<br><br>";
    // ---------------------------------------
    // 2. Capitales
    // ---------------------------------------
    echo "<b>EX 2</b> <br>";
    $capitales = array(
        "Bucarest" => "Roumanie",
        "Bruxelles" => "Belgique",
        "Oslo" => "Norvège",
        "Ottawa" => "Canada",
        "Paris" => "France",
        "Port-au-Prince" => "Haïti",
        "Port-d'Espagne" => "Trinité-et-Tobago",
        "Prague" => "République tchèque",
        "Rabat" => "Maroc",
        "Riga" => "Lettonie",
        "Rome" => "Italie",
        "San José" => "Costa Rica",
        "Santiago" => "Chili",
        "Sofia" => "Bulgarie",
        "Alger" => "Algérie",
        "Amsterdam" => "Pays-Bas",
        "Andorre-la-Vieille" => "Andorre",
        "Asuncion" => "Paraguay",
        "Athènes" => "Grèce",
        "Bagdad" => "Irak",
        "Bamako" => "Mali",
        "Berlin" => "Allemagne",
        "Bogota" => "Colombie",
        "Brasilia" => "Brésil",
        "Bratislava" => "Slovaquie",
        "Varsovie" => "Pologne",
        "Budapest" => "Hongrie",
        "Le Caire" => "Egypte",
        "Canberra" => "Australie",
        "Caracas" => "Venezuela",
        "Jakarta" => "Indonésie",
        "Kiev" => "Ukraine",
        "Kigali" => "Rwanda",
        "Kingston" => "Jamaïque",
        "Lima" => "Pérou",
        "Londres" => "Royaume-Uni",
        "Madrid" => "Espagne",
        "Malé" => "Maldives",
        "Mexico" => "Mexique",
        "Minsk" => "Biélorussie",
        "Moscou" => "Russie",
        "Nairobi" => "Kenya",
        "New Delhi" => "Inde",
        "Stockholm" => "Suède",
        "Téhéran" => "Iran",
        "Tokyo" => "Japon",
        "Tunis" => "Tunisie",
        "Copenhague" => "Danemark",
        "Dakar" => "Sénégal",
        "Damas" => "Syrie",
        "Dublin" => "Irlande",
        "Erevan" => "Arménie",
        "La Havane" => "Cuba",
        "Helsinki" => "Finlande",
        "Islamabad" => "Pakistan",
        "Vienne" => "Autriche",
        "Vilnius" => "Lituanie",
        "Zagreb" => "Croatie"
    );
    ksort($capitales);
    echo "Capitales par ordre alphabetique<br>";
    affCapitale();
    // Entracte
    echo "<br><br>";
    asort($capitales);
    echo "Pays par ordre alphabetique<br>";
    affCapitale();
    // Entracte
    echo "<br><br>";
    // Exo 2, suite
    $l="B";
    
    // Parcoure la table et recherche du premier caractere...
    // Supptime toute entrée ne commençant pas par $l :)
    foreach($capitales as $cle=>$valeur) {
        $fcarac=substr($cle,0,1);
        if ($fcarac==$l){
           // echo "<b>".$cle." ".$valeur."</b> "."<br>";
        } else{
           // echo $cle.$valeur.""."<br>";
           unset($capitales[$cle]);
        }
    }

    ksort($capitales);
    echo "Suppression du tableau de toutes les capitales ne commençant pas par la lettre 'B'<br>";
    affCapitale();

    // Entracte
    echo "<br><br>";

    // ---------------------------------------
    // 3. Départements
    // ---------------------------------------
    echo "Departements...<br>";
    $departements = array(
        "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
        "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
        "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
        "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime")
    );
    //
    ksort($departements);
    affDept();

    // ***********
    // *Fonctions*
    // ***********
    function affDept(){
        global $departements;  
        //
        echo "<table border=6>";
            echo "<thead bgcolor='grey'>";
                echo "<tr>";
                    echo "<th>DEPARTEMENTS</th>";
                    echo "<th>NB REGIONS</th>";
                    echo "<th colspan='10'>REGIONS</th>";
                echo "</tr>";
            echo "</thead>";
            echo "<tbody>";                
                    foreach($departements as $cle=>$valeur) {
                        echo "<tr>";
                            echo "<td>".$cle."</td>";
                            // Nb Villes
                            $nb_ville=count($valeur);
                            echo "<td bgcolor='gainsboro'>".$nb_ville."</td>";
                            foreach($valeur as $valeur_sst) {
                                echo "<td>".$valeur_sst."</td>";
                            }                           
                        echo "</tr>";
                    }
            echo "</tbody>";
        echo "</table>";
    }

    function affCapitale(){
        global $capitales;  
        $nb_pays=count($capitales);
        //
        echo "<table border=6>";
            echo "<thead bgcolor='grey'>";
                echo "<tr>";
                    echo "<th colspan='2'>Nb Pays ".$nb_pays." </th>";
                echo "</tr>";
                echo "<tr bgcolor='gainsboro'>";
                    echo "<th>CAPITALES</th>";
                    echo "<th>PAYS</th>";
                echo "</tr>";
            echo "</thead>";
            echo "<tbody>";                
                    foreach($capitales as $cle=>$valeur) {
                        echo "<tr>";
                            echo "<td>".$cle."</td>";
                            echo "<td>".$valeur."</td>";
                        echo "</tr>";
                    }
            echo "</tbody>";
        echo "</table>";
    }

    function affMois(){
        global $mois;  
        //
        echo "<table border=6>";
            echo "<thead bgcolor='grey'>";
                echo "<tr>";
                    echo "<th>MOIS</th>";
                    echo "<th>JOURS</th>";
                echo "</tr>";
            echo "</thead>";
            echo "<tbody>";                
                    foreach($mois as $cle=>$valeur) {
                        echo "<tr>";
                            echo "<td>".$cle."</td>";
                            echo "<td>".$valeur." jours"."</td>";
                        echo "</tr>";
                    }
            echo "</tbody>";
        echo "</table>";
    }
?>
