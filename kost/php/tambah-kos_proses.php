<?php
include "../../php/koneksi.php";
session_start();
if (isset($_POST['tambah'])) {

    $nama_kost = $_POST['nama_kost'];
    $deskripsi = $_POST['deskripsi'];
    $tanggal_tagih = $_POST['tanggal_tagih'];
    $nama_bank = $_POST['nama_bank'];
    $no_rekening = $_POST['no_rekening'];
    $fasilitas_kost = $_POST['fasilitas'];

    $tipe_kost = $_POST['tipe_kost'];
    $harga_sewa = $_POST['harga_sewa'];
    //id pemilik


    $username = $_SESSION['username'];
    $data = mysqli_query($koneksi, "SELECT * FROM user WHERE username='$username'");
    $d = mysqli_fetch_array($data);
    $pemilik = $d['id'];

    //end insilaisasi

    //query insert
    $query = "INSERT INTO kost VALUES ('','$nama_kost','$tipe_kost','$jenis_kost','$jumlah_kamar','$tanggal_tagih','$nama_pemilik','$nama_bank','$no_rekening','$foto_bangunan_utama','$foto_kamar','$foto_kamar_mandi','$foto_interior','$provinsi','$kota','$kecamatan','$kelurahan','$alamat','$harga_sewa','$kontak','$deskripsi','$pemilik','$fasilitas')";
    $tambah = mysqli_query($koneksi, $query);
    $query_ambil = mysqli_query($koneksi, "SELECT id_kost FROM kost WHERE nama_kost='$nama_kost'");
    $g = mysqli_fetch_array($query_ambil);
    $id_kost = $g['id_kost'];
    if ($tambah) {
        header("location:../properti.php?id_kost=$id_kost");
    } else {
        header("location:../tambah_kos.php");
        echo "<script>alert('gagal')</script>";
    }
}

?>


<!-- a  -->