<?php
// admin/index.php
session_start();
include __DIR__ . '/../public/config.php';

// verify that the session user is still admin in DB
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$curId = (int)$_SESSION['user_id'];
$res = mysqli_query($yhendus, "SELECT role FROM users WHERE id = $curId LIMIT 1");
if ($row = mysqli_fetch_assoc($res)) {
    if ($row['role'] !== 'admin') {
        // user no longer admin — destroy session and redirect to admin login
        $_SESSION = [];
        session_destroy();
        header('Location: login.php');
        exit;
    }
} else {
    // user not found
    $_SESSION = [];
    session_destroy();
    header('Location: login.php');
    exit;
}

// === KUSTUTAMISE LOOGIKA SAMAS FAILIS ===
if (isset($_GET['delete_id'])) {
    // Teeme ID täisarvuks, et vältida SQL süstimist (turvalisus!)
    $delete_id = (int)$_GET['delete_id']; 
    
    if ($delete_id > 0) {
        // Kustutame auto andmebaasist
        $delete_query = "DELETE FROM cars WHERE id = $delete_id";
        mysqli_query($yhendus, $delete_query);
    }
    
    // Suuname tagasi puhtale lehele (eemaldab URL-ist ?delete_id= osa)
    header('Location: index.php');
    exit;
}
// =========================================

// Pärime kõik autod andmebaasist
$paring = "SELECT * FROM cars ORDER BY id DESC";
$valjund = mysqli_query($yhendus, $paring);
?>

<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autorent admin - Autod</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .admin-table-img {
            width: 80px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
        }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom py-3">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">Autorent admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="index.php">Autod</a></li>
                <li class="nav-item"><a class="nav-link" href="reservations.php">Reserveeringud</a></li>
                <li class="nav-item"><a class="nav-link" href="users.php">Kasutajad</a></li>
            </ul>
            <a href="../public/avaleht.php" class="btn btn-outline-primary btn-sm me-2">Avaleht</a>
            <a href="../public/logout.php" class="btn btn-outline-secondary btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container my-5">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="mb-1">Autod</h2>
            <p class="text-muted mb-0">Halda autorendi autode nimekirja.</p>
        </div>
        <a href="add_car.php" class="btn btn-dark">Lisa auto</a>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th scope="col" class="ps-4">Pilt</th>
                        <th scope="col">Auto</th>
                        <th scope="col">Mootor</th>
                        <th scope="col">Kütus</th>
                        <th scope="col">Hind</th>
                        <th scope="col">Kirjeldus</th>
                        <th scope="col" class="text-end pe-4">Tegevused</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (mysqli_num_rows($valjund) > 0): ?>
                        <?php while($rida = mysqli_fetch_assoc($valjund)): ?>
                            <tr>
                                <td class="ps-4">
                                    <img src="../<?php echo htmlspecialchars($rida['image']); ?>" class="admin-table-img" alt="Pilt">
                                </td>
                                <td>
                                    <strong><?php echo htmlspecialchars(($rida['brand'] ?? $rida['mark']) . " " . $rida['model']); ?></strong><br>
                                    <span class="text-muted small"><?php echo htmlspecialchars($rida['year']); ?></span>
                                </td>
                                <td><?php echo htmlspecialchars($rida['engine']); ?></td>
                                <td><?php echo htmlspecialchars($rida['fuel_type'] ?? $rida['fuel']); ?></td>
                                <td><?php echo htmlspecialchars(($rida['price_per_day'] ?? $rida['price'])); ?> € / päev</td>
                                <td>
                                    <span class="text-muted small d-inline-block text-truncate" style="max-width: 200px;">
                                        <?php echo htmlspecialchars($rida['description']); ?>
                                    </span>
                                </td>
                                <td class="text-end pe-4">
                                    <div class="btn-group btn-group-sm" role="group">
                                        <a href="muuda_auto.php?id=<?php echo $rida['id']; ?>" class="btn btn-outline-primary">Muuda</a>
                                        <a href="?delete_id=<?php echo $rida['id']; ?>" class="btn btn-outline-danger" onclick="return confirm('Oled kindel, et soovid selle auto kustutada?');">Kustuta</a>
                                    </div>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="7" class="text-center py-4 text-muted">Ühtegi autot pole veel lisatud.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="text-end mt-4">
        <a href="add_car.php" class="btn btn-dark">Lisa auto</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php mysqli_close($yhendus); ?>
