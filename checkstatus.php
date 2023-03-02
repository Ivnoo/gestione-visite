<?php
include('db-connect.php');
$id = $_GET['id'];

$cmd = "SELECT CASE WHEN NOT EXISTS(SELECT *
                                    FROM pagamenti  
                                    WHERE stato_anticipo <> 'Pagato') THEN 'Y'
                                    ELSE 'N'
                                END AS risultato";
$qry = mysqli_query($con, $cmd);
$result = mysqli_fetch_assoc($qry);
if($result['risultato']=='Y'){
    $cmd = "UPDATE visita SET stato = 'Attivata' WHERE id = '$id'";
    $qry = mysqli_query($con, $cmd);
}

$cmd = "SELECT CASE WHEN NOT EXISTS(SELECT *
                                    FROM pagamenti  
                                    WHERE stato_saldo <> 'Pagato') THEN 'Y'
                                    ELSE 'N'
                                END AS risultato";
$qry = mysqli_query($con, $cmd);
$result = mysqli_fetch_assoc($qry);
if($result['risultato']=='Y'){
    $cmd = "UPDATE visita SET stato = 'Saldata' WHERE id = '$id'";
    $qry = mysqli_query($con, $cmd);
}

header('Location: ' . $_SERVER['HTTP_REFERER']);

?>