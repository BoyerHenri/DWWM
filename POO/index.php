<?php
    //
    class Animal
    {
        public $_espece;
        public $_regimeAlimentaire;
        public $_taille;
        public $_poids;
    }
    // Commençons par créer un animal :
    $oChien = new Animal();
    //
    echo "Lancement classe...<br>";
    //
    $chien->_espece = "Chien";
    $chien->_regimeAlimentaire = "Carnivore";
    $chien->_taille = 110;
    $chien->_poids = 16000;
?>