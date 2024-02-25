<?php
include 'template/header.php';


$id_kost = $_GET['id_kost'];

$query = "SELECT * FROM kost WHERE id_kost='$id_kost'";
$data_2 = mysqli_query($koneksi, $query);
$d = mysqli_fetch_array($data_2);
$o = explode(', ', $d['fasilitas_kost']);
?>

<!--Main Content -->
<div class="container">

  <div class="row">
    <div class="col-md-10">
      <form class="text-center border border-light p-5" action="php/properti-edit_proses.php?id_kost=<?php echo $d['id_kost']; ?>" method="post" enctype="multipart/form-data">
        <h3>Ubah Tagihan</h3>
        <hr>
        <div class="form-group">
          <div class="row">
            <div class="col"><label for="namakost">Nama Tagihan </label></div>
            <div class="col"> <input type="text" name="nama_kost" id="nama_kost" class="form-control" value="<?php echo $d['nama_kost'] ?>"></div>
          </div>
          <br>

          <div class="row">
            <div class="col"><label for="deskripsi">Deskripsi Tagihan(opsional)</label></div>
            <div class="col"><textarea class="form-control" name="deskripsi" id="deskripsi" cols="30" rows="10" placeholder="Masukan deskripsi kost anda"><?php echo $d['deskripsi'] ?></textarea></div>
          </div>
        
          <!-- info kamar kost  -->
          <hr>
          <h6>Info Pembayaran</h6>
          <br>
          <div class="row">
            <div class="col"><label for="tanggal">Ditagih setiap tanggal</label></div>
            <div class="col">
              <input value="<?php echo $d['tanggal_tagih'] ?>" type="date" class="form-control" name="tanggal_tagih" id="tanggal_tagih">
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col"><label for="nama_bank">Nama Bank</label></div>
            <div class="col"><input value="<?php echo $d['nama_bank'] ?>" class="form-control" type="text" name="nama_bank" id="nama_bank"></div>
          </div>
          <br>
          <div class="row">
            <div class="col"><label for="rekening">Nomor Rekening</label></div>
            <div class="col"><input value="<?php echo $d['no_rekening'] ?>" type="number" name="no_rekening" id="no_rekening" class="form-control"></div>
          </div>
          <br>

         
          <br>
          <hr>
          <h6>Detail Tagihan</h6>
          <br>
          <!-- <div class="row">
            <div class="col"><label for="jenis">Jenis Kost</label></div>
            <div class="col">
              <select name="jenis_kost" id="jenis_kost" class="custom-select">
                <option selected hidden value="<?php echo $d['jenis_kost'] ?>"><?php echo $d['jenis_kost'] ?></option>
                <option value="Putra">Kost Putra</option>
                <option value="Putri">Kost Putri</option>
                <option value="Campuran">Kost Campuran</option>
              </select>
            </div>
          </div>
          <br> -->
          <div class="row">
            <div class="col"><label for="tipe">Tipe Tagihan</label></div>
            <div class="col">
              <select name="tipe_kost" id="tipe_kost" class="custom-select">
                <option selected hidden value="<?php echo $d['tipe_kost'] ?>">Perbulan</option>
                <option value="Bulan">Perbulan</option>
                <option value="Tahun">Pertahun</option>
              </select>
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col"><label for="harga_sewa">Nominal Tagihan</label></div>
            <div class="col">
              <div class="input-group-prepend">
                <span class="input-group-text">Rp.</span>
                <input value="<?php echo $d['harga_sewa'] ?>" type="text" name="harga_sewa" id="harga_sewa">
              </div>

            </div>
          </div>
          <br>
          <div class="col">
            <button type="submit" class="btn-primary" name="ubah">Ubah</button>
          </div>
        </div>
      </form>
    </div>
  </div>

</div>

<!-- Akhir Content -->
<?php

include 'template/footer.php';
?>