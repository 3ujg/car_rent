<?php
session_start();
include('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $first = mysqli_real_escape_string($yhendus, $_POST['first_name']);
    $last = mysqli_real_escape_string($yhendus, $_POST['last_name']);
    $email = mysqli_real_escape_string($yhendus, $_POST['email']);
    $phone = mysqli_real_escape_string($yhendus, $_POST['phone']);
    $password = $_POST['password'];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'Vale e-post.';
    } elseif (strlen($password) < 6) {
        $error = 'Parool peab olema vähemalt 6 märki.';
    } else {
        $hash = password_hash($password, PASSWORD_DEFAULT);
        $stmt = mysqli_prepare($yhendus, "INSERT INTO users (role, first_name, last_name, email, phone, password_hash) VALUES ('user', ?, ?, ?, ?, ?)");
        mysqli_stmt_bind_param($stmt, 'sssss', $first, $last, $email, $phone, $hash);
        if (mysqli_stmt_execute($stmt)) {
            header('Location: login.php');
            exit;
        } else {
            $error = 'Viga registreerimisel: ' . mysqli_error($yhendus);
        }
    }
}
?>
<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registreeri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
}</head>
<body class="bg-light">
<div class="container" style="max-width:600px; margin-top:40px;">
    <div class="card p-4 shadow-sm">
        <h3 class="mb-3">Registreeri</h3>
        <?php if (!empty($error)): ?><div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div><?php endif; ?>
        <form method="post">
            <div class="row g-2">
                <div class="col-md-6"><input type="text" name="first_name" class="form-control" placeholder="Eesnimi" required></div>
                <div class="col-md-6"><input type="text" name="last_name" class="form-control" placeholder="Perenimi" required></div>
            </div>
            <div class="mt-2"><input type="email" name="email" class="form-control" placeholder="E-post" required></div>
            <div class="mt-2"><input type="text" name="phone" class="form-control" placeholder="Telefon"></div>
            <div class="mt-2"><input type="password" name="password" class="form-control" placeholder="Parool" required></div>
            <div class="mt-3 d-flex justify-content-between align-items-center">
                <button class="btn btn-dark">Registreeri</button>
                <a href="login.php">Sul on juba konto? Logi sisse</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
