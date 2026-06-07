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

// Handle status change
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && isset($_POST['id'])) {
    $id = (int)$_POST['id'];
    if ($_POST['action'] === 'set_status' && isset($_POST['status'])) {
        $status = mysqli_real_escape_string($yhendus, $_POST['status']);
        $stmt = mysqli_prepare($yhendus, "UPDATE reservations SET status = ? WHERE id = ?");
        mysqli_stmt_bind_param($stmt, 'si', $status, $id);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    }
    header('Location: reservations.php');
    exit;
}

$query = "SELECT r.*, u.first_name, u.last_name, u.email, c.brand, c.model FROM reservations r
          LEFT JOIN users u ON r.user_id = u.id
          LEFT JOIN cars c ON r.car_id = c.id
          ORDER BY r.created_at DESC";
$result = mysqli_query($yhendus, $query);
?>
<!DOCTYPE html>
<html lang="et">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Reserveeringud</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>.small-col{width:140px}</style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom py-3">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">Autorent admin</a>
        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index.php">Autod</a></li>
                <li class="nav-item"><a class="nav-link active" href="reservations.php">Reserveeringud</a></li>
                <li class="nav-item"><a class="nav-link" href="users.php">Kasutajad</a></li>
            </ul>
            <a href="../public/avaleht.php" class="btn btn-outline-primary btn-sm me-2">Avaleht</a>
            <a href="../public/logout.php" class="btn btn-outline-secondary btn-sm">Logout</a>
        </div>
    </div>
</nav>
<div class="container my-5">
    <h2>Reserveeringud</h2>
    <div class="card mt-3">
        <div class="table-responsive">
            <table class="table table-striped mb-0 align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Kasutaja</th>
                        <th>E-post</th>
                        <th>Auto</th>
                        <th>Algus</th>
                        <th>Lõpp</th>
                        <th>Hind</th>
                        <th>Status</th>
                        <th class="text-end">Tegevused</th>
                    </tr>
                </thead>
                <tbody>
                <?php if ($result && mysqli_num_rows($result) > 0): ?>
                    <?php while($r = mysqli_fetch_assoc($result)): ?>
                        <tr>
                            <td><?php echo $r['id']; ?></td>
                            <td><?php echo htmlspecialchars($r['first_name'] . ' ' . $r['last_name']); ?></td>
                            <td><?php echo htmlspecialchars($r['email']); ?></td>
                            <td><?php echo htmlspecialchars(($r['brand'] ?? $r['mark']) . ' ' . $r['model']); ?></td>
                            <td><?php echo htmlspecialchars($r['start_date']); ?></td>
                            <td><?php echo htmlspecialchars($r['end_date']); ?></td>
                            <td><?php echo htmlspecialchars($r['total_price']); ?> €</td>
                            <td><?php echo htmlspecialchars($r['status']); ?></td>
                            <td class="text-end small-col">
                                <form method="post" class="d-inline">
                                    <input type="hidden" name="id" value="<?php echo $r['id']; ?>">
                                    <input type="hidden" name="action" value="set_status">
                                    <select name="status" class="form-select form-select-sm d-inline w-auto me-2">
                                        <option value="pending"<?php if($r['status']==='pending') echo ' selected'; ?>>pending</option>
                                        <option value="active"<?php if($r['status']==='active') echo ' selected'; ?>>active</option>
                                        <option value="cancelled"<?php if($r['status']==='cancelled') echo ' selected'; ?>>cancelled</option>
                                        <option value="completed"<?php if($r['status']==='completed') echo ' selected'; ?>>completed</option>
                                    </select>
                                    <button class="btn btn-sm btn-primary">Save</button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr><td colspan="9" class="text-center">Ühtegi broneeringut pole.</td></tr>
                <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
