<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<!--Integration de BOOTSTRAP-->  
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!-- Titre -->
    <title>Contact</title>
</head>
<body>
	<div class="container"> <!--Container BOOTSTRAP pour la grille-->
			<!--Logo Top-->
			<div class="row align-items-center">
				<div class="col-12 col-md-6 col-lg-8 d-none d-lg-block">
					<img src="src/img/jarditou_logo.jpg" alt="Logo JARDITOU" title="Logo JARDITOU" class="img-fluid" width="180">
				</div>
				<div class="col-12 col-md-6 col-lg-4 d-none d-lg-block text-right">
					<h4>La qualité depuis 70 ans</h4>
				</div>
			</div>
			<!-- Nav bar-->
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
		<!-- Elements centraux http://bienvu.net/script.php-->

		<!-- Formulaires -->
		<form  id="contact-form" method="post" action="http://bienvu.net/script.php" onsubmit="return check(this);">
			* ces zones sont obligatoires
			<h1>Vos coordonnées</h1>
			<!-- NOM PRENOM -->
			<div class="form-group">
				<label for="NOM">Nom *</label>				
				<input type="text" class="form-control" id="NOM" name="Nom" placeholder="Veuillez saisir votre nom">				
			</div>
			<span id="name_no"></span>
			<div class="form-group">
				<label for="PRENOM">Prénom *</label>
				<input type="text" class="form-control" id="PRENOM" name="Prenom" placeholder="Veuillez saisir votre prénom">
			</div>
			<span id="prename_no"></span>
			<!--SEXE -->
			<br><br>
			Sexe * 
			<br>
			<div class="custom-control custom-radio">
				<input type="radio" id="FEMME" name="SEXE" class="custom-control-input" name="Sexe" value="Femme">
				<label class="custom-control-label" for="FEMME">Féminin</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="HOMME" name="SEXE" class="custom-control-input" name="Sexe" value="Homme">
				<label class="custom-control-label" for="HOMME">Masculin</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="INCONNU" name="SEXE" class="custom-control-input" name="Sexe" value="Inconnu">
				<label class="custom-control-label" for="INCONNU">Neutre</label>
			</div>
			<span id="seske_no"></span>
			<!-- Date de naissance -->
			<br><br>				
			<div class="form-group">
				<label for="DATE">Date de naissance *</label>
				<input type="date" class="form-control" id="DATE" name="Date_de_naissance">
			</div>
			<span id="birth_no"></span>
			<!-- Code postal -->
			<div class="form-group">
				<label for="ZIPCODE">Code Postal *</label>
				<input type="text" class="form-control" id="ZIPCODE" name="Code_Postal">
			</div>	
			<span id="zip_no"></span>
			<!-- Adresse -->
			<div class="form-group">
				<label for="ADRESSE">Adresse</label>
				<input type="text" class="form-control" id="ADRESSE" name="Adresse">
			</div>	
			<!-- Ville -->
			<div class="form-group">
				<label for="VILLE">Ville</label>
				<input type="text" class="form-control" id="VILLE" name="Ville">
			</div>	
			<!-- Email -->
			<div class="form-group">
				<label for="EMAIL">Email *</label>
				<input type="text"  class="form-control" id="EMAIL" placeholder="dave.loper@afpa.fr" name="Email">
			</div>
			<span id="mail_no"></span>
			<h1>Votre demande</h1>
			<select class="custom-select" name="Demande" id="Demande" onchange="affiche_dmd();">
				<option selected>Veuillez selectionner un sujet</option>
				<option value="Mes commandes" >Mes commandes</option>
				<option value="Question produit">Question sur un produit</option>
				<option value="Reclamation">Réclamation</option>
				<option value="Autre">Autre</option>
			</select>
			<!-- Question -->
			<div class="form-group">
				<label for="QUESTION">Votre question *</label>
				<textarea class="form-control" id="QUESTION" name="Question" placeholder="Votre question ?"></textarea>
			</div>
			<span id="question_no"></span>
			<!--Acceptation-->
			<br>
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="OK" name="Accord" value="oui">
				<label class="custom-control-label" for="OK">J'accepte le traitement de ces informations</label>
			</div>
			<span id="accept_no"></span>
			<!-- Boutons -->
			<br>
			<input type="submit" class="btn-dark" value="Envoyer"> 
			<input type="reset" class="btn-dark" value="Annuler">
		</form>
	 <br>

		<!-- Pied de page -->
		<footer>
			<div class="row">
				<div class="col" class="navbar-expand-lg bg-light navbar-light">
					<nav class="navbar-expand-lg bg-light bg-dark">
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
	<!-- JS Validation de formulaire -->
	<script src="assets/js/formulaire.js"></script>

    <!--
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js" integrity="sha256-dHf/YjH1A4tewEsKUSmNnV05DDbfGN3g7NMq86xgGh8=" crossorigin="anonymous"></script>
    -->
	</body>
</html>