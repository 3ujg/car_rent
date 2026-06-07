<?php
session_start();
include('../public/config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = mysqli_real_escape_string($yhendus, $_POST['email']);
    $password = $_POST['password'];

    $stmt = mysqli_prepare($yhendus, "SELECT id, password_hash, first_name, last_name FROM users WHERE email = ? AND role = 'admin' LIMIT 1");
    mysqli_stmt_bind_param($stmt, 's', $email);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt, $id, $hash, $first_name, $last_name);
    mysqli_stmt_fetch($stmt);
    mysqli_stmt_close($stmt);

    if (!empty($id) && password_verify($password, $hash)) {
        $_SESSION['user_id'] = $id;
        $_SESSION['role'] = 'admin';
        $_SESSION['first_name'] = $first_name;
        $_SESSION['last_name'] = $last_name;
        $_SESSION['is_admin'] = true;
        header('Location: index.php');
        exit;
    } else {
        $error = 'Vale e-post või parool.';
    }
}
?>
<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container" style="max-width:480px; margin-top:40px;">
    <div class="card p-4 shadow-sm">
        <h3 class="mb-3">Admin login</h3>
        <?php if (!empty($error)): ?><div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div><?php endif; ?>
        <form method="post">
            <div class="mb-2"><input type="email" name="email" class="form-control" placeholder="E-post" required></div>
            <div class="mb-2"><input type="password" name="password" class="form-control" placeholder="Parool" required></div>
            <div class="d-flex justify-content-between align-items-center">
                <button class="btn btn-dark">Logi sisse</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
