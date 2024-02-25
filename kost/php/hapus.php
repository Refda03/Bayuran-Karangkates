<?php
include "../../php/koneksi.php";
$id_kost = $_GET['id_kost'];

// Hapus data terkait dari tabel kamar terlebih dahulu
$query_hapus_kamar = "DELETE FROM kost WHERE id_kost='$id_kost'";
$data_hapus_kamar = mysqli_query($koneksi, $query_hapus_kamar);

// Jika penghapusan data kamar berhasil, lanjutkan dengan penghapusan data kost
if ($data_hapus_kamar) {
    $query_hapus_kost = "DELETE FROM kost WHERE id_kost='$id_kost'";
    $data_hapus_kost = mysqli_query($koneksi, $query_hapus_kost);
    
    if ($data_hapus_kost) {
        header("location:../properti.php");
    } else {
        echo "Gagal menghapus data kost: " . mysqli_error($koneksi);
    }
} else {
    echo "Gagal menghapus data kamar terkait: " . mysqli_error($koneksi);
}
?>
// $id_kost = $_GET['id_kost'];
// echo $id_kost;

// $query = "DELETE FROM kost WHERE id_kost='$id_kost'";
// $data = mysqli_query($koneksi, $query);

// if ($data) {
//     header("location:../properti.php");
// } else {
//     header("location:../index.php");
// }
// 


