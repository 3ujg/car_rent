<?php session_start(); include('config.php'); ?>
<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autorent - Avaleht</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section { background-color: #f8f9fa; padding: 60px 0; }
        .car-card img { height: 200px; object-fit: cover; }
        .navbar-brand { font-weight: bold; }
        .card { transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
    <div class="container">
        <a class="navbar-brand" href="avaleht.php">Autorent</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="avaleht.php">Avaleht</a></li>
                <li class="nav-item"><a class="nav-link" href="Autod.php">Autod</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Hinnad</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Kontakt</a></li>
            </ul>
            <form class="d-flex" action="" method="get">
                <input class="form-control me-2" type="search" name="q" placeholder="Otsi marki või mudelit..." value="<?php echo isset($_GET['q']) ? htmlspecialchars($_GET['q']) : ''; ?>">
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

<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-5">
                <h1 class="display-4 fw-bold">Rendi auto soodsalt</h1>
                <p class="lead text-muted">Lai valik usaldusväärseid autosid igaks olukorraks.</p>
                <a href="#autod" class="btn btn-dark btn-lg px-4">Vaata autosid</a>
            </div>
            <div class="col-md-7 mt-4 mt-md-0">
                <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80" class="img-fluid rounded shadow" alt="Hero pilt">
            </div>
        </div>
    </div>
</section>

<div class="container my-5" id="autod">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        
        <?php
        // --- PAGINATION LOOGIKA ALGUS ---
        $autoid_lehel = 8; // Mitu autot ühel lehel kuvame
        $aktiivne_leht = isset($_GET['leht']) ? (int)$_GET['leht'] : 1;
        if ($aktiivne_leht < 1) $aktiivne_leht = 1;
        
        $offset = ($aktiivne_leht - 1) * $autoid_lehel;

        $otsi = isset($_GET['q']) ? mysqli_real_escape_string($yhendus, $_GET['q']) : '';
        $otsi_url = !empty($otsi) ? "&q=$otsi" : ""; // Hoiame otsingusõna url-is alles lehti vahetades
        
        // 1. Uurime välja mitu autot KOKKU on (ilma limitita)
        if (!empty($otsi)) {
            $kogus_paring = "SELECT COUNT(id) as total FROM cars WHERE mark LIKE '%$otsi%' OR model LIKE '%$otsi%'";
            $paring = "SELECT * FROM cars WHERE mark LIKE '%$otsi%' OR model LIKE '%$otsi%' LIMIT $autoid_lehel OFFSET $offset";
        } else {
            $kogus_paring = "SELECT COUNT(id) as total FROM cars";
            $paring = "SELECT * FROM cars LIMIT $autoid_lehel OFFSET $offset";
        }

        // Arvutame lehekülgede arvu
        $kogus_valjund = mysqli_query($yhendus, $kogus_paring);
        $kokku_ridu = mysqli_fetch_assoc($kogus_valjund)['total'];
        $lehti_kokku = ceil($kokku_ridu / $autoid_lehel);

        // --- PAGINATION LOOGIKA LÕPP ---

        $valjund = mysqli_query($yhendus, $paring);

        if (mysqli_num_rows($valjund) > 0) {
            while($rida = mysqli_fetch_assoc($valjund)) {
                ?>
                <div class="col">
                    <div class="card h-100 car-card border-0 shadow-sm">
                        <img src="<?php echo $rida['image']; ?>" class="card-img-top" alt="<?php echo $rida['model']; ?>">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0"><?php echo ($rida['brand'] ?? $rida['mark']) . " " . $rida['model']; ?></h5>
                                <span class="text-muted small">🤍</span>
                            </div>
                            <p class="text-muted small mb-2"><?php echo ($rida['fuel_type'] ?? $rida['fuel']); ?> - <?php echo $rida['engine']; ?></p>
                            <ul class="list-unstyled mb-3 small">
                                <li><strong>Hind:</strong> <?php echo ($rida['price_per_day'] ?? $rida['price']); ?> €/päev</li>
                            </ul>
                            <a href="auto.php?id=<?php echo $rida['id']; ?>" class="btn btn-dark w-100">Rendi</a>
                        </div>
                    </div>
                </div>
                <?php
            }
        } else {
            echo '<div class="col-12 text-center"><h5>Autosid ei leitud.</h5></div>';
        }
        ?>

    </div>
</div>

<?php if ($lehti_kokku > 1): ?>
<nav aria-label="Page navigation" class="my-5">
    <ul class="pagination justify-content-center">
        
        <li class="page-item <?php if($aktiivne_leht <= 1) echo 'disabled'; ?>">
            <a class="page-link text-dark" href="?leht=<?php echo $aktiivne_leht - 1; ?><?php echo $otsi_url; ?>">Eelmine</a>
        </li>

        <?php for ($i = 1; $i <= $lehti_kokku; $i++): ?>
            <li class="page-item <?php if($i == $aktiivne_leht) echo 'active'; ?>">
                <a class="page-link <?php echo ($i == $aktiivne_leht) ? 'bg-dark border-dark text-white' : 'text-dark'; ?>" 
                   href="?leht=<?php echo $i; ?><?php echo $otsi_url; ?>">
                   <?php echo $i; ?>
                </a>
            </li>
        <?php endfor; ?>

        <li class="page-item <?php if($aktiivne_leht >= $lehti_kokku) echo 'disabled'; ?>">
            <a class="page-link text-dark" href="?leht=<?php echo $aktiivne_leht + 1; ?><?php echo $otsi_url; ?>">Järgmine</a>
        </li>
        
    </ul>
</nav>
<?php endif; ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php mysqli_close($yhendus); ?>