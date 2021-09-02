<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,0 shrink-to-fit=no"> 
	<!--Integration de BOOTSTRAP-->  
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!-- Titre -->
    <title>Jarditou</title>
</head>
<body>
	<div class="container"> <!--Container BOOTSTRAP pour la grille-->
		<!--Logo Top-->
		<div class="row align-items-center">
			<div class="col-12 col-md-6 col-lg-8 d-none d-lg-block">
				<img src="src/img/jarditou_logo.jpg" alt="Logo JARDITOU" title="Logo JARDITOU" class="img-fluid" width="180">
			</div>
			<div class="col-12 col-md-6 col-lg-4 d-none d-lg-block text-right">
				<h1>Tout le jardin</h1>
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
								<a class="nav-link" href="index.php">Accueil</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="tableau.php">Tableau</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="formulaire.php">Contact</a>
							</li>
						</ul>
					</div>
					<!--Recherche-->
					<div class="col d-none d-lg-block">							
						<form class="form-inline float-right">
							<input class="form-control me-2" type="search" placeholder="Rechercher" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Votre promotion</button>
						</form>
					</div>        
				</nav>
			</div>				
		</div>
			<!--Banniere-->
			<div class="row">
				 <div class="col ">
					<img src="src/img/promotion.jpg" alt="Promotion lames de terrasse" title="Promotion lames de terrasse"  class="img-fluid" >
				</div>
			</div>	
		<!-- Elements centraux-->
		<div class="row shadow m-0">
			<!--Infos-->
			<div class="col-12 col-md-6 col-lg-8">
				<section>
					<h4>L'entreprise</h4>
					<article>						
						Notre entreprise familiale met tout son savoir-faire à votre disposition dans le domaine du jardin et du paysagisme.<br>
						Créée il y a 70 ans, notre entreprise vend fleurs, arbustes, matériel à main et motorisés.<br>
						Implantés à Amiens, nous intervenons dans tout le département de la Somme : Albert, Doullens, Péronne, Abbeville, Corbie<br>
					</article>
					<article>
						<h4>Qualité</h4>
						Nous mettons à votre disposition un service personnalisé, avec 1 seul interlocuteur durant tout votre projet.<br>
						Vous serez séduit par notre expertise, nos compétences et notre sérieux.<br>
					</article>
					<article>
						<h4>Devis gratuit</h4>
						Vous pouvez bien sûr contacter pour de plus amples informations ou pour une demande d’intervention. Vous souhaitez un devis ? Nous vous le réalisons gratuitement.<br>
					</article>
				</section>
			</div>
			<!--Colonne de droite-->			
			<div class="col-md-6 col-lg-4 bg-warning" style="text-align: center;">
				<aside>
					<h4>[COLONNE DE DROITE]</h4>
				</aside>
			</div>
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