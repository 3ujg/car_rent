<?php 
session_start();
include('config.php'); 

// 1. Kontrollime, kas ID on olemas
if (isset($_GET['id'])) {
    $id = (int)$_GET['id']; 
    
    // 2. Päring
    $paring = "SELECT * FROM cars WHERE id = $id";
    $valjund = mysqli_query($yhendus, $paring);
    $auto = mysqli_fetch_assoc($valjund);

    if (!$auto) {
        die("Autot ei leitud!");
    }
} else {
    header("Location: autod.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <title><?php echo (($auto['brand'] ?? $auto['mark']) . " " . $auto['model']); ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
    <div class="container">
        <a class="navbar-brand" href="avaleht.php">Autorent</a>
        <div class="d-flex ms-auto">
            <?php if (isset($_SESSION['user_id'])): ?>
                <span class="me-3 text-muted">Tere, <?php echo htmlspecialchars($_SESSION['first_name'] ?? ''); ?></span>
                <?php if (!empty($_SESSION['is_admin'])): ?>
                    <a href="../admin/index.php" class="btn btn-outline-warning btn-sm me-2">Admin</a>
                <?php endif; ?>
                <a href="logout.php" class="btn btn-outline-secondary btn-sm">Logi välja</a>
            <?php else: ?>
                <a href="login.php" class="btn btn-outline-primary btn-sm me-2">Logi sisse</a>
                <a href="register.php" class="btn btn-outline-secondary btn-sm">Registreeru</a>
            <?php endif; ?>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="card shadow-sm border-0 overflow-hidden">
        <div class="row g-0 align-items-center">
            <div class="col-md-6">
                <img src="<?php echo $auto['image']; ?>" class="img-fluid w-100" style="object-fit: cover; min-height: 400px;" alt="Auto pilt">
            </div>
            
            <div class="col-md-6 p-5">
                <h1 class="display-5 fw-bold"><?php echo ($auto['brand'] ?? $auto['mark']) . " " . $auto['model']; ?></h1>
                
                <p class="text-muted mb-4">
                    <?php echo $auto['status']; ?> • <?php echo $auto['year']; ?>
                </p>
                
                <ul class="list-unstyled mb-5">
                    <li class="mb-2"><strong>Mootor:</strong> <?php echo $auto['engine']; ?></li>
                    <li class="mb-2"><strong>Kütus:</strong> <?php echo $auto['fuel_type'] ?? $auto['fuel']; ?></li>
                    <li class="mb-2"><strong>Käigukast:</strong> <?php echo $auto['transmission']; ?></li>
                    <li class="mb-2"><strong>Kohad:</strong> <?php echo $auto['seats']; ?></li>
                </ul>

                <h2 class="mb-4"><?php echo ($auto['price_per_day'] ?? $auto['price']); ?> € / päev</h2>
                
                <?php if (isset($_SESSION['user_id'])): ?>
                    <form action="reserve.php" method="post" class="mb-0">
                        <input type="hidden" name="car_id" value="<?php echo $auto['id']; ?>">
                        <div class="row g-2">
                            <div class="col-6">
                                <input type="date" name="start_date" class="form-control" required>
                            </div>
                            <div class="col-6">
                                <input type="date" name="end_date" class="form-control" required>
                            </div>
                        </div>
                        <button class="btn btn-dark btn-lg w-100 py-3 mt-3" type="submit">Rendi</button>
                    </form>
                <?php else: ?>
                    <a href="login.php?return=auto.php?id=<?php echo $auto['id']; ?>" class="btn btn-dark btn-lg w-100 py-3">Logi sisse, et rentida</a>
                <?php endif; ?>
                
                <p class="text-center mt-3"><a href="autod.php" class="text-muted small">Tagasi nimekirja</a></p>
            </div>
        </div>
    </div>
    
    <div class="mt-4 px-2">
        <h5>Kirjeldus</h5>
        <p class="text-muted"><?php echo $auto['description']; ?></p>
    </div>
</div>

</body>
</html>
<?php mysqli_close($yhendus); ?>