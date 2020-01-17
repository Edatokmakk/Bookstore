<?php 
	//veritabani baglantisi
	try {
		$db = new PDO("mysql:host=localhost; dbname=kitap; charset=utf8;","root","");
	} catch(PDOException  $error){
		echo "<center><b>Veritabanina baglanilamadi</b></center>"; $error->getMessage();
	}
	
	?>