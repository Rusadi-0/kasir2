<?php

header("Access-Control-Allow-Origin: *"); // Izinkan permintaan dari semua domain
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Izinkan metode permintaan yang diizinkan
header("Content-Type: application/json");

// Sambungkan ke database
$host = "localhost"; // Ganti sesuai dengan host database Anda
$username = "root"; // Ganti dengan username database Anda
$password = ""; // Ganti dengan password database Anda
$database = "kasir"; // Ganti dengan nama database Anda

$conn = new mysqli($host, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Ambil data JSON dari permintaan
$data = json_decode(file_get_contents("php://input"), true);

if (!empty($data)) {
    foreach ($data as $productId => $productData) {
        // Lakukan sanitasi data jika diperlukan

        $stok = $productData['stok'] - $productData['quantity'];

        // Buat query untuk memperbarui data
        $sql = "UPDATE produk SET
            stok = $stok
            WHERE barcode = '$productId';";

        // Eksekusi query
        if ($conn->multi_query($sql) === TRUE) {
            do {
                // Loop untuk mengeksekusi semua query dalam multi-query
                if ($result = $conn->store_result()) {
                    $result->free();
                }
            } while ($conn->next_result());

            echo "Data dengan ID $productId berhasil diperbarui.";
        } else {
            echo "Gagal memperbarui data: " . $conn->error;
        }
    }
} else {
    echo "Tidak ada data yang diterima.";
}

// Tutup koneksi database
$conn->close();
?>
