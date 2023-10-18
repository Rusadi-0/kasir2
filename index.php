<!DOCTYPE html>
<html>

<head>
    <title>Aplikasi Mesin Kasir</title>
    <link rel="stylesheet" href="/style.css">
</head>

<body>
    <h1>Aplikasi Mesin Kasir</h1>
    <input type="text" id="barcodeInput" placeholder="Pindai barcode di sini" autofocus>
    <button id="clearButton" style="display: none;">Clear</button>
    <div id="output"></div>
    <table id="cartTable">
        <thead>
            <tr>
                <th>Nama Produk</th>
                <th>Jumlah</th>
                <th>Harga (Rp)</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <p>Total Harga: Rp<span id="totalPrice">0.00</span></p>

<script src="/script.js"></script>
</body>

</html>