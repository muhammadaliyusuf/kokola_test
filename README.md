# Sistem Manajemen Relasi Plant dan Produk - Kokola Group

Aplikasi manajemen relasi antara plant (pabrik) dan produk yang dibangun menggunakan PHP, MySQL, Bootstrap dan AJAX untuk Kokola Group.

## Deskripsi

Sistem ini memungkinkan pengguna untuk mengelola dan memvisualisasikan hubungan antara plant (pabrik) dan produk yang diproduksi. Fitur utama meliputi:

- Menampilkan daftar produk yang dikelompokkan berdasarkan plant
- Menambahkan produk baru dan mengaitkannya dengan plant tertentu
- Visualisasi produk yang belum terkait dengan plant mana pun
- Pemrosesan data secara asinkron menggunakan AJAX

Vide demo aplikasi: https://drive.google.com/drive/u/1/folders/152cSfoFeweq3v6DPo7gFr8hzsFQerC01

## Application Overview

#### Soal A

<div style="display: flex; flex-wrap: wrap; gap: 10px; margin-bottom: 20px;">
  <img src="https://github.com/muhammadaliyusuf/kokola_test/blob/main/.ApplicationOverview/soal_a-1.png" style="width: 48%; height: auto;">
  <img src="https://github.com/muhammadaliyusuf/kokola_test/blob/main/.ApplicationOverview/soal_a-2.png" style="width: 48%; height: auto;">
</div>

#### Soal B

<div style="display: flex; flex-wrap: wrap; gap: 10px; margin-bottom: 20px;">
  <img src="https://github.com/muhammadaliyusuf/kokola_test/blob/main/.ApplicationOverview/soal_b-1.png" style="width: 48%; height: auto;">
  <img src="https://github.com/muhammadaliyusuf/kokola_test/blob/main/.ApplicationOverview/soal_b-2.png" style="width: 48%; height: auto;">
</div>


## Struktur Proyek

```
kokola_test/
├── soal-A/
│   ├── config/
│   │   └── database.php                # Konfigurasi koneksi database
│   ├── controllers/
│   │   └── PlantProductController.php  # Controller utama
│   ├── models/
│   │   └── PlantProduct.php            # Model untuk data plant-product
│   ├── views/
│   │   ├── layouts/
│   │   │   ├── header.php              # Template header
│   │   │   └── footer.php              # Template footer
│   │   └── main.php                    # Halaman utama
│   ├── assets/
│   │   ├── css/
│   │   │   └── style.css               # Custom CSS
│   │   └── js/
│   │       └── script.js               # JavaScript untuk AJAX
│   └── index.php                       # Entry point aplikasi
└── soal-B/
    └── index.php
```

## Prasyarat

- PHP 7.4+
- MySQL 5.7+
- Web server (Apache/Nginx)
- Browser modern dengan JavaScript diaktifkan

## Instalasi

1. Clone repositori ini ke direktori web server Anda:
   ```
   git clone https://github.com/muhammadaliyusuf/kokola-plant-product.git
   ```

2. Buat database baru bernama `kokola_test` di MySQL:
   ```sql
   CREATE DATABASE kokola_test;
   ```

3. Import skema database dari file `database/db_interview.sql`

4. Konfigurasi koneksi database di file `config/database.php`:
   ```php
   private $host = 'localhost';
   private $dbname = 'kokola_test';
   private $username = 'your_username';
   private $password = 'your_password';
   ```

5. Pastikan web server dan MySQL berjalan.

6. Akses aplikasi melalui browser Anda:
   ```
   http://localhost/kokola_test/soal_a/
   ```

## Penggunaan

### Menampilkan Data Plant dan Produk

Halaman utama menampilkan tabel dengan dua kolom:
- **Plant**: Menampilkan kode plant
- **Products**: Menampilkan daftar produk yang terkait dengan plant

### Menambahkan Produk Baru

1. Klik tombol "Tambah Product" di bagian atas tabel
2. Isi form dengan data berikut:
   - **Plant (Optional)**: Pilih plant dari dropdown (opsional)
   - **Product Name***: Masukkan nama produk (wajib)
3. Klik "Save" untuk menyimpan

## Fitur

- **Arsitektur MVC**: Kode terstruktur menggunakan pola Model-View-Controller
- **AJAX Processing**: Menambahkan dan memperbarui data tanpa refresh halaman
- **Validasi Data**: Validasi input untuk mencegah data duplikat dan tidak valid
- **Responsive UI**: Antarmuka responsif menggunakan Bootstrap 5
- **Keamanan**: Perlindungan terhadap SQL injection menggunakan prepared statements

## Tech Stack

- **Backend**: PHP 7.4+
- **Database**: MySQL 5.7+
- **Frontend**: HTML5, CSS3, JavaScript, jQuery
- **UI Framework**: Bootstrap 5
- **Request Handling**: AJAX/jQuery

## Keamanan

Sistem ini menerapkan beberapa langkah keamanan:
- Prepared statements untuk mencegah SQL injection
- Sanitasi input menggunakan `htmlspecialchars()` dan `strip_tags()`
- Validasi data di sisi server dan klien

## Kontak

Jika memiliki pertanyaan atau masukan, silakan hubungi:
- Email: muhammadaliyusuff22@gmail.com
- GitHub: [muhammadaliyusuf](https://github.com/muhammadaliyusuf)

## Pengembang

Dikembangkan sebagai bagian dari proyek pengembangan sistem untuk Kokola Group.