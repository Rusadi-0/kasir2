// ! VARIABEL 
// const myHostname = window.location.hostname; //* untuk dijalankan ke htdocs
const myHostname = "localhost"; //* untuk dijalankan ke dekstop
const inputDigit = 5;
const inputPersenUntung = 10;
const loading = document.getElementById('loading');
const barcodeInput = document.getElementById('barcodeInput');
const output = document.getElementById('output');
const cartTableBody = document.querySelector('#cartTable tbody');
const totalPriceDisplay0 = document.getElementsByClassName('totalPrice')[0];
const totalPriceDisplay1 = document.getElementsByClassName('totalPrice')[1];
const koneksiServer = document.getElementById('koneksiServer');
const inputTransaksiJual = document.getElementById('inputTransaksiJual');
const hasilKembalian = document.getElementById('hasilKembalian');
const tombolTransaksi = document.getElementById('tombolTransaksi');
const untungPersen = inputPersenUntung/100;
const totalPrice = 0;
const cart = {}; 



barcodeInput.addEventListener("input", function (e) {
    let input = e.target.value;
    e.target.value = input.replace(/[^0-9]/g, "");
});

    // menekan enter lanjut ke taransaksi
    function checkEnter(event) {
        if (event.key === "Enter") {
            tombolTransaksi.click();
            setTimeout(function() {
                inputTransaksiJual.focus();
            }, 500);
        }
    }

    var startTime = new Date().getTime(); // Waktu mulai permintaan

    var xhr = new XMLHttpRequest();
    
    loading.innerHTML = "<center class='mt-5'>menghubungkan ke server. </center>"
    setTimeout(function() {
        loading.innerHTML = "<center class='mt-5'>Koneksi ke server terputus, silahkan refresh(f5).</center>"
    }, 10000);
    
    xhr.onload = function() {
        if (xhr.status === 200) {
            var endTime = new Date().getTime(); // Waktu selesai permintaan
            var timeTaken = endTime - startTime; // Waktu yang diperlukan dalam milidetik
    
            var products = JSON.parse(xhr.responseText);
            setupKasir(products);
    
            var dataSize = xhr.responseText.length; // Ukuran data yang diambil dalam byte
            var speed = (dataSize / timeTaken) * 1000; // Kecepatan dalam byte per detik
    
            console.log("Waktu yang diperlukan: " + timeTaken + " ms");
            console.log("Kecepatan: " + speed + " bytes/detik");
            if(timeTaken > 10*1000){
                loading.innerHTML = "Gagal terhubung ke server..";
            }else{
                koneksiServer.style.display = "block";
                loading.style.display = "none";
                barcodeInput.focus();
            }
        } else {
            koneksiServer.innerHTML = "<h2>Koneksi ke server terputus.</h2>";
        }
    };
    
    xhr.onerror = function() {
        koneksiServer.innerHTML = "<h2>Koneksi ke server terputus.</h2>";
    };
    
    xhr.open("GET", "http://" + myHostname + "/getProduk.php", true);
    xhr.send();
    

function setupKasir(products) {
    barcodeInput.addEventListener('input', () => {
        const barcode = barcodeInput.value;
        if (products[barcode]) {
            const product = products[barcode];
            output.innerHTML = '';
            const princeInt = parseInt(product.price);
            const princePersenan =  princeInt * untungPersen + princeInt;

            if (cart[barcode]) {

                if(cart[barcode].stok > (cart[barcode].quantity)){
                    cart[barcode].quantity += 1;
                    cart[barcode].totalPrice = cart[barcode].quantity * princePersenan;
                    cart[barcode].price = princePersenan;
                } else{
                    output.innerHTML = '<p>Status : Stok barang habis.</p>';
                    // Tampilkan tombol Clear
                    
                    document.body.style.backgroundColor = "red";
                    setTimeout(function() {
                        alert(`STOK "`+cart[barcode].name +`" HANYA = ` + cart[barcode].stok );
                        barcodeInput.value = '';
                        barcodeInput.focus();
                        document.body.style.backgroundColor = "";
                        output.innerHTML = '<p>Status : -</p>';
                    }, 50);
                }
                // Jika produk dengan barcode yang sama sudah ada di keranjang, tambahkan jumlahnya
            } else {
                if(parseInt(product.stok) > 0){
                // Jika produk belum ada di keranjang, tambahkan ke keranjang
                inputTransaksiJual.disabled = false;
                cart[barcode] = {
                    name: product.name,
                    price:  parseInt(princePersenan),
                    totalPrice: parseInt(princePersenan),
                    unit: product.unit,
                    quantity: 1,
                    stok: parseInt(product.stok)
                };
                } else{
                alert("ANJING");
                }

            }


            // Tambahkan produk ke daftar belanja
            renderCart();
            // console.table(cart);
            // Tambahkan harga produk ke total
            let totalPriceBos = 0;
            for (const barcode in cart) {
                totalPriceBos += cart[barcode].totalPrice;
            }
            totalPriceDisplay0.textContent = formatRupiah(totalPriceBos);

            function hitungJumlahDigit(angka) {
                // Mengonversi angka menjadi string
                var angkaString = angka.toString();
              
                // Menghitung panjang string, yang juga merupakan jumlah digit
                var jumlahDigit = angkaString.length;
                
                return jumlahDigit;
            }
            const digitTotalHarga = hitungJumlahDigit(totalPriceBos);

            const genapHargaTotalRibuan = (Math.floor(totalPriceBos /1000)*1000);
            const genapHargaTotalRatusan = (Math.floor(totalPriceBos /100)*100);
            const hasilGenapHarga = genapHargaTotalRatusan - genapHargaTotalRibuan;
            if(digitTotalHarga < inputDigit){
                if(hasilGenapHarga > 500){
                    var hasilDigenapkan = genapHargaTotalRibuan+1000;
                } else {
                    var hasilDigenapkan = genapHargaTotalRibuan;
                }
            } else if(hasilGenapHarga < 200){
                var hasilDigenapkan = genapHargaTotalRibuan;
            } else if(hasilGenapHarga < 500){
                var hasilDigenapkan = genapHargaTotalRibuan+500;
            } else if(hasilGenapHarga == 500){
                var hasilDigenapkan = genapHargaTotalRibuan+500;
            } else if(hasilGenapHarga > 500){
                var hasilDigenapkan = genapHargaTotalRibuan+1000;
            } else{
                console.error("ini ada error cuk..");
            }          
                totalPriceDisplay1.textContent = formatRupiah(hasilDigenapkan);

            inputTransaksiJual.addEventListener('input', function() {
            if(inputTransaksiJual.value == 0){
                inputTransaksiJual.value = "";
            } else{
                const sanitizedValue = inputTransaksiJual.value.replace(/\D/g, '');
                
                // Memisahkan ribuan secara manual
                const formattedValue = addThousandSeparators(sanitizedValue);
    
                // Mengatur nilai input menjadi yang telah diformat
                inputTransaksiJual.value = formattedValue;
    
                const integerValue = parseInt(sanitizedValue, 10);
    
                    // Setel teks pada elemen <h2> dengan nilai dari elemen <input>
                    var totalKembalian = integerValue - hasilDigenapkan;
                    if(integerValue > totalPriceBos){
                        hasilKembalian.textContent = formatRupiah(totalKembalian)
                    } else {
                        hasilKembalian.textContent = formatRupiah(0)
                    }
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
                
                document.body.style.backgroundColor = "purple";
                setTimeout(function() {
                    alert("PRODUK TIDAK DITEMUKAN!!")
                    barcodeInput.value = '';
                    barcodeInput.focus();
                    document.body.style.backgroundColor = "";
                    output.innerHTML = '<p>Status : -</p>';
                }, 50);
                
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
                <td>${item.quantity} ${item.unit} x (Rp${formatRupiah(item.price)})</td>
                <td><strong>Rp${formatRupiah(item.totalPrice)}</strong></td>
            `;
            cartTableBody.appendChild(cartRow);
        }
    }

    // Fokus ke input saat halaman dimuat
    barcodeInput.focus();

    // *Fungsi untuk mengonversi harga menjadi format Rupiah
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

        rupiah = split[1] != undefined ? rupiah + '.' + split[1] : rupiah;
        return rupiah;
    }
}

// * untuk jika menekan tompbol esc
document.addEventListener('keydown', function(event) {
    if (event.key === "Escape") {
        barcodeInput.focus();
    }
});
