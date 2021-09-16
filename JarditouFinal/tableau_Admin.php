<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,0 shrink-to-fit=no"> 
	<!--Integration de BOOTSTRAP-->  
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!-- Titre -->
	<title>Tableau</title>
</head>
<body>
	<!-- Appel des fonctions de connection -->
	<?php
		include("assets/php/connexion_bdd.php");
		//connexionBase();
	?>
	<div class="container"> <!--Container BOOTSTRAP pour la grille-->
		<!--Logo Top-->
		<div class="row align-items-center">
			<div class="col-12 col-md-6 col-lg-8 d-none d-lg-block">
				<img src="src/img/jarditou_logo.jpg" alt="Logo JARDITOU" title="Logo JARDITOU" class="img-fluid" width="180">
			</div>
			<div class="col-12 col-md-6 col-lg-4 d-none d-lg-block text-right">
				<h1>ESPACE ADMIN</h1>
			</div>
		</div>
		<!--Nav Bar-->
		<div class="row">
			<div class="col">
				<nav class="navbar navbar-expand-lg bg-light navbar-light">
					<!-- Brand -->
					<a class="navbar-brand" href="#">Jarditou.com</a>
					<!-- Menu Extensible -->
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
					</button>   
					<div class="collapse navbar-collapse" id="collapsibleNavbar">
						<ul class="navbar-nav">
							<li class="nav-item">
								<!-- <a class="nav-link" href="tableau.php">RETOUR</a> -->
								<button type="button" class="btn btn-warning">
									<a class="nav-link" href="tableau.php">RETOUR</a>
								</button>
							</li>
							<li class="nav-item">
								<!-- Rajouter article ESPACE ADMIN -->
								<button type="button" class="btn btn-success">
									<a class="nav-link" href="AjouterArticle.php">Ajouter article</a>
								</button>
							</li>
						</ul>
					</div>
					<!--Recherche
					<div class="col d-none d-lg-block">							
						<form class="form-inline float-right">
							<input class="form-control me-2" type="search" placeholder="Rechercher" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Votre promotion</button>
						</form>
					</div>
					-->   
				</nav>
			</div>				
		</div>
		<!--Banniere-->
		<div class="row">
			<div class="col ">
	   		<img src="src/img/promotion.jpg" alt="Promotion lames de terrasse" title="Promotion lames de terrasse"  class="img-fluid" >
   			</div>
		</div>	
		<!-- Elements centraux -->
		<!-- Tableau des produits -->
			<div class="table-responsive table-warning">

				<?php echo "<table class='table table-striped table-hover table-active table-warning'>"; ?>
				<thead class="thead-light"> 
					<tr>
							<th><p class="font-weight-bold">Photo</p></th>
							<th><p class="font-weight-bold">ID</p></th>
							<th><p class="font-weight-bold">Réference</p></th>
							<th><p class="font-weight-bold">Libellé</p></th>
							<th><p class="font-weight-bold">Prix</p></th>
							<th><p class="font-weight-bold">Stock</p></th>
							<th><p class="font-weight-bold">Couleur</p></th>
							<th><p class="font-weight-bold">Ajout</p></th>
							<th><p class="font-weight-bold">Modif</p></th>
							<th><p class="font-weight-bold">Bloqué</p></th>
					</tr>
				</thead>
				<?php
					//require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
					$db = connexionBase(); // Appel de la fonction de connexion ( WHERE ISNULL(pro_bloque)  )
					$requete = "SELECT pro_photo,pro_id,pro_ref,pro_libelle,pro_prix,pro_stock,pro_couleur,pro_d_ajout,pro_d_modif,pro_bloque FROM produits ORDER BY pro_d_ajout DESC";

					$result = $db->query($requete);

					if (!$result) 
					{
						$tableauErreurs = $db->errorInfo();
						echo $tableauErreur[2]; 
						die("Erreur dans la requête");
					}

					if ($result->rowCount() == 0) 
					{
					// Pas d'enregistrement
					die("La table est vide");
					}

					

					while ($row = $result->fetch(PDO::FETCH_OBJ))
					{
						echo"<tr>"; 
						// Recupere extension (DEBUG)
						$ext=$row->pro_photo;
						// echo $ext;
						// Affichage image
						echo"<td><img src='src/img/".$row->pro_id.".".$ext."' width='80 px' </td>";
						echo"<td>".$row->pro_id."</td>";
						echo"<td>".$row->pro_ref."</td>";
						// echo"<td>".$row->pro_libelle."</td>";
						echo"<td><button type='button' class='btn btn-danger'><a href=\"assets/php/detail.php?pro_id=".$row->pro_id."\" title=\"".$row->pro_libelle."\">".$row->pro_libelle."</a></button></td>";					
						echo"<td>".$row->pro_prix."</td>";
						echo"<td>".$row->pro_stock."</td>";
						echo"<td>".$row->pro_couleur."</td>";
						echo"<td>".$row->pro_d_ajout."</td>";
						echo"<td>".$row->pro_d_modif."</td>";
						if ($row->pro_bloque==1) {
							echo "<td>OUI</td>";
						}else{
							echo "<td> </td>";
						}
						//echo"<td>".$row->pro_bloque."</td>";
						// echo"<td><a href=\"detail.php?id=".$row->pro_id."\" title=\"".$row->pro_libelle."\">".$row->pro_libelle."</a></td>";
						// echo "<td><a href=\detail.php?id=".$row->pro_id."\title=\".$row->pro_libelle."\</a></td>";
						echo "</tr>";
					}

					echo "</table>"; 
				?>
			</div>

		<!-- Pied de page -->
		<footer>
			<div class="row">
				<div class="col" class="navbar navbar-expand-lg bg-light navbar-light">
					<nav class="navbar navbar-expand-lg bg-light bg-dark">
						<!-- Menu Extensible -->
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
						<span class="navbar-toggler-icon"></span>
						</button>   
						<div class="collapse navbar-collapse" id="collapsibleNavbar">
							<ul class="navbar-nav">
								<li class="nav-item">
									<a class="nav-link" href="#">Mentions légales</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">horaires</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">plan du site</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</footer>
	</div>
	<!--JS Bootstrap-->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
</body>
</html>