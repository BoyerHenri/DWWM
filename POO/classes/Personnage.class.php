<?php
class Personnage {
      private $_nom;
      private $_prenom;
      private $_age;
      private $_sexe;
      //
      function __construct($nom,$prenom,$age,$sexe){
          $this->_nom=$nom;
          $this->_prenom=$prenom;
          $this->_age=$age;
          $this->_sexe=$sexe;
      }
      //
      public function Nom($value="") {
          if ($value==""){
              return $this->_nom;
          }
      }
      public function Prenom($value="") {
          if ($value==""){
          }
          return $this->_prenom;
      }
      public function Age($value="") {
         if ($value==""){
         }
         return $this->_age;
      }
      public function Sexe($value="") {
         if ($value==""){
         }
         return $this->_sexe;
     }
      
   }