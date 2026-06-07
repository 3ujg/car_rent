<?php
// Andmebaasi seaded
$server = "localhost";
$kasutaja = "root";
$parool = "";
$andmebaas = "cardb"; // Kontrolli, et see on phpMyAdminis täpselt sama nimi!

// Ühenduse loomine
$yhendus = mysqli_connect($server, $kasutaja, $parool, $andmebaas);

// Kontrollime, kas ühendus õnnestus
if (!$yhendus) {
    die("Viga andmebaasiga ühendamisel: " . mysqli_connect_error());
}

// Määrame koodingu, et täpitähed (õ, ä, ö, ü) toimiksid õigesti
mysqli_set_charset($yhendus, "utf8");
?>