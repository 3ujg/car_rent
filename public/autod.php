<?php 
session_start();
include('config.php'); 

// 1. PAGINATIONI SEADED
$autoid_lehel = 8; 
$aktiivne_leht = isset($_GET['leht']) ? (int)$_GET['leht'] : 1;
if ($aktiivne_leht < 1) $aktiivne_leht = 1;
$offset = ($aktiivne_leht - 1) * $autoid_lehel;

// 2. OTSINGU SEADED
$otsi = isset($_GET['q']) ? mysqli_real_escape_string($yhendus, $_GET['q']) : '';
$otsi_url = !empty($otsi) ? "&q=$otsi" : "";

// 3. PÄRINGUD (Kogus ja Andmed)
if (!empty($otsi)) {
    $kogus_paring = "SELECT COUNT(id) as total FROM cars WHERE mark LIKE '%$otsi%' OR model LIKE '%$otsi%'";
    $paring = "SELECT * FROM cars WHERE mark LIKE '%$otsi%' OR model LIKE '%$otsi%' LIMIT $autoid_lehel OFFSET $offset";
} else {
    $kogus_paring = "SELECT COUNT(id) as total FROM cars";
    $paring = "SELECT * FROM cars LIMIT $autoid_lehel OFFSET $offset";
}

$kogus_valjund = mysqli_query($yhendus, $kogus_paring);
$kokku_ridu = mysqli_fetch_assoc($kogus_valjund)['total'];
$lehti_kokku = ceil($kokku_ridu / $autoid_lehel);

$valjund = mysqli_query($yhendus, $paring);
?>

<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autod - Valik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .car-card img { height: 200px; object-fit: cover; }
        .card { transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">Autorent</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="avaleht.php">Avaleht</a></li>
                <li class="nav-item"><a class="nav-link active" href="autod.php">Autod</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Hinnad</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Kontakt</a></li>
            </ul>
            <form class="d-flex" action="autod.php" method="get">
                <input class="form-control me-2" type="search" name="q" placeholder="Otsi..." value="<?php echo htmlspecialchars($otsi); ?>">
                <button class="btn btn-outline-dark" type="submit">Otsi</button>
            </form>
            <?php if (isset($_SESSION['user_id'])): ?>
                <div class="ms-3 d-flex align-items-center">
                    <span class="me-3 text-muted">Tere, <?php echo htmlspecialchars($_SESSION['first_name'] ?? ''); ?></span>
                    <?php if (!empty($_SESSION['is_admin'])): ?>
                        <a href="../admin/index.php" class="btn btn-outline-warning btn-sm me-2">Admin</a>
                    <?php endif; ?>
                    <a href="logout.php" class="btn btn-outline-secondary btn-sm">Logi välja</a>
                </div>
            <?php else: ?>
                <div class="ms-3 d-flex align-items-center">
                    <a href="login.php" class="btn btn-outline-primary btn-sm me-2">Logi sisse</a>
                    <a href="register.php" class="btn btn-outline-secondary btn-sm">Registreeru</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
</nav>

<div class="container my-5">
    <h2 class="mb-4"><?php echo !empty($otsi) ? "Otsingu tulemused: ".htmlspecialchars($otsi) : "Kõik autod"; ?></h2>
    
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <?php if (mysqli_num_rows($valjund) > 0): ?>
            <?php while($rida = mysqli_fetch_assoc($valjund)): ?>
                <div class="col">
                    <div class="card h-100 border-0 shadow-sm">
                        <img src="<?php echo $rida['image']; ?>" class="card-img-top" alt="Auto">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo ($rida['brand'] ?? $rida['mark']) . " " . $rida['model']; ?></h5>
                            <p class="text-muted small"><?php echo ($rida['fuel_type'] ?? $rida['fuel']); ?> | <?php echo $rida['engine']; ?></p>
                            <p class="fw-bold"><?php echo ($rida['price_per_day'] ?? $rida['price']); ?> €/päev</p>
                            <a href="auto.php?id=<?php echo $rida['id']; ?>" class="btn btn-dark w-100">Rendi</a>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <div class="col-12 text-center"><h5>Autosid ei leitud.</h5></div>
        <?php endif; ?>
    </div>

    <?php if ($lehti_kokku > 1): ?>
    <nav class="my-5">
        <ul class="pagination justify-content-center">
            <li class="page-item <?php if($aktiivne_leht <= 1) echo 'disabled'; ?>">
                <a class="page-link text-dark" href="?leht=<?php echo $aktiivne_leht - 1 . $otsi_url; ?>">Eelmine</a>
            </li>
            <?php for ($i = 1; $i <= $lehti_kokku; $i++): ?>
                <li class="page-item <?php if($i == $aktiivne_leht) echo 'active'; ?>">
                    <a class="page-link <?php echo ($i == $aktiivne_leht) ? 'bg-dark border-dark text-white' : 'text-dark'; ?>" href="?leht=<?php echo $i . $otsi_url; ?>"><?php echo $i; ?></a>
                </li>
            <?php endfor; ?>
            <li class="page-item <?php if($aktiivne_leht >= $lehti_kokku) echo 'disabled'; ?>">
                <a class="page-link text-dark" href="?leht=<?php echo $aktiivne_leht + 1 . $otsi_url; ?>">Järgmine</a>
            </li>
        </ul>
    </nav>
    <?php endif; ?>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php mysqli_close($yhendus); ?>