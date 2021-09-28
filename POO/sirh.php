<?php
    echo "----------------------------------------------------------------------------<br>";
    echo "S.I.R.H.<br>----------------------------------------------------------------<br>";
    $c="classes/Employe.class.php";
    include($c);
    //
    // $hire="15/12/2012-15:30";
    // $date=new DateTime($hire);
    //
    $hire=date_create("15-12-2012");
    $date_f=date_format($hire,"Y");
   // $date_f=DateTime::createFromFormat('d/m/Y-H:i',$date);
    //$date_f=$date->format('Y');
    //echo ">$date_f<br><br>";
    //
    $emp=new Employe("ANTON","Lavey","$date_f","Designer",10000,"Communication");  
    echo "Nom : ".$emp->Nom()."<br>";
    echo "Prenom : ".$emp->Prenom()."<br>";
    echo "Date d'embauche : ".$emp->DateEmbauche()."<br>";
    echo "Poste actuel : ".$emp->Poste()."<br>";
    echo "Salaire annuel : ".$emp->Salaire()."<br>";
    echo "Service : ".$emp->Service()."<br>";
    echo "<br>";
    echo "----------------------------------------------------------------------------<br>";
    echo "DETAILS.<br>----------------------------------------------------------------<br>";
    // Methode anciennete
    $emp->anciennete($date_f);
    // Prime annuelle
    $emp->annualPrime($emp->Salaire());
//1.05