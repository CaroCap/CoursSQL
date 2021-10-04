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

    $nom = ['Julie', 'Judy', 'Laure'];
    echo "<ul>";
    foreach ($nom as $value) {
        echo "<li>" . $value . "</li>";
    }

    echo "</ul>";

    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    foreach ($nom as $value) {
        echo "<th>" . $value . "</th>";
    }
    echo "</tr>";
    echo "</thead>";
    echo "</table>";

    $film1 = [
        'titre' => 'Rocky 1',
        'nationalite' => 'USA',
        'duree' => 120
    ];

    var_dump($film1);

    echo $film1['nationalite'];

    echo "<table>";
        echo "<thead>";
            echo "<tr>";
                foreach ($film1 as $key => $value) {
                    echo "<th>" . $key . "</th>";
                }
            echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
            echo "<tr>";
                foreach ($film1 as $key => $value) {
                    echo "<td>" . $value . "</td>";
                }
            echo "</tr>";
        echo "</tbody>";
    echo "</table>";

    var_dump(array_keys($film1));

    include "./config/db.php";
    $bdd = new PDO(DBDRIVER . ':host=' . DBHOST . ';port=' . DBPORT . ';dbname=' . DBNAME . ';charset=' . DBCHARSET, DBUSER, DBPASS);
    
    $sqlRequete = "SELECT * FROM actor";
    $prepaRequete = $bdd->prepare($sqlRequete);
    $prepaRequete->execute();
    $resultat = $prepaRequete->fetchAll(PDO::FETCH_ASSOC);

    // foreach ($resultat as $key => $value) {
    //     $titreEntete = array_keys($value)[1];
    //     echo $titreEntete;
    //     echo " : " . $value[$titreEntete];
    //     echo '<br>';
    //     $info = array_keys($value)[2];
    //     echo $info;
    //     echo " : " . $value[$info];
    //     echo '<br><br>';
    // }

    // foreach ($resultat as $arrayActeur) {
    //     foreach ($arrayActeur as $keyActor => $valueActor) {
    //     echo "<br>". $keyActor . " : " . $valueActor;        
    //     }
    // }

    echo "<table style='border : solid 1px black'>";
        echo "<thead>";
            echo "<tr>";
                foreach ($resultat[0] as $key => $value) {
                    echo "<th>" . $key . "</th>";
                }
            echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
                foreach ($resultat as $arrayActeur) {
                    echo "<tr>";
                    foreach ($arrayActeur as $keyActor => $valueActor) {
                        echo "<td>" . $valueActor . "</td>";
                    }
                    echo "</tr>";
                }
        echo "</tbody>";
    echo "</table>";    


    ?>

</body>

</html>