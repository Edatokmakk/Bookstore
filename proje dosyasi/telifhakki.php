<?php include 'header.php'; ?>

<?php 
//herhangi bir yaziya tiklanildiginda yazinin icerigini gosterir
$telif_id = 1;
$telifhakki = $db->prepare("SELECT * FROM telifhakki WHERE telif_id=?");
$telifhakki->execute(array($telif_id));
$telifhakki_ekle = $telifhakki->fetch(PDO::FETCH_ASSOC);

?>

<div class="single-page">
<h2>Hakkımızda</h2>

<img style="width: 100%;" src="images/<?php echo $telifhakki_ekle["telif_resim"]; ?>">
<p><?php echo $telifhakki_ekle["telif_aciklama"]; ?></p>

</div>