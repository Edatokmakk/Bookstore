<?php 

include '../ayarlar/baglanti.php'; 

if (isset($_POST["ayarlar"])){
	extract($_POST);
	
	if (!$site_title || !$site_url || !$site_desc || !$site_keyw){
		header("Location: ayarlar.php?update=bos");
		
		
	}else{
		$ayarlar = $db->prepare("UPDATE ayarlar SET site_title=?, site_desc=?, site_keyw=? WHERE site_id=?");
		
		$update = $ayarlar->execute(array($site_title,$site_url,$site_desc,$site_keyw));
		
			if ($update) {
				header("Location: ayarlar.php?update=yes");
			}else{
				
				header("Location: ayarlar.php?update=no");
				
			}
		
		
	}
	
	
	
	
	
}

?>
<?php

//yazilari siliyoruz
$yazisil_id = $_GET["yazisil_id"];
if (isset($yazisil_id)){
	
	$sil = $db->prepare("SELECT * FROM icerikler WHERE yazi_id=?");
	$sil->execute(array($yazisil_id));
	$eski_resim = $sil->fetch(PDO::FETCH_ASSOC);
	$eski_resim["yazi_resim"];
		
	unlink("../images/yazilar".$eski_resim["yazi_resim"]);

	$delete = $db->prepare("DELETE FROM icerikler WHERE yazi_id=?");
	$siliyoruz = $delete->execute(array($yazisil_id));
	
	if ($siliyoruz){
		header("Location: yazilar.php?update=yes");
	}else{
		
		header("Location: yazilar.php?update=no");
	}
		}

?>

<?php

//etiketleri siliyoruz 
$etiketsil_id = $_GET["etiketsil_id"];
if (isset($etiketsil_id)){
	
	$sil = $db->prepare("SELECT * FROM etiketler WHERE etiket_id=?");
	$sil->execute(array($etiketsil_id));
	$eski_resim = $sil->fetch(PDO::FETCH_ASSOC);
	$eski_resim["yazi_resim"];
		
	unlink("../images/yazilar".$eski_resim["yazi_resim"]);

	$delete = $db->prepare("DELETE FROM etiketler WHERE etiket_id=?");
	$siliyoruz = $delete->execute(array($etiketsil_id));
	
	if ($siliyoruz){
		header("Location: etiketler.php?update=yes");
	}else{
		
		header("Location: etiketler.php?update=no");
	}
		}

?>

<?php

//yillari siliyoruz 
$yilsil_id = $_GET["yilsil_id"];
if (isset($yilsil_id)){
	
	$sil = $db->prepare("SELECT * FROM yil WHERE y_id=?");
	$sil->execute(array($yilsil_id));
	$eski_resim = $sil->fetch(PDO::FETCH_ASSOC);
	$eski_resim["yazi_resim"];
		
	unlink("../images/yazilar".$eski_resim["yazi_resim"]);

	$delete = $db->prepare("DELETE FROM yil WHERE y_id=?");
	$siliyoruz = $delete->execute(array($yilsil_id));
	
	if ($siliyoruz){
		header("Location: yil.php?update=yes");
	}else{
		
		header("Location: yil.php?update=no");
	}
		}

?>

<?php

//yazar siliyoruz 
$yazarsil_id = $_GET["yazarsil_id"];
if (isset($yazarsil_id)){
	
	$sil = $db->prepare("SELECT * FROM yazar WHERE yazar_id=?");
	$sil->execute(array($yazarsil_id));
	$eski_resim = $sil->fetch(PDO::FETCH_ASSOC);
	$eski_resim["yazi_resim"];
		
	unlink("../images/yazilar".$eski_resim["yazi_resim"]);

	$delete = $db->prepare("DELETE FROM yazar WHERE yazar_id=?");
	$siliyoruz = $delete->execute(array($yazarsil_id));
	
	if ($siliyoruz){
		header("Location: yazarlar.php?update=yes");
	}else{
		
		header("Location: yazarlar.php?update=no");
	}
		}

?>

<?php

//cevirmen siliyoruz 
$cevirmensil_id = $_GET["cevirmensil_id"];
if (isset($cevirmensil_id)){
	
	$sil = $db->prepare("SELECT * FROM cevirmen WHERE c_id=?");
	$sil->execute(array($cevirmensil_id));
	$eski_resim = $sil->fetch(PDO::FETCH_ASSOC);
	$eski_resim["yazi_resim"];
		
	unlink("../images/yazilar".$eski_resim["yazi_resim"]);

	$delete = $db->prepare("DELETE FROM cevirmen WHERE c_id=?");
	$siliyoruz = $delete->execute(array($cevirmensil_id));
	
	if ($siliyoruz){
		header("Location: cevirmen.php?update=yes");
	}else{
		
		header("Location: cevirmen.php?update=no");
	}
		}

?>


<?php

//kategorileri siliyoruz 
$kategorisil_id = $_GET["kategorisil_id"];
if (isset($kategorisil_id)){
	
	$sil = $db->prepare("SELECT * FROM kategoriler WHERE kategori_id=?");
	$sil->execute(array($kategorisil_id));
	$eski_resim = $sil->fetch(PDO::FETCH_ASSOC);
	$eski_resim["yazi_resim"];
		
	unlink("../images/yazilar".$eski_resim["yazi_resim"]);

	$delete = $db->prepare("DELETE FROM kategoriler WHERE kategori_id=?");
	$siliyoruz = $delete->execute(array($kategorisil_id));
	
	if ($siliyoruz){
		header("Location: kategoriler.php?update=yes");
	}else{
		
		header("Location: kategoriler.php?update=no");
	}
		}

?>


<?php

if (isset($kategori_ekle)){
	if (!$kategori_adi){
		
		header("Location: kategoriler.php?sonuc=bos");
		
	}else{
		$ayarlar = $db->prepare("INSERT INTO kategoriler SET kategori_adi=?");
		$insert = $ayarlar->execute(array($kategori_adi));
	
	
	if ($insert){
		header("Location: kategoriler.php?sonuc=yes");
	}else{
		
		header("Location: kategoriler.php?sonuc=no");
		
	}
	
	}
	
	
	
	
}

?>