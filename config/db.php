<!-- Par convention, on crée un dossier 'config' pour y mettre un fichier db.sql avec les constantes de notre connexion à notre BD -->

<?php

const DBUSER = "root";
const DBPASS = "";  // DBPASS = rien par défaut mais on peut ajouter un mot de pass si besoin
const DBPORT = 3306;
const DBHOST = "localhost";
const DBCHARSET = "utf8";
const DBDRIVER = "mysql";
const DBNAME = "sakila";