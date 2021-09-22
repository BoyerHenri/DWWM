<?php
    // Création de classe, description des objets.
//  class Chat {}
//  class Chapeau {}

    // Création d'un nouvel objet de type Chat.
    // Les parenthéses invoquent le constructeur de la classe.
    // -> Le constructeur est le code qui est executé quand la classe crée 
    // un nouvel objet.
//  $monChat=new Chat();

    // Les proprietes décrivent un objet comme les adjectifs décrivent un nom.
/*    class Chat {
        var $_couleur;
        var $_race;
    }
*/   

    // Definir "private" comme option la plus sécurisée pour définir ces variavbles :
//  class Chat {
//      private $_couleur;
//      private $_race;
//  }

    // Methode d'accée pour entrer une valeur dans ces champs, le code suivant
    // provoquera une exception, étant définies en "private"
//  $monChat=new Chat();
//  $monChat->_couleur="Vert";

    // Le constructeur de classe est un bloc de qui est executé quand la classe est 
    // instanciée ou en utilsant le mot clef new.
    class Chat {
        private $_couleur;
        private $_race;
        //
        function __construct($couleur,$race){
            $this->_couleur=$couleur;
            $this->_race=$race;
            echo "001<br>"; // TRON
        }
        // Manieres de récupérer les champs de notre chat pour que d'autres parties du programme
        // puissent utiliser ces valeurs
        public function Couleur($value="") {
            echo "002<br>"; // TRON
            if ($value==""){
                echo "002 a<br>"; // TRON
                return $this->_couleur;
            }
        }
        public function Race() {
            echo "003<br>"; // TRON
            if ($value==""){
                echo "003 a<br>"; // TRON
            }
            return $this->_race;
        }
    }
    //
    class Chapeau {
        private $_modele;
        private $_taille;
        //
        function __construct($modele,$taille){
            $this->_modele=$modele;
            $this->_taille=$taille;
            echo "001<br>"; // TRON
        }
        // Manieres de récupérer les champs de notre chat pour que d'autres parties du programme
        // puissent utiliser ces valeurs
        public function Modele($value="") {
            echo "002<br>"; // TRON
            if ($value==""){
                echo "002 a<br>"; // TRON
                return $this->_modele;
            }
        }
        public function Taille() {
            echo "003<br>"; // TRON
            if ($value==""){
                echo "003 a<br>"; // TRON
            }
            return $this->_taille;
        }
    }
    //
    $monChat=new Chat("siamois","mignon");    
    $monChapeau=new Chapeau("chinois","petit");
    echo "Le chat ".$monChat->Couleur()." ".$monChat->Race()." peut s'asseoir sur le grand chapeau rayé.";
    echo "<br>";
    echo "Le chapeau ".$monChapeau->Modele()." est ".$monChapeau->Taille()." !"
?>