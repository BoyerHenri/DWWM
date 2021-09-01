/* Affiche la demande dans la textarea*/
function affiche_dmd(){
    var ent=document.getElementById("Demande").value;
    document.getElementById("QUESTION").innerHTML+=ent+" ";
    /* alert(ent); */
}

 // Validation du formulaire /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/  /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}/
var filtre_nom=new RegExp("^[a-zA-Z]+$");
var filtre_seske=new RegExp("[Homme|Femme|Inconnu]")
var filtre_birth=new RegExp("^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$");
var filtre_cp=new RegExp("^[0-9]{5}$");
//var filtre_demande=new RegExp("(.|\s)*");
var validDemand=/^[A-Za-z\W\w]+$/;
var validMail=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;


//
 function check(f){
   // Flag OFF / message d'erreur
   var validage=false;
   var check_prcd=0;

   // ------------------------------------------> Verification du nom
   var valeur=f.elements["NOM"].value;
   var resultat=filtre_nom.test(valeur);
   if (resultat==true){
      document.getElementById("name_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
      validage=true;
      check_prcd++;
   }else if(resultat==false) {
      // errorText+="NOM\n";
      document.getElementById("name_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre nom !</p>";
      validage=false;
   }
   // ------------------------------------------> Verification du prenom
   var valeur=f.elements["PRENOM"].value;
   var resultat=filtre_nom.test(valeur);
   if (resultat==true){
     document.getElementById("prename_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
     validage=true;
     check_prcd++;
   } else if(resultat==false) {
     //errorText+="PRENOM\n";
     document.getElementById("prename_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre prénom !</p>";
     validage=false;
   }

   // ------------------------------------------> Verification du seske
   var valeur=f.elements["SEXE"].value;
   var resultat=filtre_nom.test(valeur);
   if (resultat==true){
    document.getElementById("seske_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
     validage=true;
     check_prcd++;
   } else if(resultat==false) {
     //errorText+="VOTRE SESKE\n";
     document.getElementById("seske_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre seske !</p>";
     validage=false;
   }

   // ------------------------------------------> Verification de la date de naissance
   var valeur=f.elements["DATE"].value;
   var resultat=filtre_birth.test(valeur);
   //var resultat=valeur.match(validBirth);
   console.log(resultat+"---"+valeur);
   if (resultat==true){
    document.getElementById("birth_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
    validage=true;
    check_prcd++;
  } else if(resultat==false) {
    //errorText+="VOTRE EMAIL\n";
    document.getElementById("birth_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre date de naissance !</p>";
    validage=false;
  }
   

   // ------------------------------------------> Verification du code postal
   var valeur=f.elements["ZIPCODE"].value;
   var resultat=filtre_cp.test(valeur);
   if (resultat==true){
     document.getElementById("zip_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
     validage=true;
     check_prcd++;
   } else if(resultat==false) {
     //errorText+="VOTRE CODE POSTAL\n";
     document.getElementById("zip_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre code postal !</p>";
     validage=false;
   }

   //* ------------------------------------------> Verification de l'Email
   var valeur=f.elements["EMAIL"].value;
   var resultat=valeur.match(validMail);
   if (valeur==resultat){
     document.getElementById("mail_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
     validage=true;
     check_prcd++;
   } else if(valeur!=resultat) {
     //errorText+="VOTRE EMAIL\n";
     document.getElementById("mail_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre E-Mail !</p>";
     validage=false;
   }

   //* ------------------------------------------> Verification de la question
   var valeur=f.elements["QUESTION"].value;
   //var resultat=filtre_demande.test(valeur);
   var resultat=valeur.match(validDemand);
   console.log(resultat);
   //if (resultat==true){
    if (valeur==resultat){
     document.getElementById("question_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";
     validage=true;
     check_prcd++;
   } else if(valeur!=resultat) {
   //} else if(resultat==false) {
     //errorText+="VOTRE CODE POSTAL\n";
     document.getElementById("question_no").innerHTML="<br><p style='color:red; text-align:center;'>Entrez votre QUESTION !</p>";
     validage=false;
   }
   

   //* ------------------------------------------> Check case à cocher
   var valeur=f.Accord.checked;
   console.log("\n"+check_prcd+"\n");
   if (valeur==true){
    document.getElementById("accept_no").innerHTML="<br><p style='color:green; text-align:center;'>OK</p>";    
    console.log("\n Form Ok \n");
    if (check_prcd==7) {
      //return true;
      validage=true;
      return validage;
    }
  } else if(valeur==false) {
    //errorText+="VEUILLEZ DONNER VOTRE ACCORD\n";
    document.getElementById("accept_no").innerHTML="<br><p style='color:red; text-align:center;'>Donnez votre accord !</p>";
    validage=false;
    console.log("\n Form NO \n");
  }
    return false;
 }
