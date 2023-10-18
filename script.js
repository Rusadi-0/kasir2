const barcodeInput = document.getElementById('barcodeInput');
const output = document.getElementById('output');
const cartTableBody = document.querySelector('#cartTable tbody');
const totalPriceDisplay = document.getElementById('totalPrice');
const clearButton = document.getElementById('clearButton');

const cart = {}; // Objek untuk melacak produk yang ditambahkan ke keranjang

// Ambil data produk dari PHP
const xhr = new XMLHttpRequest();
xhr.open("GET", "getProducts.php", true);
xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
        const products = JSON.parse(xhr.responseText);
        setupKasir(products);
    }
};
xhr.send();

function setupKasir(products) {
    barcodeInput.addEventListener('input', () => {
        const barcode = barcodeInput.value;
        if (products[barcode]) {
            const product = products[barcode];
            output.innerHTML = '';

            if (cart[barcode]) {
                // Jika produk dengan barcode yang sama sudah ada di keranjang, tambahkan jumlahnya
                cart[barcode].quantity += 1;
                cart[barcode].price = cart[barcode].quantity * product.price;
            } else {
                // Jika produk belum ada di keranjang, tambahkan ke keranjang
                cart[barcode] = {
                    name: product.name,
                    price: product.price,
                    quantity: 1,
                };
            }


            // Tambahkan produk ke daftar belanja
            renderCart();

            console.table(cart);
            // Tambahkan harga produk ke total
            let totalPrice = 0;
            for (const barcode in cart) {
                totalPrice += cart[barcode].price;
            }
            totalPriceDisplay.textContent = totalPrice;

            // Kosongkan input barcode
            barcodeInput.value = '';

            // Sembunyikan tombol Clear
            clearButton.style.display = 'none';
        } else {
            output.innerHTML = '<p>Produk tidak ditemukan.</p>';
            // Tampilkan tombol Clear
            clearButton.style.display = 'inline';
        }
    });

    clearButton.addEventListener('click', () => {
        barcodeInput.value = '';
        barcodeInput.focus();
        // Sembunyikan tombol Clear
        clearButton.style.display = 'none';
    });

    function renderCart() {
        cartTableBody.innerHTML = '';
        for (const barcode in cart) {
            const item = cart[barcode];
            const cartRow = document.createElement('tr');
            cartRow.innerHTML = `
                <td>${item.name}</td>
                <td>${item.quantity}</td>
                <td>Rp${formatRupiah(item.price)}</td>
            `;
            cartTableBody.appendChild(cartRow);
        }
    }

    // Fokus ke input saat halaman dimuat
    barcodeInput.focus();

    // Fungsi untuk mengonversi harga menjadi format Rupiah
    function formatRupiah(angka) {
        var number_string = angka.toString();
        var split = number_string.split('.');
        var sisa = split[0].length % 3;
        var rupiah = split[0].substr(0, sisa);
        var ribuan = split[0].substr(sisa).match(/\d{3}/g);

        if (ribuan) {
            var separator = sisa ? '.' : '';
            rupiah += separator + ribuan.join('.');
        }

        rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
        return rupiah;
    }
}