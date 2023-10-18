<?php
// Koneksi ke database
$mysqli = new mysqli("localhost", "root", "", "kasir");

if ($mysqli->connect_error) {
    die("Koneksi database gagal: " . $mysqli->connect_error);
}

// Query untuk mengambil data produk
$query = "SELECT * FROM produk";
$result = $mysqli->query($query);

if ($result) {
    $products = array();

    while ($row = $result->fetch_assoc()) {
        $products[$row['barcode']] = array(
            'name' => $row['nama'],
            'price' => $row['harga']
        );
    }

    // Mengirim data produk sebagai JSON
    echo json_encode($products);
} else {
    echo "Gagal menjalankan query: " . $mysqli->error;
}

// Tutup koneksi database
$mysqli->close();
?>
