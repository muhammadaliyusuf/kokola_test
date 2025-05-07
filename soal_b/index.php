<?php

function cari($input, $term = 'KOKOLA GROUP, Gresik, Indonesia')
{
    $input = strtolower($input);
    $termLower = strtolower($term);

    $positions = [];
    $inputLength = strlen($input);
    $termLength = strlen($term);

    if ($inputLength === 0 || $inputLength > $termLength) {
        return $positions;
    }

    // looping untuk memeriksa setiap posisi karakter dalam string target
    for ($i = 0; $i <= $termLength - $inputLength; $i++) {
        $match = true;

        // cek apakah substring pada posisi saat ini cocok dengan input
        for ($j = 0; $j < $inputLength; $j++) {
            if ($termLower[$i + $j] !== $input[$j]) {
                $match = false;
                break;
            }
        }

        // jika cocok, tambahkan posisi ke hasil
        if ($match) {
            $positions[] = $i;
        }
    }

    return $positions;
}

$current_page = $_GET['page'] ?? '';
$current_path = $_SERVER['PHP_SELF'];

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kokola Group - Soal B</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">

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

    <div class="container my-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0">String Search Function</h3>
                    </div>
                    <div class="card-body">
                        <p class="lead">Mencari index lokasi substring dari yang dimasukkan User berdasarkan kalimat <b>"KOKOLA GROUP, Gresik, Indonesia"</b></p>

                        <form method="POST" action="">
                            <div class="mb-3">
                                <label for="searchInput" class="form-label">Masukkan teks yang ingin dicari:</label>
                                <input type="text" class="form-control" id="searchInput" name="searchInput"
                                    value="<?php echo isset($_POST['searchInput']) ? htmlspecialchars($_POST['searchInput']) : ''; ?>">
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>

                        <?php
                        if (isset($_POST['searchInput'])) {
                            $input = $_POST['searchInput'];
                            $result = cari($input);
                            echo '<div class="mt-4">';
                            echo '<h4>Hasil pencarian untuk "' . htmlspecialchars($input) . '":</h4>';

                            if (empty($result)) {
                                echo '<div class="alert alert-warning">No matches found.</div>';
                            } else {
                                echo '<div class="alert alert-success">';
                                echo 'Ditemukan pada posisi: [' . implode(', ', $result) . ']';
                                echo '</div>';

                                // Representasi Visual
                                $term = 'KOKOLA GROUP, Gresik, Indonesia';
                                echo '<div class="mt-2">';
                                echo '<p><strong>Representasi Visual:</strong></p>';
                                echo '<pre class="bg-light p-3">';
                                echo $term . "\n";

                                foreach ($result as $pos) {
                                    $spaces = str_repeat(' ', $pos);
                                    $arrows = str_repeat('^', strlen($input));
                                    echo $spaces . $arrows . "\n";
                                }

                                echo '</pre>';
                                echo '</div>';
                            }
                            echo '</div>';
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-auto">
        <div class="container">
            <small>&copy; <?php echo date('Y'); ?> Kokola Group. All rights reserved.</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>