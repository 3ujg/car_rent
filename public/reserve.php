<?php
session_start();
include('config.php');

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: autod.php');
    exit;
}

$user_id = (int)$_SESSION['user_id'];
$car_id = (int)$_POST['car_id'];
$start = $_POST['start_date'];
$end = $_POST['end_date'];

// basic validation
if (empty($start) || empty($end) || strtotime($start) === false || strtotime($end) === false) {
    die('Vigane kuupäev');
}

if (strtotime($end) < strtotime($start)) {
    die('Lõppkuupäev ei saa olla enne algust');
}

// Check overlapping reservations
$stmt = mysqli_prepare($yhendus, "SELECT COUNT(*) FROM reservations WHERE car_id = ? AND status IN ('pending','active') AND NOT (end_date < ? OR start_date > ?)");
if (!$stmt) { die('DB prepare error (overlap): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_bind_param($stmt, 'iss', $car_id, $start, $end)) { die('DB bind_param error (overlap): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_execute($stmt)) { die('DB execute error (overlap): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_bind_result($stmt, $overlaps)) { die('DB bind_result error (overlap): ' . mysqli_error($yhendus)); }
mysqli_stmt_fetch($stmt);
mysqli_stmt_close($stmt);

if ($overlaps > 0) {
    die('Valitud ajavahemik kattub juba olemasoleva broneeringuga. Palun vali teine aeg.');
}

// Get car price (use bind_result to avoid requiring mysqlnd)
$stmt = mysqli_prepare($yhendus, "SELECT price_per_day, price FROM cars WHERE id = ? LIMIT 1");
if (!$stmt) { die('DB prepare error (price): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_bind_param($stmt, 'i', $car_id)) { die('DB bind_param error (price): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_execute($stmt)) { die('DB execute error (price): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_bind_result($stmt, $price_per_day_db, $price_db)) { die('DB bind_result error (price): ' . mysqli_error($yhendus)); }
if (mysqli_stmt_fetch($stmt)) {
    $price_per_day = isset($price_per_day_db) && $price_per_day_db !== null ? (float)$price_per_day_db : (isset($price_db) && $price_db !== null ? (float)$price_db : 0.0);
} else {
    mysqli_stmt_close($stmt);
    die('Valitud autot ei leitud.');
}
mysqli_stmt_close($stmt);

$days = (int)( (strtotime($end) - strtotime($start)) / 86400 ) + 1;
$total = $price_per_day * $days;

// Insert reservation
$stmt = mysqli_prepare($yhendus, "INSERT INTO reservations (user_id, car_id, start_date, end_date, total_price, status) VALUES (?, ?, ?, ?, ?, 'pending')");
if (!$stmt) { die('DB prepare error (insert): ' . mysqli_error($yhendus)); }
if (!mysqli_stmt_bind_param($stmt, 'iissd', $user_id, $car_id, $start, $end, $total)) { die('DB bind_param error (insert): ' . mysqli_error($yhendus)); }
if (mysqli_stmt_execute($stmt)) {
    header('Location: auto.php?id=' . $car_id . '&reserved=1');
    exit;
} else {
    die('Viga broneeringu salvestamisel: ' . mysqli_error($yhendus));
}

?>
