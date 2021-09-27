<?php
    echo "Sinifniy !<br><br>";
    //
    $l="ABC";
    echo "DEF $l GHI $l";
    //
    echo "<br>";
    $capitales=[
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
    ];
    //
    echo "<br>";
    // NB $produit=$capitales ! (lecture symfony book) 
    prod();
    echo "<br>--------------------------------------------$r entrées !------------------------------------------------------<br>";
    $r=affProd($capitales);
    echo "<br>--------------------------------------------$r entrées !------------------------------------------------------<br>";
    prod();
    echo "<br>--------------------------------------------$r entrées !------------------------------------------------------<br>";
    $r=affProd($capitales);
    echo "<br>--------------------------------------------$r entrées !------------------------------------------------------<br>";
    //
    
    function prod($capitales=["msg"=>"Aucun pays selectionné !"]){
        foreach ($capitales as $key=>$valeur) {
            //echo ($key=="Paris")?($valeur)?"XXX":"":$key.:".$valeur."<br>";
            if ($key=="msg"){
                $c=count($capitales);
                echo "$c $key $valeur";
            }
        }
    }
    
    //
    function affProd($capitales) {
        foreach ($capitales as $key=>$valeur){
                echo "<pre>$valeur     ".$key."</br></pre>";
            if ($key=="Paris"){
                echo "<b>$valeur     ".$key."</br></b>";
            }
        }
        //
        $nbe=count($capitales);
        return $nbe;
    }
?>