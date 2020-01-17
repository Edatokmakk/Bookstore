<?php include 'ayarlar/baglanti.php'; ?>

<?php 
//veritabanindan aciklama, anahtar kelimeler ve basligi cekiyoruz
$ayarlar = $db->prepare("SELECT * FROM ayarlar");
$ayarlar->execute();
$ayarcek = $ayarlar->fetch(PDO::FETCH_ASSOC);


?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title><?php echo $ayarcek["site_title"]; ?></title>
	<meta name="description" content="<?php echo $ayarcek["site_desc"]; ?>">
	<meta name="keywords" content="<?php echo $ayarcek["site_keyw"]; ?>">
	
	<link href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

  </head>
  <body>

  <nav>
      <div class="container">
    <ul>
      <li><a href="/"><i class="fas fa-home"></i> Ana Sayfa</a></li>
      <li><a href="hakkimizda.php"><i class="fas fa-user-friends"></i> Hakkımızda</a></li>
      <li><a href="kitaplar.php"><i class="fas fa-book-reader"></i> Kitaplar</a></li>
      <li><a href="telifhakki.php"><i class="fab fa-expeditedssl"></i> Telif Hakkı</a></li>
      <li><a href="iletisim.php"><i class="fas fa-id-card"></i> İletişim</a></li>
    </ul>

    <div class="social-icons">
      <ul>
        <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
        <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
        <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
        <li><a href="#"><i class="fab fa-youtube-square"></i></a></li>
      </ul>
    </div>
      </div>
  </nav>

<header>

  <div class="container">
      <div class="logo">

        <a href="#"><i class="fas fa-book"></i> Kitaplar</a>

      </div>
      <div class="login">
        <ul>
          <li><a href="#"><i class="fas fa-sign-in-alt"></i> Giriş Yap!</a></li>
          <li><a href="#"><i class="fas fa-user-lock"></i> Üye Ol!</a></li>
        </ul>
      </div>
  </div>

</header>

<div class="search">
  <div class="container">

    <input type="text" name="" value="" placeholder="Kitap ara....">
    <button type="button" name="button">Ara!</button>

  </div>

</div>