<?php

// Izinkan permintaan dari semua domain (ini bisa disesuaikan dengan kebutuhan)
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
// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Ambil data JSON dari permintaan
$data = json_decode(file_get_contents("php://input"));

// Pastikan data yang diperlukan tersedia dalam $data
if (isset($data->total)) {
    $totalPrice = $data->total;
    $totalKembalian = $data->kembalian;

    // Buat perintah SQL
    $sql = "INSERT INTO transaksi (`id`, `waktu`, `total`, `kembalian`) VALUES (NULL, " . time() . "," . $totalPrice . "," . $totalKembalian . ")";

    // Eksekusi perintah SQL
    if ($conn->query($sql) === TRUE) {
        // Data berhasil dimasukkan
        echo "Data transaksi berhasil dimasukkan ke database.";
    } else {
        // Jika terjadi kesalahan
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    // Jika data yang diperlukan tidak tersedia
    echo "Data total tidak ditemukan dalam permintaan JSON.";
}

// Tutup koneksi ke database
$conn->close();
?>
