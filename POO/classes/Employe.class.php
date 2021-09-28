<?php
    class Employe{
        // Attributs
        private $_nom;
        private $_prenom;
        private $_dateEmbauche;
        private $_poste;
        private $_salaire;
        private $_service;
        
        // Constructeur
        function __construct($nom,$prenom,$dateEmbauche,$poste,$salaire,$service){
            $this->_nom=$nom;
            $this->_prenom=$prenom;
            $this->_dateEmbauche=$dateEmbauche;
            $this->_poste=$poste;
            $this->_salaire=$salaire;
            $this->_service=$service;
            //
        }
        // Methodes
        // Ancienneté du sujet
        public function anciennete($d) {
            $now=new DateTime();
            $date_now=$now->format("Y");
            echo "Ancienneté du sujet :<br>";
            $interval=$date_now-$d;
            // 
            echo "A l'année du $date_now, ce sujet engagé le $d : <br> Soit $interval an(s) de service.<br>";
        } 
        // Prime d'annuelle
        public function annualPrime($s){
            $anPrime=$s*1.05;
            echo ">>> $anPrime<br>$interval";
        }
        // Accesseurs
        public function Nom() {
                return $this->_nom;
        }
        public function Prenom() {
            return $this->_prenom;
        }
        public function DateEmbauche() {
            return $this->_dateEmbauche;
        }
        public function Poste() {
            return $this->_poste;
        }
        public function Salaire() {
            return $this->_salaire;
        }
        public function Service() {
            return $this->_service;
        }
    }
