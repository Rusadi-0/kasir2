const barcodeInput = document.getElementById('barcodeInput');
const output = document.getElementById('output');
const cartTableBody = document.querySelector('#cartTable tbody');
const totalPriceDisplay0 = document.getElementsByClassName('totalPrice')[0];
const totalPriceDisplay1 = document.getElementsByClassName('totalPrice')[1];
const koneksiServer = document.getElementById('koneksiServer');
const inputTransaksiJual = document.getElementById('inputTransaksiJual');
const hasilKembalian = document.getElementById('hasilKembalian');
let tombolTransaksi = document.getElementById('tombolTransaksi');
let totalPrice = 0;
const cart = {}; // Objek untuk melacak produk yang ditambahkan ke keranjang

    // menekan enter lanjut ke taransaksi
    function checkEnter(event) {
        if (event.key === "Enter") {
            tombolTransaksi.click();
            setTimeout(function() {
                inputTransaksiJual.focus();
            }, 500);
        }
    }

// Ambil data produk dari PHP
        // Buat sebuah elemen div untuk menampilkan pesan

        // Buat objek XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Atur tindakan yang akan dilakukan ketika permintaan selesai (success atau failure)
        xhr.onload = function() {
            if (xhr.status === 200) {
                // Jika koneksi berhasil, tampilkan pesan sukses
                var products = JSON.parse(xhr.responseText);
                setupKasir(products);
            } else {
                // Jika ada masalah koneksi, tampilkan pesan koneksi terputus
                koneksiServer.innerHTML = "<h2>Koneksi ke server terputus.</h2>";
            }
        };

        // Atur tindakan yang akan dilakukan jika terjadi kesalahan dalam permintaan
        xhr.onerror = function() {
            koneksiServer.innerHTML = "<h2>Koneksi ke server terputus.</h2>";
        };

        // Buka permintaan ke URL getProducts.php
        xhr.open("GET", "http://localhost/getProducts.php", true);

        // Kirim permintaan
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
                    price: parseInt(product.price),
                    quantity: 1,
                };
            }


            // Tambahkan produk ke daftar belanja
            renderCart();
            console.table(cart);
            // Tambahkan harga produk ke total
            let totalPriceBos = 0;
            for (const barcode in cart) {
                totalPriceBos += cart[barcode].price;
            }
            totalPriceDisplay0.textContent = formatRupiah(totalPriceBos);
            totalPriceDisplay1.textContent = formatRupiah(totalPriceBos);
                     

            inputTransaksiJual.addEventListener('input', function() {
                            // Menghilangkan karakter non-angka
            const sanitizedValue = inputTransaksiJual.value.replace(/\D/g, '');

            // Memisahkan ribuan secara manual
            const formattedValue = addThousandSeparators(sanitizedValue);

            // Mengatur nilai input menjadi yang telah diformat
            inputTransaksiJual.value = formattedValue;

            const integerValue = parseInt(sanitizedValue, 10);

                // Setel teks pada elemen <h2> dengan nilai dari elemen <input>
                var totalKembalian = integerValue - totalPriceBos;
                if(integerValue > totalPriceBos){
                    hasilKembalian.textContent = formatRupiah(totalKembalian)
                } else {
                    hasilKembalian.textContent = formatRupiah(0)
                }

            
            });


            function addThousandSeparators(value) {
                return value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
            }

            // Kosongkan input barcode
            barcodeInput.value = '';
            
            output.innerHTML = '<p class="text-success">Status : Produk berhasil ditemukan.</p>';
            // Sembunyikan tombol Clear
            barcodeInput.style.display = 'inline';
        } else {

            inputValue = barcodeInput.value;

            if (inputValue.length > 12) {
                output.innerHTML = '<p>Status : Produk tidak ditemukan.</p>';
                // Tampilkan tombol Clear
                
                document.body.style.backgroundColor = "red";
                setTimeout(function() {
                    alert("PRODUK TIDAK DITEMUKAN!!")
                    barcodeInput.value = '';
                    barcodeInput.focus();
                    document.body.style.backgroundColor = "";
                    output.innerHTML = '<p>Status : -</p>';
                }, 1);
                
            }
        }
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

document.addEventListener('keydown', function(event) {
    if (event.key === "Escape") {
        barcodeInput.focus();
    }
});
