<?php
include "template/header.php";
$no_tagihan = $_GET['no_tagihan'];

$query2 = "SELECT * FROM kost JOIN booking ON kost.id_kost=booking.id_kost JOIN tagihan ON booking.id_booking=tagihan.no_booking WHERE tagihan.no_tagihan='$no_tagihan'";
$data2 = mysqli_query($koneksi, $query2);
$n = mysqli_fetch_array($data2);


?>

<div class="container">

    </iframe>
    <div class="" class="row">
        <form action="" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col" style="font-size:30px;font-weight:bold">
                    <?php echo $n['nama_kost'] ?>
                </div>
            </div>

            <div class="row">
                <!-- <div class="col-md-4">
                    <img class="img-thumbnail rounded" src="../img/foto_kost/kamar/<?php echo $n['foto_kamar'] ?>" width="100%" alt="Foto kamar kost">
                </div> -->
                <div class="col">
                    <div class="row">
                        <div class="col">
                            No Tagihan : <?php echo $no_tagihan  ?>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col">
                            No. Rekening :
                            <?php echo $n['no_rekening'] ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            Pemilik Rekening :
                            <?php
                            $id_kost = $n['id_kost'];
                            $f = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM kost WHERE id_kost='$id_kost'"));
                            echo $f['nama_pemilik'];
                            ?>
                        </div>
                    </div>


                    <!-- Total Tagihan  -->
                    <div class="row">
                        <div class="col">Total Tagihan :
                            <?php
                            echo "Rp. " . number_format($n['total_tagihan'], 0, ',', '.')
                            ?>
                        </div>
                    </div>
                </div>
            </div>



            <br>
            <div class="row">
                <div class="col-md-4" style="font-size:20px;font-weight:bold">
                    Upload Bukti Pembayaran :
                    <input class="form-control" type="file" name="gambar" id="gambar">
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col">
                    <button name="submit" type="submit" class="btn btn-primary">Kirim</button>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col" style="font-size:18px;font-weight:thin">
                    Jika sudah upload bukti pembayaran lanjut untuk validasi pembayaran melalui tombol dibawah
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col">
                    <a href="tagihan.php?no_tagihan=<?php echo $no_tagihan; ?>" class="btn btn-primary">
                        Lihat Tagihan</a>
                </div>
            </div>
            <?php
            if (isset($_POST['submit'])) {
                $query = "UPDATE tagihan SET stats=2 WHERE no_tagihan='$no_tagihan'";
                $data = mysqli_query($koneksi, $query);
                $gambar = $_FILES['gambar']['name'];
                $simpan_gambar = $_FILES['gambar']['tmp_name'];
                move_uploaded_file($simpan_gambar, "../img/bukti_bayar/" . $gambar);
                $query = "UPDATE tagihan SET bukti_bayar='$gambar' WHERE no_tagihan='$no_tagihan'";
                $data = mysqli_query($koneksi, $query);
            }
            ?>
        </form>

    </div>
</div>
<?php
include "template/footer.php";
?>