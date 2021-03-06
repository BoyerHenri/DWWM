<?php
    // **********
    // *ECRITURE*
    // **********
    // On déclare une variable dont la valeur (contenu) sera écrite dans le fichier
    $myVar = "<strong>Bonjour</strong> le monde <br>";
    // Ouverture en écriture seule 
    $fp = fopen("essai.txt", "a"); 
    // Ecriture du contenu ($myVar) 
    fputs($fp, $myVar); 
    // Fermeture du fichier  
    fclose($fp); 

    // *********
    // *LECTURE* 
    // *********
    // Ouverture en lecture seule  
    $fp = fopen("essai.txt", "r"); 
        // Boucle jusqu'à la fin du fichier
    while (!feof($fp)) 
    { 
        // Lecture d'une ligne, le contenu de la ligne est affecté à la variable $ligne  
        $ligne = fgets($fp, 4096); 
        echo $ligne."<br>"; 
    } 

    // ***************
    // *TEST COMPTEUR*
    // ***************
    // On ouvre le fichier moncompteur.txt
    $fichier = fopen("compteur.txt","r+");
    // on lit le nombre indiqué dans ce fichier dans la variable
    $visiteurs = fgets($fichier,255);
    // on ajoute 1 au nombre de visiteurs
    $visiteurs++;
    // on se positionne au début du fichier
    fseek($fichier,0);
    // on écrit le nouveau nombre dans le fichier
    fputs($fichier,$visiteurs);
    // on referme le fichier moncompteur.txt
    fclose($fichier);
    // on indique sur la page le nombre de visiteurs
    print("$visiteurs personnes sont passées par ici");
    echo "<br><br>";

    // ************************
    // *LISTAGE NB DE FICHIERS*
    // ************************
    $rep=glob("*.*");
    $nb_file=count($rep);
    echo "Nb de fichiers detectes ".$nb_file;
    echo "<br><br>";
?>