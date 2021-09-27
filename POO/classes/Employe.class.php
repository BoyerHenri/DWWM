<?php
    class Employe{
        // Attributs
        private $_nom;
        // Methodes
        function __construct($nom){
            $this->_nom=$nom;
        }
        // Accesseurs
        public function Nom($value="") {
            if ($value==""){
                return $this->_nom;
            }
        }
    }