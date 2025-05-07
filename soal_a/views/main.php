<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kokola Group - Soal A</title>
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body">

    <?php include 'views/layouts/header.php'; ?>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Plant Products</h4>
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addPlantProductModal">
                            <i class="bi bi-plus-circle"></i> Tambah Product
                        </button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th width="10%" class="text-center">Plant</th>
                                    <th>Products</th>
                                </tr>
                            </thead>
                            <tbody id="plant-products-table">
                                <?php foreach ($plantProducts as $row): ?>
                                    <tr>
                                        <td class="text-center"><?php echo htmlspecialchars($row['plant_code']); ?></td>
                                        <td style="word-break: break-word;"><?php echo htmlspecialchars($row['products']); ?></td>
                                    </tr>
                                <?php endforeach; ?>

                                <?php if (!empty($productsWithoutPlantList)): ?>
                                    <tr>
                                        <td class="text-center">-</td>
                                        <td style="word-break: break-word;" id="products-without-plant">
                                            <?php echo htmlspecialchars(implode(', ', $productsWithoutPlantList)); ?>
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- modal u/menambahkan Product Plant baru -->
    <div class="modal fade" id="addPlantProductModal" tabindex="-1" aria-labelledby="addPlantProductModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addPlantProductModalLabel">Tambah Plant Product</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addPlantProductForm">
                        <div class="mb-3">
                            <label for="plant" class="form-label">Plant (Optional)</label>
                            <select class="form-select" id="plant" name="plant_id">
                                <option value="">-</option>
                                <?php while ($plant = $plants->fetch(PDO::FETCH_ASSOC)): ?>
                                    <option value="<?php echo $plant['id']; ?>"><?php echo htmlspecialchars($plant['kode'] . ' - ' . $plant['name']); ?></option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="product_name" class="form-label">Product Name*</label>
                            <input type="text" class="form-control" id="product_name" name="product_name" required>
                        </div>
                        <div id="formMessage" class="alert d-none"></div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="submitPlantProduct" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>

    <?php include 'views/layouts/footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/script.js"></script>
    </body>

</html>