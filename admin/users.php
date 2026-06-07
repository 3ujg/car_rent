<?php
session_start();
include __DIR__ . '/../public/config.php';
// Verify session user still admin
if (!isset($_SESSION['user_id'])) { header('Location: login.php'); exit; }
$curId = (int)$_SESSION['user_id'];
$res0 = mysqli_query($yhendus, "SELECT role FROM users WHERE id = $curId LIMIT 1");
if ($row0 = mysqli_fetch_assoc($res0)) {
    if ($row0['role'] !== 'admin') { $_SESSION = []; session_destroy(); header('Location: login.php'); exit; }
} else { $_SESSION = []; session_destroy(); header('Location: login.php'); exit; }

// Handle POST actions: change password or role change
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Change password action
    if (isset($_POST['change_password']) && isset($_POST['id']) && isset($_POST['new_password'])) {
        $id = (int)$_POST['id'];
        $new = $_POST['new_password'];
        if (strlen($new) < 6) {
            // simple check; you could show message instead
            header('Location: users.php');
            exit;
        }
        $hash = password_hash($new, PASSWORD_DEFAULT);
        $stmt = mysqli_prepare($yhendus, "UPDATE users SET password_hash = ? WHERE id = ?");
        mysqli_stmt_bind_param($stmt, 'si', $hash, $id);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
        header('Location: users.php');
        exit;
    }

    // Role change action
    if (isset($_POST['id']) && isset($_POST['role'])) {
        $id = (int)$_POST['id'];
        $role = mysqli_real_escape_string($yhendus, $_POST['role']);
        // Prevent logged-in admin from changing their own role via POST
        if ($id === $_SESSION['user_id']) {
            // ignore attempt and redirect (or could lock out by allowing change and destroying session)
            header('Location: users.php');
            exit;
        }
        $stmt = mysqli_prepare($yhendus, "UPDATE users SET role = ? WHERE id = ?");
        mysqli_stmt_bind_param($stmt, 'si', $role, $id);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
        header('Location: users.php');
        exit;
    }
}

$res = mysqli_query($yhendus, "SELECT id, role, first_name, last_name, email, phone, created_at FROM users ORDER BY id DESC");
?>
<!doctype html>
<html lang="et">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin - Kasutajad</title>
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
                <li class="nav-item"><a class="nav-link active" href="users.php">Kasutajad</a></li>
            </ul>
            <a href="../public/avaleht.php" class="btn btn-outline-primary btn-sm me-2">Avaleht</a>
            <a href="../public/logout.php" class="btn btn-outline-secondary btn-sm">Logout</a>
        </div>
    </div>
</nav>
<div class="container my-5">
    <h2>Kasutajad</h2>
    <div class="card mt-3">
        <div class="table-responsive">
            <table class="table table-striped mb-0 align-middle">
                <thead>
                    <tr><th>ID</th><th>Nimi</th><th>E-post</th><th>Telefon</th><th>Roll</th><th class="text-end">Tegevused</th></tr>
                </thead>
                <tbody>
                <?php if ($res && mysqli_num_rows($res) > 0): while($u = mysqli_fetch_assoc($res)): ?>
                    <tr>
                        <td><?php echo $u['id']; ?></td>
                        <td><?php echo htmlspecialchars($u['first_name'] . ' ' . $u['last_name']); ?></td>
                        <td><?php echo htmlspecialchars($u['email']); ?></td>
                        <td><?php echo htmlspecialchars($u['phone']); ?></td>
                        <td><?php echo htmlspecialchars($u['role']); ?></td>
                        <td class="text-end">
                            <div class="d-flex justify-content-end gap-2">
                                <?php if ($u['id'] === $_SESSION['user_id']): ?>
                                    <div class="me-2"><small class="text-muted"><?php echo htmlspecialchars($u['role']); ?> (you)</small></div>
                                <?php else: ?>
                                    <form method="post" class="d-inline">
                                        <input type="hidden" name="id" value="<?php echo $u['id']; ?>">
                                        <select name="role" class="form-select form-select-sm d-inline w-auto me-2">
                                            <option value="user"<?php if($u['role']==='user') echo ' selected'; ?>>user</option>
                                            <option value="admin"<?php if($u['role']==='admin') echo ' selected'; ?>>admin</option>
                                        </select>
                                        <button class="btn btn-sm btn-primary">Change</button>
                                    </form>
                                <?php endif; ?>

                                <form method="post" class="d-inline">
                                    <input type="hidden" name="id" value="<?php echo $u['id']; ?>">
                                    <input type="password" name="new_password" class="form-control form-control-sm d-inline w-auto" placeholder="uus parool" required>
                                    <input type="hidden" name="change_password" value="1">
                                    <button class="btn btn-sm btn-warning ms-2">Reset</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                <?php endwhile; else: ?>
                    <tr><td colspan="6" class="text-center">Ühtegi kasutajat pole</td></tr>
                <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
