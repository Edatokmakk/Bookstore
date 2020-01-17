<?php include 'header.php'; ?>

<?php 
//herhangi bir yaziya tiklanildiginda yazinin icerigini gosterir
$yazi_id = $_GET["yazi_id"];

$icerikler = $db->prepare("SELECT * FROM icerikler INNER JOIN kategoriler ON kategoriler.kategori_id = icerikler.yazi_kategori_id WHERE yazi_id=?");
$icerikler->execute(array($yazi_id));
$icerik_ekle = $icerikler->fetch(PDO::FETCH_ASSOC);

?>

<div class="single-page">
<h2><?php echo $icerik_ekle["yazi_baslik"]; ?></h2>
<p>Bu kitap <a href=""><?php echo $icerik_ekle["kategori_adi"]; ?></a> türüne aittir</p>
<p>Gösterim <a href=""><?php echo $icerik_ekle["yazi_gosterim"]; ?></a>

<img src="images/<?php echo $icerik_ekle["yazi_resim"]; ?>">
<p><?php echo $icerik_ekle["yazi_icerik"]; ?></p>

</div>