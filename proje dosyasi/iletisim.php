<?php include 'header.php'; ?>

<?php 
//herhangi bir yaziya tiklanildiginda yazinin icerigini gosterir
$i_id = 1;
$iletisim = $db->prepare("SELECT * FROM iletisim WHERE i_id=?");
$iletisim->execute(array($i_id));
$iletisim_ekle = $iletisim->fetch(PDO::FETCH_ASSOC);

?>

<div class="single-page">
<h2>Telif Hakkı</h2>

<img style="width: 100%;" src="images/<?php echo $iletisim_ekle["i_resim"]; ?>">
<p><?php echo $iletisim_ekle["i_aciklama"]; ?></p>

</div>