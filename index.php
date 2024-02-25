<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" type="image/png" sizes="32x32" href="./img/logo_bumdes.png" />
  <title>Bayuran Desa Karangkates</title>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="./css/styles.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <style>
    * {
      font-family: "Montserrat", sans-serif;
      /* font-family: 'Poppins', sans-serif; */
    }
  </style>
</head>

<body>
  <header class="header">
    <a class="header__logo" href="./">
      <img src="./img/bayuran.png" alt="Logo" />
    </a>

  </header>
  <section class="hero">
    <div class="hero__main">
      <div class="wrapper">
        <div class="hero__grid">
          <div class="hero__image"></div>
          <div class="hero__content">
            <h1 class="title__primary">BAYURAN DESA KARANGKATES</h1>
            <p class="description">
              "Bayuran Desa Karangkates" adalah platform web yang memudahkan penduduk Desa Karangkates untuk membayar iuran secara online. Dengan antarmuka yang user-friendly, website ini memungkinkan warga untuk melakukan pembayaran dengan cepat dan aman, mengurangi kerumitan administrasi pembayaran iuran secara konvensional.
            </p>
            <button type="button" class="btnlogin">Masuk</button>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="why-easybank">
    <div class="wrapper">
      <h2 class="title__primary">Mengapa Memakai Bayuran?</h2>
      <p class="why-easybank__description">
        Kemudahan Akses: Dengan menggunakan website bayaran, warga desa Karangkates dapat membayar tagihan mereka secara online tanpa harus datang ke kantor atau lokasi pembayaran fisik. Ini memberikan kemudahan bagi warga yang mungkin sibuk dengan pekerjaan atau memiliki keterbatasan mobilitas.
      </p>
      <div class="why-easybank__grid">
        <article class="why-easybank__feature">
          <img src="./img/icon-online.svg" alt="Online Banking" />
          <h3 class="title__secondary">Efisiensi Waktu</h3>
          <p class="description">
            Website bayaran memungkinkan pembayaran tagihan dilakukan kapan saja dan di mana saja selama terhubung dengan internet. Hal ini mengurangi waktu yang dibutuhkan oleh warga untuk melakukan pembayaran, sehingga meningkatkan efisiensi pengelolaan waktu mereka.
          </p>
        </article>
        <article class="why-easybank__feature">
          <img src="./img/icon-budgeting.svg" alt="Simple Budgeting" />
          <h3 class="title__secondary">Pengelolaan Tagihan yang Lebih Tertib</h3>
          <p class="description">
            Dengan sistem pembayaran melalui website, pengelolaan data tagihan menjadi lebih teratur dan terdokumentasi dengan baik. Ini membantu mengurangi kemungkinan kesalahan dalam proses pencatatan dan penagihan tagihan, serta memudahkan pengawasan dan monitoring oleh pihak terkait.
          </p>
        </article>
        <article class="why-easybank__feature">
          <img src="./img/icon-onboarding.svg" alt="Fast Onboarding" />
          <h3 class="title__secondary">Keamanan dan Keterjaminan Transaksi</h3>
          <p class="description">
            Website bayaran umumnya dilengkapi dengan sistem keamanan yang canggih untuk melindungi data dan informasi pribadi pengguna. Dengan demikian, pembayaran melalui website memberikan jaminan keamanan bagi warga desa Karangkates dalam melakukan transaksi pembayaran tagihan mereka secara online.
          </p>
        </article>
        <article class="why-easybank__feature">
          <img src="./img/icon-api.svg" alt="Open API" />
          <h3 class="title__secondary">Peningkatan Transparansi dan Akuntabilitas</h3>
          <p class="description">
            Dengan adanya sistem pembayaran melalui website bayaran, semua transaksi pembayaran dapat tercatat secara otomatis dan terdokumentasi dengan baik. Hal ini meningkatkan transparansi dan akuntabilitas dalam pengelolaan dana tagihan, sehingga memungkinkan pihak terkait untuk melakukan audit dan pelaporan dengan lebih mudah dan akurat.
          </p>
        </article>
      </div>
    </div>
  </section>

  <footer class="footer">
    <div class="wrapper">
      <div class="footer__grid2" style="display: flex; align-items: center; justify-content: center;gap: 1rem;">
        <a class="footer__logo2" href="/">
          <img src="./img/bayuran-white.png" alt="Logo" />
        </a>
        <p class="footer__copyright2">© PMM UMM 2024. All Rights Reserved</p>
      </div>
      <!-- <div class="footer__grid">
        <a class="footer__logo" href="/">
          <img src="./img/bayuran-white.svg" alt="Logo" />
        </a>
        <p class="footer__copyright">© PMM UMM 2024. All Rights Reserved</p>
      </div> -->
    </div>
  </footer>


  <script>
    const menu = document.querySelector('#menu')
    const mediaScreen = window.matchMedia('screen and (min-width: 1024px)')
    mediaScreen.addListener(handleMediaScreen)

    /**
     * Set the checked attribute of checkbox menu to false
     */
    function handleMediaScreen(event) {
      if (event.matches && menu.checked) {
        console.log('Set checked to false')
        menu.checked = false
      }
    }

    document.addEventListener("DOMContentLoaded", function() {
      const requestInviteButton = document.querySelector('.btnlogin');
      requestInviteButton.addEventListener('click', function() {
        window.location.href = 'login.php';
      });
    });
  </script>
</body>

</html>