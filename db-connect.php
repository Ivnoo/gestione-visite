<?php

$dbHost="localhost";
$dbName="visite";
$dbUser="root";
$dbPassword="";

$con = new mysqli($dbHost, $dbUser, $dbPassword, $dbName);
if(!$con) {
    die("Impossibile collegarsi al DB!" . mysqli_connect_error());
}

?>