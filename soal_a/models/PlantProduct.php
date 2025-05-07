<?php

class PlantProduct
{
    private $conn;
    private $table = 'm_plant_product';

    public $id;
    public $id_plant;
    public $id_product;
    public $file_url;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    // mengambil semua data produk plant yang dikelompokkan berdasarkan kode plant
    public function getAllGroupedByPlant()
    {
        // ambil semua produk yang terhubung dengan plant
        $query = "SELECT p.kode AS plant_code, GROUP_CONCAT(pr.name ORDER BY pp.id ASC SEPARATOR ', ') AS products 
                FROM " . $this->table . " pp
                JOIN m_plant p ON pp.id_plant = p.id
                JOIN m_product pr ON pp.id_product = pr.id
                GROUP BY p.kode
                ORDER BY p.kode DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    // mengambil produk yang belum memiliki relasi dengan plant
    public function getProductsWithoutPlant()
    {
        $query = "SELECT pr.name 
                FROM m_product pr
                WHERE pr.id NOT IN (
                    SELECT DISTINCT id_product FROM " . $this->table . "
                )
                ORDER BY pr.id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    // menambahkan relasi baru antara plant dan produk
    public function create()
    {
        // jika ada ID plant, buat relasi
        if ($this->id_plant) {
            // cek apakah relasi sudah ada
            if ($this->exists()) {
                return true; // Relasi sudah ada, anggap berhasil
            }

            $query = "INSERT INTO " . $this->table . " (id_plant, id_product) VALUES (:id_plant, :id_product)";
            $stmt = $this->conn->prepare($query);

            // bersihkan data input
            $this->id_plant = htmlspecialchars(strip_tags($this->id_plant));
            $this->id_product = htmlspecialchars(strip_tags($this->id_product));

            // binding parameters
            $stmt->bindParam(':id_plant', $this->id_plant);
            $stmt->bindParam(':id_product', $this->id_product);

            return $stmt->execute();
        }

        // jika tidak ada ID plant, tidak perlu buat relasi
        return true;
    }

    // cek apakah relasi plant product sudah ada
    public function exists()
    {
        // jika ID plant kosong, berarti tidak bisa ada duplikat
        if (!$this->id_plant) {
            return false;
        }

        $query = "SELECT COUNT(*) FROM " . $this->table . " 
                  WHERE id_plant = :id_plant AND id_product = :id_product";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':id_plant', $this->id_plant);
        $stmt->bindParam(':id_product', $this->id_product);
        $stmt->execute();

        return ($stmt->fetchColumn() > 0);
    }

    // menambahkan produk baru jika belum ada di database
    public function createProduct($productName)
    {
        // bersihkan nama produk
        $productName = htmlspecialchars(strip_tags($productName));

        // cek apakah produk sudah ada
        $query = "SELECT id FROM m_product WHERE name = :name LIMIT 1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':name', $productName);
        $stmt->execute();

        $existingProduct = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existingProduct) {
            // jika produk sudah ada, ambil ID-nya
            return $existingProduct['id'];
        } else {
            // jika belum ada, buat produk baru
            $query = "INSERT INTO m_product (name) VALUES (:name)";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':name', $productName);

            if ($stmt->execute()) {
                return $this->conn->lastInsertId();
            } else {
                return false;
            }
        }
    }

    // mengambil semua data plant
    public function getAllPlants()
    {
        $query = "SELECT * FROM m_plant ORDER BY kode ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }
}
