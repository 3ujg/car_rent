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

if (!isset($_GET['id'])) {
    header('Location: index.php');
    exit;
}
$id = (int)$_GET['id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $brand = mysqli_real_escape_string($yhendus, $_POST['mark']);
    $model = mysqli_real_escape_string($yhendus, $_POST['model']);
    $year = (int)$_POST['year'];
    $engine = mysqli_real_escape_string($yhendus, $_POST['engine']);
    $fuel = mysqli_real_escape_string($yhendus, $_POST['fuel_type']);
    $transmission = mysqli_real_escape_string($yhendus, $_POST['transmission']);
    $seats = (int)$_POST['seats'];
    $price = (float)$_POST['price'];
    $status = mysqli_real_escape_string($yhendus, $_POST['status']);
    $description = mysqli_real_escape_string($yhendus, $_POST['description']);

    // image upload
    $db_image = '';
    if (!empty($_FILES['image']['name'])) {
        $target = __DIR__ . '/../public/uploads/';
        if (!is_dir($target)) mkdir($target, 0755, true);
        $name = basename($_FILES['image']['name']);
        $dest = $target . $name;
        if (move_uploaded_file($_FILES['image']['tmp_name'], $dest)) {
            $db_image = 'uploads/' . $name;
        }
    }

    // Using a simple escaped UPDATE query
    $update = "UPDATE cars SET brand='" . mysqli_real_escape_string($yhendus, $brand) . "', model='" . mysqli_real_escape_string($yhendus, $model) . "', year=$year, engine='" . mysqli_real_escape_string($yhendus, $engine) . "', fuel_type='" . mysqli_real_escape_string($yhendus, $fuel) . "', transmission='" . mysqli_real_escape_string($yhendus, $transmission) . "', seats=$seats, price_per_day=$price, description='" . mysqli_real_escape_string($yhendus, $description) . "', status='" . mysqli_real_escape_string($yhendus, $status) . "'";
    if ($db_image) $update .= ", image='" . mysqli_real_escape_string($yhendus, $db_image) . "'";
    $update .= " WHERE id=$id";
    mysqli_query($yhendus, $update);

    header('Location: index.php');
    exit;
}

$res = mysqli_query($yhendus, "SELECT * FROM cars WHERE id = $id LIMIT 1");
$car = mysqli_fetch_assoc($res);
?>
<!doctype html>
<html lang="et">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Muuda auto</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom py-3">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">Autorent admin</a>
        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index.php">Autod</a></li>
                <li class="nav-item"><a class="nav-link" href="reservations.php">Reserveeringud</a></li>
                <li class="nav-item"><a class="nav-link" href="users.php">Kasutajad</a></li>
            </ul>
            <a href="../public/avaleht.php" class="btn btn-outline-primary btn-sm me-2">Avaleht</a>
            <a href="../public/logout.php" class="btn btn-outline-secondary btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container my-5" style="max-width:900px;">
    <h2>Muuda auto</h2>
    <div class="card p-4 mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="row g-3">
                <div class="col-md-6"><label>Mark</label><input name="mark" class="form-control" value="<?php echo htmlspecialchars($car['brand'] ?? $car['mark']); ?>"></div>
                <div class="col-md-6"><label>Mudel</label><input name="model" class="form-control" value="<?php echo htmlspecialchars($car['model']); ?>"></div>
                
                <div class="col-md-4"><label>Aasta</label>
                    <select name="year" class="form-select">
                        <?php 
                        $hetke_aasta = 2026;
                        for($y = $hetke_aasta; $y >= 1990; $y--): ?>
                            <option value="<?php echo $y; ?>" <?php if($car['year'] == $y) echo 'selected'; ?>><?php echo $y; ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                
                <div class="col-md-4"><label>Mootor</label>
                    <select name="engine" class="form-select">
                        <?php
                        $mootorid = ['1.0', '1.2', '1.4', '1.6', '1.8', '2.0', '2.2', '2.5', '3.0', '4.0', 'Elekter'];
                        // Kui andmebaasis on väärtus, mida nimekirjas pole, lisame selle valikusse
                        if (!empty($car['engine']) && !in_array($car['engine'], $mootorid)) {
                            $mootorid[] = $car['engine'];
                        }
                        foreach($mootorid as $m): ?>
                            <option value="<?php echo $m; ?>" <?php if($car['engine'] == $m) echo 'selected'; ?>><?php echo $m; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div class="col-md-4"><label>Kütus</label>
                    <select name="fuel_type" class="form-select">
                        <option value="Bensiin" <?php if(($car['fuel_type'] ?? $car['fuel'])=='Bensiin') echo 'selected'; ?>>Bensiin</option>
                        <option value="Diisel" <?php if(($car['fuel_type'] ?? $car['fuel'])=='Diisel') echo 'selected'; ?>>Diisel</option>
                        <option value="Elekter" <?php if(($car['fuel_type'] ?? $car['fuel'])=='Elekter') echo 'selected'; ?>>Elekter</option>
                        <option value="Hübriid" <?php if(($car['fuel_type'] ?? $car['fuel'])=='Hübriid') echo 'selected'; ?>>Hübriid</option>
                    </select>
                </div>
                
                <div class="col-md-4"><label>Käigukast</label>
                    <select name="transmission" class="form-select">
                        <option value="Automaat" <?php if($car['transmission']=='Automaat') echo 'selected'; ?>>Automaat</option>
                        <option value="Manuaal" <?php if($car['transmission']=='Manuaal') echo 'selected'; ?>>Manuaal</option>
                    </select>
                </div>
                
                <div class="col-md-4"><label>Istekohad</label>
                    <select name="seats" class="form-select">
                        <?php for($i = 2; $i <= 9; $i++): ?>
                            <option value="<?php echo $i; ?>" <?php if($car['seats'] == $i) echo 'selected'; ?>><?php echo $i; ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                
                <div class="col-md-4"><label>Hind (€ / päev)</label><input name="price" type="number" step="0.01" class="form-control" value="<?php echo htmlspecialchars($car['price_per_day'] ?? $car['price']); ?>"></div>
                <div class="col-12"><label>Kirjeldus</label><textarea name="description" class="form-control"><?php echo htmlspecialchars($car['description']); ?></textarea></div>
                
                <div class="col-md-6"><label>Staatus</label>
                    <select name="status" class="form-select">
                        <option value="vaba" <?php if($car['status']=='vaba') echo 'selected'; ?>>Vaba</option>
                        <option value="rendidud" <?php if($car['status']=='rendidud') echo 'selected'; ?>>Renditud</option>
                        <option value="hoolduses" <?php if($car['status']=='hoolduses') echo 'selected'; ?>>Hoolduses</option>
                    </select>
                </div>
                <div class="col-md-6"><label>Auto pilt</label><input type="file" name="image" class="form-control"></div>
            </div>
            <div class="mt-3">
                <button class="btn btn-dark">Salvesta</button>
                <a href="index.php" class="btn btn-outline-secondary">Tühista</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
