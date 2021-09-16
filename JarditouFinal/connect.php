<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compte Client</title>
</head>
<body> 
    <!-- Inscription -->
    <div class="card text-black bg-light mb-3">
        <form action="assets/php/inscrit_check.php" method="POST">
            <h5>Inscription</h5><br>
        <div class="form-group">
            <label for="exampleInputEmail1">Nom/Pseudo</label>
            <input type="email" class="form-control" id="login_i" aria-describedby="emailHelp" placeholder="Nom/Pseudo" name="login_i">
            <small id="emailHelp" class="form-text text-muted">Votre Email ne sera pas publique.</small>
        </div>
        <div class="form-group">
            <label for="mdp_i">Mot de passe</label>
            <input type="password" class="form-control" id="mdp_i" placeholder="Mot de passe" name="mdp_i">
        </div>
        <div class="form-group">
            <label for="mdp_i_v">Vérification du mot de passe</label>
            <input type="password" class="form-control" id="mdp_i_v" placeholder="Mot de passe" name="mdp_i_v">
        </div> 
        <!--
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        -->
        <button type="submit" class="btn btn-primary">Je m'inscris !</button>
        </form>
    </div>
    <br>
    <br>
    <br>


    <br>
    <br>
    <br>
</body>
</html>