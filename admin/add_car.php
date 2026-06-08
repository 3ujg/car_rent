<?php
session_start();
include __DIR__ . '/../public/config.php';
// Verify session user still admin
if (!isset($_SESSION['user_id'])) { header('Location: login.php'); exit; }
$curId = (int)$_SESSION['user_id'];
$res = mysqli_query($yhendus, "SELECT role FROM users WHERE id = $curId LIMIT 1");
if ($row = mysqli_fetch_assoc($res)) {
    if ($row['role'] !== 'admin') { $_SESSION = []; session_destroy(); header('Location: login.php'); exit; }
} else { $_SESSION = []; session_destroy(); header('Location: login.php'); exit; }

// Kui vorm on esitatud (Salvesta nuppu vajutati)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // 1. Puhastame tekstiväljad
    $mark = mysqli_real_escape_string($yhendus, $_POST['mark']);
    $model = mysqli_real_escape_string($yhendus, $_POST['model']);
    $year = (int)$_POST['year'];
    $engine = mysqli_real_escape_string($yhendus, $_POST['engine']);
    $fuel = mysqli_real_escape_string($yhendus, $_POST['fuel_type']);
    $transmission = mysqli_real_escape_string($yhendus, $_POST['transmission']);
    $seats = (int)$_POST['seats'];
    $price = (float)$_POST['price'];
    $status = mysqli_real_escape_string($yhendus, $_POST['status']);
    $description = mysqli_real_escape_string($yhendus, $_POST['description']);

    // 2. Pildi üleslaadimise loogika
    $pildi_kataloog = "../uploads/"; // NB! Loo oma projekti kausta "uploads" nimeline kaust!
    $pildi_nimi = basename($_FILES["image"]["name"]);
    $sihtkoht = $pildi_kataloog . $pildi_nimi;
    
    // Vaikimisi pilt, kui midagi ei laeta
    $andmebaasi_pilt = ""; 

    // Kontrollime, kas pilt valiti
    if (!empty($_FILES["image"]["name"])) {
        $pildi_tyyp = strtolower(pathinfo($sihtkoht, PATHINFO_EXTENSION));
        $lubatud_tyybid = array("jpg", "jpeg", "png", "webp");

        if (in_array($pildi_tyyp, $lubatud_tyybid)) {
            // Laeme pildi serverisse
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $sihtkoht)) {
                // Andmebaasi salvestame ilma ../ alguseta, et avaleht oskaks otsida
                $andmebaasi_pilt = "uploads/" . $pildi_nimi; 
            } else {
                echo "<script>alert('Viga pildi üleslaadimisel!');</script>";
            }
        } else {
            echo "<script>alert('Vale pildiformaat! Lubatud: JPG, PNG, WEBP.');</script>";
        }
    }

    // 3. Andmebaasi salvestamine
    $paring = "INSERT INTO cars (brand, model, year, engine, fuel_type, transmission, seats, price_per_day, image, description, status) 
               VALUES ('$mark', '$model', $year, '$engine', '$fuel', '$transmission', $seats, $price, '$andmebaasi_pilt', '$description', '$status')";

    if (mysqli_query($yhendus, $paring)) {
        header("Location: index.php"); // Suuname tagasi admin avalehele
        exit;
    } else {
        echo "Viga andmebaasi salvestamisel: " . mysqli_error($yhendus);
    }
}
?>

<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lisa auto - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom py-3 mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">Autorent admin</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto"></ul>
            <a href="../public/avaleht.php" class="btn btn-outline-primary btn-sm me-2">Avaleht</a>
            <a href="../public/logout.php" class="btn btn-outline-secondary btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container" style="max-width: 800px;">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Lisa auto</h2>
        <a href="index.php" class="btn btn-outline-secondary btn-sm">Tagasi</a>
    </div>

    <div class="card border-0 shadow-sm p-4 mb-5">
        <form action="" method="POST" enctype="multipart/form-data">
            
            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label">Mark</label>
                    <input type="text" name="mark" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Mudel</label>
                    <input type="text" name="model" class="form-control" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label">Aasta</label>
                    <select name="year" class="form-select" required>
                        <option value="">Vali aasta</option>
                        <?php 
                        $hetke_aasta = 2026;
                        for($y = $hetke_aasta; $y >= 1990; $y--): ?>
                            <option value="<?php echo $y; ?>"><?php echo $y; ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Mootor</label>
                    <select name="engine" class="form-select" required>
                        <option value="">Vali mootor</option>
                        <?php
                        $mootorid = ['1.0', '1.2', '1.4', '1.6', '1.8', '2.0', '2.2', '2.5', '3.0', '4.0', 'Elekter'];
                        foreach($mootorid as $m): ?>
                            <option value="<?php echo $m; ?>"><?php echo $m; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label">Kütus</label>
                    <select name="fuel_type" class="form-select" required>
                        <option value="">Vali kütus</option>
                        <option value="Bensiin">Bensiin</option>
                        <option value="Diisel">Diisel</option>
                        <option value="Elekter">Elekter</option>
                        <option value="Hübriid">Hübriid</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Käigukast</label>
                    <select name="transmission" class="form-select" required>
                        <option value="">Vali käigukast</option>
                        <option value="Automaat">Automaat</option>
                        <option value="Manuaal">Manuaal</option>
                    </select>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label">Istekohti</label>
                    <select name="seats" class="form-select" required>
                        <?php for($i = 2; $i <= 9; $i++): ?>
                            <option value="<?php echo $i; ?>" <?php if($i == 5) echo 'selected'; ?>><?php echo $i; ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Staatus</label>
                    <select name="status" class="form-select" required>
                        <option value="vaba">Vaba</option>
                        <option value="renditud">Renditud</option>
                        <option value="hoolduses">Hoolduses</option>
                    </select>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label">Hind (€ / päev)</label>
                    <input type="number" step="0.01" name="price" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Auto pilt</label>
                    <input type="file" name="image" class="form-control" accept=".jpg, .jpeg, .png, .webp" required>
                    <div class="form-text">Lubatud formaadid: JPG, PNG, WEBP.</div>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Kirjeldus</label>
                <textarea name="description" class="form-control" rows="3"></textarea>
            </div>

            <hr class="mb-4">

            <div>
                <button type="submit" class="btn btn-dark me-2">Salvesta</button>
                <a href="index.php" class="btn btn-outline-secondary">Tühista</a>
            </div>

        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
