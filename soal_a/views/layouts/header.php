<?php

$current_page = $_GET['page'] ?? '';
$current_path = $_SERVER['PHP_SELF'];

?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3">
    <div class="container">
        <a class="navbar-brand" href="#">Kokola Group</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link <?= strpos($current_path, 'soal_a') !== false ? 'active' : '' ?>" href="http://localhost/kokola_test/soal_a/index.php">Soal A</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?= strpos($current_path, 'soal_b') !== false ? 'active' : '' ?>" href="http://localhost/kokola_test/soal_b/index.php">Soal B</a>
                </li>
            </ul>
        </div>
    </div>
</nav>