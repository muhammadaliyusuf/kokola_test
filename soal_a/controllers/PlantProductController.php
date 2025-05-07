<?php

require_once 'models/PlantProduct.php';
require_once 'config/database.php';

class PlantProductController
{
    private $plantProductModel;
    private $db;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->getConnection();
        $this->plantProductModel = new PlantProduct($this->db);
    }

    // menampilkan halaman utama dengan tabel product plant
    public function index()
    {
        // ambil data produk yang dikelompokkan berdasarkan plant
        $result = $this->plantProductModel->getAllGroupedByPlant();
        $plantProducts = [];

        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $plantProducts[] = $row;
        }

        // ambil produk yang belum memiliki relasi dengan plant
        $productsWithoutPlant = $this->plantProductModel->getProductsWithoutPlant();
        $productsWithoutPlantList = [];

        while ($row = $productsWithoutPlant->fetch(PDO::FETCH_ASSOC)) {
            $productsWithoutPlantList[] = $row['name'];
        }

        // ambil data plant untuk digunakan di form tambah data
        $plants = $this->plantProductModel->getAllPlants();

        include 'views/main.php';
    }

    // menambahkan relasi antara plant dan produk melalui AJAX
    public function addPlantProduct()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            echo json_encode(['success' => false, 'message' => 'Metode request tidak valid']);
            return;
        }

        header('Content-Type: application/json');

        // ambil data dari POST
        $id_plant = isset($_POST['plant_id']) && !empty($_POST['plant_id']) ? $_POST['plant_id'] : null;
        $product_name = isset($_POST['product_name']) ? $_POST['product_name'] : null;

        // validasi nama product
        if (!$product_name) {
            echo json_encode(['success' => false, 'message' => 'Nama produk wajib diisi']);
            return;
        }

        // buat atau ambil ID produk berdasarkan nama
        $id_product = $this->plantProductModel->createProduct($product_name);

        if (!$id_product) {
            echo json_encode(['success' => false, 'message' => 'Gagal membuat produk']);
            return;
        }

        // set properti relasi plant-product
        $this->plantProductModel->id_plant = $id_plant;
        $this->plantProductModel->id_product = $id_product;

        // cek apakah relasi plant-product sudah ada
        if ($id_plant && $this->plantProductModel->exists()) {
            echo json_encode(['success' => false, 'message' => 'Produk sudah terhubung dengan plant ini']);
            return;
        }

        // buat relasi antara plant dan produk
        if ($this->plantProductModel->create()) {

            // ambil data terbaru untuk produk yang sudah memiliki plant
            $updatedData = $this->plantProductModel->getAllGroupedByPlant();
            $plantProducts = [];

            while ($row = $updatedData->fetch(PDO::FETCH_ASSOC)) {
                $plantProducts[] = $row;
            }

            // ambil data terbaru untuk produk yang belum memiliki plant
            $productsWithoutPlant = $this->plantProductModel->getProductsWithoutPlant();
            $productsWithoutPlantList = [];

            while ($row = $productsWithoutPlant->fetch(PDO::FETCH_ASSOC)) {
                $productsWithoutPlantList[] = $row['name'];
            }

            // mengirimkan response JSON sukses
            echo json_encode([
                'success' => true,
                'message' => 'Produk berhasil ditambahkan',
                'data' => $plantProducts,
                'productsWithoutPlant' => $productsWithoutPlantList
            ]);
        } else {
            // mengirimkan response JSON gagal
            echo json_encode(['success' => false, 'message' => 'Gagal menambahkan produk']);
        }
    }
}
