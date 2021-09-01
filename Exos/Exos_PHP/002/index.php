<html>
	<body>
	<!-- Exercice 01 -->
	Recherche des impairs jusqu'a 150.<br>
	<?php
		for($lop=1;$lop<150;$lop++){
			if ($lop%2!=0){
				echo "> ".$lop."   ";
			}
			if ($lop%15==1){
				echo "<br>";
			}
		}
	?>
	<br><br>
	Bart Simpson punition <br>
	<?php
		for($lop=1;$lop<501;$lop++){
				echo $lop." Je dois faire des sauvegardes régulières de mes fichiers.<br>";
		}
	?>
	<br><br>
	Tableau de multiplication <br>
	<?php
		// Lancement de la fonction
		echo multiple();
		// Sous programmes
		function multiple(){
			$table="<table border=2>";
			for ($x=0;$x<=12;$x++){
				$table.="<tr>";
				for($y=0;$y<=12;$y++){
					$table.="<td>".$x*$y."</h1>";
				}
			$table.="</tr>";
			}
		$table.="</table>";
		return $table;
		}
	?>
	</body>
</html>