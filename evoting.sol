// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SistemVoting
 * @author Gemini AI
 * @notice Kontrak untuk melakukan voting terdesentralisasi dengan daftar pemilih
 * dan periode waktu yang ditentukan.
 */
contract SistemVoting {
    // --- STRUCTS ---
    // Membuat tipe data kustom kita sendiri untuk merepresentasikan seorang kandidat.
    struct Kandidat {
        uint id;
        string nama;
        uint jumlahSuara;
    }

    // --- STATE VARIABLES ---
    address public immutable owner;

    // Array publik yang akan menyimpan semua data kandidat.
    Kandidat[] public kandidatList;

    // Mappings untuk melacak pemilih.
    mapping(address => bool) public pemilihTerdaftar;
    mapping(address => bool) public sudahMemilih;

    // Waktu mulai dan berakhirnya voting dalam format Unix timestamp.
    uint public waktuMulai;
    uint public waktuSelesai;

    // --- EVENTS ---
    event SuaraDiberikan(address indexed pemilih, uint idKandidat);
    event PemilihDidaftarkan(address indexed pemilih);

    // --- MODIFIERS ---
    modifier onlyOwner() {
        require(msg.sender == owner, "Hanya pemilik kontrak yang bisa melakukan ini.");
        _;
    }

    modifier votingAktif() {
        require(block.timestamp >= waktuMulai, "Voting belum dimulai.");
        require(block.timestamp < waktuSelesai, "Periode voting sudah berakhir.");
        _;
    }

    // --- CONSTRUCTOR ---
    // Saat mendeploy, pemilik harus menyediakan daftar nama kandidat dan durasi voting.
    constructor(string[] memory _namaKandidat, uint _durasiVotingDetik) {
        owner = msg.sender;
        waktuMulai = block.timestamp;
        waktuSelesai = block.timestamp + _durasiVotingDetik;

        // Loop melalui nama kandidat yang diberikan dan buat struct untuk masing-masing.
        for (uint i = 0; i < _namaKandidat.length; i++) {
            kandidatList.push(Kandidat({
                id: i,
                nama: _namaKandidat[i],
                jumlahSuara: 0
            }));
        }
    }

    // --- FUNGSI ADMIN ---

    /**
     * @notice Mendaftarkan satu alamat sebagai pemilih yang sah.
     * @param _alamatPemilih Alamat yang akan didaftarkan.
     */
    function daftarkanPemilih(address _alamatPemilih) public onlyOwner {
        require(!pemilihTerdaftar[_alamatPemilih], "Pemilih ini sudah terdaftar.");
        pemilihTerdaftar[_alamatPemilih] = true;
        emit PemilihDidaftarkan(_alamatPemilih);
    }
    
    // --- FUNGSI VOTING ---

    /**
     * @notice Memberikan suara ke salah satu kandidat.
     * @param _idKandidat ID kandidat yang dipilih (dimulai dari 0).
     */
    function berikanSuara(uint _idKandidat) public votingAktif {
        // Pengecekan kondisi sebelum proses inti.
        require(pemilihTerdaftar[msg.sender], "Anda tidak terdaftar sebagai pemilih.");
        require(!sudahMemilih[msg.sender], "Anda sudah memberikan suara sebelumnya.");
        require(_idKandidat < kandidatList.length, "ID Kandidat tidak valid.");

        // Proses inti: update state
        sudahMemilih[msg.sender] = true;
        kandidatList[_idKandidat].jumlahSuara++;

        // Pancarkan event
        emit SuaraDiberikan(msg.sender, _idKandidat);
    }
    
    // --- FUNGSI VIEW ---
    
    /**
     * @notice Mendapatkan detail lengkap dari seorang kandidat.
     * @param _idKandidat ID kandidat yang ingin dilihat.
     * @return Detail kandidat (id, nama, jumlah suara).
     */
    function getKandidat(uint _idKandidat) public view returns (Kandidat memory) {
        require(_idKandidat < kandidatList.length, "ID Kandidat tidak valid.");
        return kandidatList[_idKandidat];
    }
}