<?php include 'header.php'; ?>

<?php 
//herhangi bir yaziya tiklanildiginda yazinin icerigini gosterir
$hakkimizda_id = 1;
$hakkimizda = $db->prepare("SELECT * FROM hakkimizda WHERE hakkimizda_id=?");
$hakkimizda->execute(array($hakkimizda_id));
$hakkimizda_ekle = $hakkimizda->fetch(PDO::FETCH_ASSOC);

?>

<div class="single-page">
<h2>Hakkımızda</h2>

<img style="width: 100%;" src="images/<?php echo $hakkimizda_ekle["h_resim"]; ?>">
<p><?php echo $hakkimizda_ekle["h_aciklama"]; ?></p>

</div>