<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Aplikasi Mesin Kasir</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="bootstrap.min.css">
</head>

<body>
    <div class="container-fluid">
        <h1>Aplikasi Mesin Kasir</h1>
        <div class="row">
            <div class="col-md-6 col-lg-5 col-xl-4">
                <input type="number" id="barcodeInput" autofocus class="form-control" placeholder="Pindai barcode di sini" aria-label="Pindai barcode di sini" aria-describedby="basic-addon1">
                <button id="clearButton" style="display: none;" class="btn btn-dark">Clear</button>
            </div>
            <div class="col-md-6 col-lg-7 col-xl-8">

            </div>
        </div>
            
        
        <div id="output">
            <p>Status : -</p>
        </div>
        <table class="table table-bordered" id="cartTable">
            <thead>
                <tr>
                    <th>Nama Produk</th>
                    <th>Jumlah</th>
                    <th>Harga (Rp)</th>
                </tr>
            </thead>
            <tbody></tbody>
            <thead class="table-group-divider">
                <tr>
                    <th colspan="2">TOTAL HARGA</th>
                    <th><strong>Rp<span id="totalPrice">0.00</span></strong></th>
                </tr>
            </thead>
        </table>
    </div>

<script src="script.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</body>

</html>