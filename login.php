<!DOCTYPE html>
<html lang="az">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="./css/style.css" />
  <title>Bayuran Desa Karangkates</title>
</head>

<body>
  <div class="container">
    <div class="forms-container">
      <div class="signin-signup">
        <form action="php/login_proses.php" method="post" class="sign-in-form">
          <h2 class="title">Login</h2>

          <div class="input-field">
            <i class="fas fa-user"></i>
            <input autocomplete="off" autofocus required="required" type="text" name="username" id="username" placeholder="Username" />
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input autocomplete="off" autofocus required="required" type="password" name="password" id="password" placeholder="Password" />
          </div>

          <input type="submit" value="Masuk" class="btn solid" href="daftar-kost.php" />




        </form>
        <!--<form action="php/daftar_proses.php" method="post" class="sign-up-form" enctype="multipart/form-data">-->
        <form action="php/daftar_proses.php" method="post" class="sign-up-form" enctype="multipart/form-data" style="overflow-y: auto; padding-bottom: 3rem;height: 70%; margin: 1rem 0;" id="signup-form">
          <h2 class="title">Register</h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input required="required" type="text" name="username" id="username" placeholder="Username" />
          </div>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input required="required" type="text" name="nama_lengkap" id="nama_lengkap" placeholder="Nama Lengkap" />
          </div>
          <div class=" input-field">
            <i class="fas fa-user"></i>
            <input required="required" type="text" name="pekerjaan" id="pekerjaan" placeholder="Pekerjaan" />
          </div>
          <div class="input-field">
            <i class="fas fa-phone"></i>
            <input required="required" type="number" name="no_hp" id="no_hp" placeholder="No.Telepon/HP" />
          </div>
          <div class="input-field">
            <i class="fas fa-envelope"></i>
            <input required="required" type="email" name="email" id="email" placeholder="Email" />
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input required="required" type="password" name="password" id="password" placeholder="Password" />
          </div>
          <div class="input-field">
            <label for="">Gender</label>
            <select name="jenis_kelamin" id="jenis_kelamin" class="custom-select">
              <option value="laki-laki">Laki-laki</option>
              <option value="perempuan">Perempuan</option>
            </select>
            <br>
          </div>
          <div class="input-field">
            <label for="foto_ktp" class="form-group">KTP</label>
            <input type="file" name="foto_ktp" id="foto_ktp" class="form-group">
          </div>
          <div class="input-field">
            <label for="foto_profil" class="form-group">Foto</label>
            <input type="file" name="foto_profil" id="foto_profil" class="form-group">
          </div>
          <div class="input-field">
            <label for="">Role</label>
            <select name="roles" id="roles" class="custom-select">
              <option value="1">Warga Desa</option>
              <option value="2">Petugas Desa</option>
            </select>
          </div>

          <input type="submit" value="Daftar" class="btn solid" href="daftar-kost.php" />

        </form>
      </div>
    </div>

    <div class="panels-container">
      <div class="panel left-panel">
        <div class="content">
          <h3>Belum memiliki Akun?</h3>
          <p>
            Silahkan Daftarkan Data Diri Anda Terlebih Dahulu Untuk Bisa Mengakses Bayuran
          </p>
          <button class="btn transparent" id="sign-up-btn">
            Daftar
          </button>
        </div>
        <img src="./img/register.svg" class="image" alt="Register" />
      </div>
      <div class="panel right-panel">
        <div class="content">
          <h3>Sudah Memiliki Akun?</h3>
          <p>
            Anda Dapat Masuk Dengan Akun Yang Sudah Terdaftar Untuk Mengakses Bayuran
          </p>
          <button class="btn transparent" id="sign-in-btn">
            Masuk
          </button>
        </div>
        <img src="img/login.svg" class="image" alt="Login" />
      </div>
    </div>
  </div>
  <script src="./js/main.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      document.getElementById('signup-form').addEventListener('submit', function () {
        location.reload();
      });
    });
  </script>
</body>

</html>