<?php
   echo "<br>Exercice 001<br>";
   include("classes/Personnage.class.php");
   //
   // Personnage($nom,$prenom,$age,$sexe);
   $p=new Personnage ("LEBOWSKIKI","Jeff",25, "Masculin");  
   echo "Monsieur ".$p->Nom()." ".$p->Prenom()." .<br> Est agé de ".$p->Age()." ans<br> Est de sexe ".$p->Sexe();
  
