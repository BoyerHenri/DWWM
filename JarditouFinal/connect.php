<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compte Client</title>
</head>
<body> 
    <h2>Connection ou inscription</h2><br>
    <!-- Connection -->
    <div class="card text-black bg-light mb-3">
        <form action="assets/php/connection_check.php" method="POST">
                <h5>Connection</h5><br>
            <div class="form-group">
                <label for="login_c">Login</label>
                <input type="text" class="form-control" id="login_c" placeholder="Superman" name="login_c">
            </div>
            <div class="form-group">
                <label for="mdp_c">Mot de passe</label>
                <input type="password" class="form-control" id="mdp_c" placeholder="Mot de passe" name="mdp_c">
            </div>
            <button type="submit" class="btn btn-primary">Connection !</button>
        </form>
    </div>
    <br>
    <br>
    <br>
    <!-- Inscription -->
    <div class="card text-black bg-light mb-3">
        <form action="assets/php/inscrit_check.php" method="POST">
                <h5>Inscription</h5><br>
            <div class="form-group">
                <label for="login_i">Login</label>
                <input type="text" class="form-control" id="login_i" placeholder="Superman" name="login_i">
            </div>
            <div class="form-group">
                <label for="name_i">Nom</label>
                <input type="text" class="form-control" id="name_i" placeholder="KENT" name="name_i">
            </div>
            <div class="form-group">
                <label for="prename_i">Prénom</label>
                <input type="text" class="form-control" id="prename_i" placeholder="Clark" name="prename_i">
            </div>
            <div class="form-group">
                <label for="login_mail">Email</label>
                <input type="email" class="form-control" id="login_mail" aria-describedby="emailHelp" placeholder="vous@nous.fr" name="login_mail">
                <small id="emailHelp" class="form-text text-muted">Votre Email ne sera pas publique.</small>
            </div>
            <div class="form-group">
                <label for="mdp_i">Mot de passe</label>
                <input type="password" class="form-control" id="mdp_i" placeholder="Mot de passe" name="mdp_i">
            </div>
            <div class="form-group">
                <label for="mdp_i_v">Vérification du mot de passe</label>
                <input type="password" class="form-control" id="mdp_i_v" placeholder="Mot de passe" name="mdp_i_v">
                <!-- <span id="mdp_no">...</span> -->
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
    <!-- -->
    <br>
    <br>
    <br>
</body>
</html>