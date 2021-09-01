<html>
	<body>
		<?php
		// Declaration du tableau
		$a = array(
			"19001" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "", "", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", "Validation"), 
			"19002" => array("Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Validation", ""), 
			"19003" => array("", "", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Centre", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "Stage", "", "", "Validation") 
		);
		// Affichage du/des tableau
		// var_dump($a[19002]);
		
		// Quelle semaine a lieu la validation du groupe 19002
		$pos=array_search("Validation",$a[19002]);
		echo "<br> SEMAINE ".$pos." DE VALIDATION<br>";
		
		// Derniere occurence de 19001
		$value=array_pop($a[19001]); 	
		echo "<br> >>>".$value;	

		// Extraire dans un nouveau tableau les codes des groupes
		$code=array_keys($a);
		echo "<pre>";
			print_r ($code);
		echo "</pre>";
		
		// Combien de semaines dure le stage du groupe 19003
		$nbr=count(array_keys($a[19003],"Stage"));
		echo "<br>Le stage du groupe 19003 <br>".$nbr." semaines.";
		?>
	</body>
</html>