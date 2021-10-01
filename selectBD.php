<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <?php
    //BUT = faire SELECT dans la BD Sakila
    // afficher liste acteurs dans un array
    
    // Connecter à la BD (créer un objet de la classe PDO)
    // On doit envoyer quelques paramètres dans le constructeur

// adresse : localhost
// port : 3306
// nom de la BD : sakila
// user (login) : root
// password : "" par défaut
// new PDO(mysql:host=localhost;port=3306;dbname=sakila;charset=utf8, root, "");

include "./config/db.php";
$bdd = new PDO(DBDRIVER.':host='.DBHOST.';port='.DBPORT.';dbname='.DBNAME.';charset='.DBCHARSET,DBUSER,DBPASS);



    // Créer une requête SQL dans un string
$sqlRequete = "SELECT * FROM actor" ;

    // Préparer la requête (l'envoyer au serveur sans la lancer!)
    // en php, on utilise -> pour entrer dans les méthodes d'un objet comme on ferait bdd.addEventListener() en Javascript
$prepaRequete = $bdd -> prepare($sqlRequete);
var_dump($prepaRequete);

    // Lancer la requête
$prepaRequete -> execute();

// Obtenir le résultat sou la forme d'un array
$resultat = $prepaRequete -> fetchAll(PDO::FETCH_ASSOC);
//fetch() ligne par ligne
//fetchAll() tous
var_dump($resultat);

// chaque élément de l'array est un tableau : système simple
foreach ($resultat as $ligne){
    // une boucle pour parcourir chaque array (chaque ligne du résultat)
    foreach ($ligne as $cle => $val){
        echo "<br>";
        echo "cle: ".$cle. "<br>";
        echo "val: ".$val;
    }
    // On pourrait juste afficher les champs de notre choix 
    // au lieu de parcourir tous
    echo $ligne['last_name'];
}        
    ?>

</body>
</html>