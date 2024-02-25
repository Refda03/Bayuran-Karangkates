<?php
include('template/header.php');
?>


<!--Main Content -->
<div class="container">

  <div class="row">
    <div class="col-md-10">
      <form class="text-center border border-light p-5" action="php/tambah-kos_proses.php" method="post" enctype="multipart/form-data">
        <h3>Tambah Tagihan</h3>
        <div class="form-group">
          <hr>
          <h6>Info Tagihan</h6>
          <div class="row">
            <div class="col"><label for="namaTagihan">Nama Tagihan </label></div>
            <div class="col"> <input type="text" name="nama_kost" id="nama_kost" class="form-control"></div>
          </div>
          <br>

          <div class="row">
            <div class="col"><label for="deskripsi">Deskripsi Tagihan(opsional)</label></div>
            <div class="col"><textarea class="form-control" name="deskripsi" id="deskripsi" cols="30" rows="10" placeholder="Masukan deskripsi Tagihan anda"></textarea></div>
          </div>
          <br>
    
          <hr>
          <h6>Info Pembayaran</h6>
          <br>
          <div class="row">
            <div class="col"><label for="tanggal">Ditagih setiap tanggal</label></div>
            <div class="col">
              <input type="date" class="form-control" name="tanggal_tagih" id="tanggal_tagih">
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col"><label for="nama_bank">Nama Bank</label></div>
            <div class="col"><input class="form-control" type="text" name="nama_bank" id="nama_bank"></div>
          </div>
          <br>
          <div class="row">
            <div class="col"><label for="rekening">Nomor Rekening</label></div>
            <div class="col"><input type="number" name="no_rekening" id="no_rekening" class="form-control"></div>
          </div>
          <br>

          <hr>
          <h6>Detail Tagihan</h6>
          <!-- <br>
          <div class="row">
            <div class="col"><label for="jenis">Jenis Tagihan</label></div>
            <div class="col">
              <select name="jenis_Tagihan" id="jenis_Tagihan" class="custom-select">
                <option value="Putra">Tagihan Putra</option>
                <option value="Putri">Tagihan Putri</option>
                <option value="Campuran">Tagihan Campuran</option>
              </select>
            </div>
          </div>
          <br> -->
          <div class="row">
            <div class="col"><label for="tipe">Tipe Tagihan</label></div>
            <div class="col">
              <select name="tipe_Tagihan" id="tipe_Tagihan" class="custom-select">
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
                <input type="text" name="harga_sewa" id="harga_sewa">
              </div>

            </div>
          </div>
          <br>
          <div class="col">
            <button type="submit" class="btn-primary" name="tambah">Simpan</button>
          </div>
        </div>
      </form>
    </div>
  </div>

</div>

<!-- Akhir Content -->

<?php
include('template/footer.php');
?>