<?php
    // Affectation des valeurs des valeurs des variables
    $imprimante=new Produit; // Instanciation de la classe Produit sous le nom "imprimante"
    $imprimante->nom="Imprimante";
    $imprimante->prix=700;
    $imprimante->quantite=20;
    $imprimante->rupture=false;
    $imprimante->photo=true;
    // Affichage des valeurs
    echo "Nom du produit : ".$imprimante->nom."<br>";
    echo "Prix du produit : ".$imprimante->prix."<br>";
    echo "Quantité du produit : ".$imprimante->quantite."<br>";
    //
    echo ($imprimante->rupture)?"Rupture de stock<br>":"En stock<br>"; // Condition ternaire
    echo ($imprimante->rupture)?"Rupture de stock<br>":"En stock<br>"; // Condition ternaire
    //

    // **************************
    // *Declaration de la classe*
    // **************************s
    class Produit {
        public $nom="mon Produit";
        public $quantite=10;
        public $prix=120;
        public $rupture=false;
        // Test
        public $photo=true;
        //
        function afficherProduit() {
            return "Affichage du produit";
        }
        function ajouterProduit() {
            return "Un nouveau produit est ajouté";
        }
        function supprimerProduit() {
            return "Un produit à été supprimmer";
        }
    }
    