<?php
session_start();
$_SESSION = [];
session_destroy();
header('Location: avaleht.php');
exit;
?>
