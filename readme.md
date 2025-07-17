# Blockchain-based E-Voting

Sistem pemungutan suara elektronik berbasis blockchain yang diimplementasikan sebagai Smart Contract Ethereum.

## Gambaran Umum

Proyek ini mengimplementasikan sistem e-voting terdesentralisasi menggunakan teknologi blockchain Ethereum. Smart Contract ini memungkinkan proses pemungutan suara yang aman, transparan, dan tahan terhadap manipulasi.

## Struktur Proyek

```
├── evoting.sol         # Smart Contract e-voting utama
└── tests/
└── evoting_test.sol  # Pengujian unit untuk kontrak e-voting
```

## Fitur

*Catatan: Fitur berikut diasumsikan berdasarkan sistem e-voting pada umumnya. Silakan modifikasi sesuai dengan implementasi Anda.*

- Pendaftaran dan autentikasi pemilih yang aman
- Pemungutan dan penghitungan suara yang transparan
- Pencegahan pemungutan suara ganda
- Konfigurasi surat suara untuk berbagai jenis pemilihan
- Privasi suara dan verifikasi hasil

## Persyaratan Teknis

- Solidity ^0.8.0 (kompatibel dengan Solidity >=0.4.22 <0.9.0)
- Lingkungan pengembangan Ethereum (Remix, Truffle, atau Hardhat)
- Web3.js atau Ethers.js untuk integrasi frontend

## Memulai

### Prasyarat

- [Remix IDE](https://remix.ethereum.org/) atau lingkungan pengembangan Ethereum lokal
- MetaMask atau dompet Ethereum lainnya untuk pengujian

### Instalasi

1. Kloning repositori ini atau buat file di lingkungan pengembangan Anda
2. Kompilasi Smart Contract menggunakan Solidity Compiler
3. Deploy ke jaringan pengujian atau blockchain lokal

### Pengujian

Proyek ini menyertakan pengujian unit dalam file `tests/evoting_test.sol`. Untuk menjalankan pengujian:

1. Buka proyek di Remix IDE
2. Navigasi ke plugin "Solidity Unit Testing"
3. Pilih file pengujian dan jalankan pengujian

Pengujian mencakup:
- Pemeriksaan dasar (checkSuccess)
- Pemeriksaan dengan nilai pengembalian (checkSuccess2)
- Pengujian kegagalan yang diharapkan (checkFailure)
- Pengujian dengan konteks transaksi kustom (checkSenderAndValue)

## Penggunaan

*Catatan: Silakan sesuaikan bagian ini dengan petunjuk penggunaan aktual berdasarkan implementasi Anda.*

1. Deploy kontrak untuk menyiapkan pemilihan baru
2. Daftarkan pemilih yang memenuhi syarat
3. Konfigurasikan surat suara dengan kandidat atau opsi
4. Buka periode pemungutan suara
5. Izinkan pemilih untuk memberikan suara mereka
6. Tutup periode pemungutan suara
7. Hitung dan publikasikan hasil

## Pertimbangan Keamanan

- Kontrak mengimplementasikan kontrol akses untuk mencegah tindakan yang tidak sah
- Terdapat langkah-langkah untuk mencegah pemungutan suara ganda
- Fitur transparansi memungkinkan verifikasi hasil sambil menjaga privasi suara

## Lisensi

Proyek ini dilisensikan di bawah Lisensi GPL-3.0 - lihat file LICENSE untuk detailnya.

## Kontribusi

Kontribusi sangat diterima! Silakan kirimkan Pull Request jika ingin berkontribusi.