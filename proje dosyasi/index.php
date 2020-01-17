
<?php include 'header.php'; //header dosyasini cagirir ?>

<div class="last-books">

<h2><i class="fas fa-mouse-pointer"></i> Son Eklenen Kitaplar</h2>

<?php 
//veritabanina eklenen yazilari cekiyor
$icerikler = $db->prepare("SELECT * FROM icerikler");
$icerikler->execute();
$icerik_listele = $icerikler->fetchALL(PDO::FETCH_ASSOC);

foreach ($icerik_listele as $row) { ?>

<div class="post">

  <a href="detay.php?yazi_id=<?php echo $row["yazi_id"]; ?>"><img src="images/<?php echo $row["yazi_resim"]; ?>" alt=""></a>
  <div class="post-title">

    <a href="detay.php?yazi_id=<?php echo $row["yazi_id"]; ?>"><?php echo $row["yazi_baslik"]; ?></a>

  </div>

</div>

<?php } ?>

<div style="clear: both;">

</div>

</div>

<div style="width: 960px;margin:0 auto;background: #FFF;margin-top:10px;height:100px;" class="reklam">
<?php 
//veritabanina eklenen yazilari cekiyor
$reklamlar = $db->prepare("SELECT * FROM reklamlar ORDER BY reklam_id DESC LIMIT 1");
$reklamlar->execute();
$reklam_listele = $reklamlar->fetchALL(PDO::FETCH_ASSOC);

foreach ($reklam_listele as $row) { ?>

<a href="<?php echo $row["reklam_link"]; ?>"><img src="images/<?php echo $row["reklam_resim"]; ?>"></a>

<?php } ?>


</div>

<div class="page">
<div style="float: right;
    width: 680px;" class="last-books">

<h2 style="margin: 0;
    text-align: left;"><i class="fas fa-mouse-pointer"></i> Son Eklenen Kitaplar</h2>

<?php 
//veritabanina eklenen yazilari cekiyor
$icerikler = $db->prepare("SELECT * FROM icerikler ORDER BY yazi_gosterim DESC LIMIT 5");
$icerikler->execute();
$icerik_listele = $icerikler->fetchALL(PDO::FETCH_ASSOC);

foreach ($icerik_listele as $row) { ?>

<div class="post">

  <a href="detay.php?yazi_id=<?php echo $row["yazi_id"]; ?>"><img src="images/<?php echo $row["yazi_resim"]; ?>" alt=""></a>
  <div class="post-title">

    <a href="detay.php?yazi_id=<?php echo $row["yazi_id"]; ?>"><?php echo $row["yazi_baslik"]; ?></a>

  </div>

</div>

<?php } ?>

<div style="clear: both;">

</div>

</div>

<div class="kategoriler">
<h2><i class="fas fa-tags"></i> Kategoriler</h2>
<ul>
<?php 
//veritabanindan kategorileri cekiyoruz
$kategoriler = $db->prepare("SELECT * FROM kategoriler");
$kategoriler->execute();
$kategori_listele = $kategoriler->fetchALL(PDO::FETCH_ASSOC);

foreach ($kategori_listele as $row) { ?>
<li><a href=""><?php echo $row["kategori_adi"]; ?></a>

<?php } ?>

</ul>

</div>

</div>

  </body>
</html>
