-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 17 Ara 2019, 04:40:03
-- Sunucu sürümü: 10.3.15-MariaDB
-- PHP Sürümü: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kitap`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevirmenEkle` (IN `pc_adi` VARCHAR(50), IN `pc_id` INT)  BEGIN
  INSERT INTO cevirmen(c_adi, c_id) VALUES(pc_adi, pc_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `etiketEkle` (IN `petiket_adi` VARCHAR(50), IN `petiket_id` INT)  BEGIN
  INSERT INTO etiketler(etiket_adi, etiket_id) VALUES(petiket_adi, petiket_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kategoriEkle` (IN `k_adi` VARCHAR(50), IN `k_id` INT)  BEGIN
  INSERT INTO kategoriler(kategori_adi, kategori_id) VALUES(k_adi, kategori_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `yazarEkle` (IN `pyazar_adi` VARCHAR(50), IN `pyazar_id` INT)  BEGIN
  INSERT INTO yazar(yazar_adi, yazar_id) VALUES(pyazar_adi, pyazar_id);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

CREATE TABLE `ayarlar` (
  `site_id` int(11) NOT NULL,
  `site_url` varchar(500) NOT NULL,
  `site_title` varchar(500) NOT NULL,
  `site_desc` varchar(500) NOT NULL,
  `site_keyw` varchar(500) NOT NULL,
  `site_logo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ayarlar`
--

INSERT INTO `ayarlar` (`site_id`, `site_url`, `site_title`, `site_desc`, `site_keyw`, `site_logo`) VALUES
(1, 'localhost', 'Baslik', 'Aciklama', 'deneme', 'deneme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cevirmen`
--

CREATE TABLE `cevirmen` (
  `c_id` int(11) NOT NULL,
  `c_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `cevirmen`
--
DELIMITER $$
CREATE TRIGGER `bir_cevirmen_silindi` BEFORE DELETE ON `cevirmen` FOR EACH ROW BEGIN
  INSERT INTO silinencevirmen(scevirmen_adi) VALUES(CONCAT(OLD.c_adi, ' silindi.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_ins_char` BEFORE INSERT ON `cevirmen` FOR EACH ROW SET NEW.c_adi = UPPER(NEW.c_adi)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_up_char` BEFORE UPDATE ON `cevirmen` FOR EACH ROW SET NEW.c_adi = LOWER(NEW.c_adi)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `etiketler`
--

CREATE TABLE `etiketler` (
  `etiket_id` int(11) NOT NULL,
  `etiket_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `etiketler`
--
DELIMITER $$
CREATE TRIGGER `bir_etiket_silindi` BEFORE DELETE ON `etiketler` FOR EACH ROW BEGIN
  INSERT INTO silinenetiket(setiket_adi) VALUES(CONCAT(OLD.etiket_adi, ' silindi.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `hakkimizda_id` int(11) NOT NULL,
  `h_resim` varchar(500) NOT NULL,
  `h_aciklama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `hakkimizda`
--

INSERT INTO `hakkimizda` (`hakkimizda_id`, `h_resim`, `h_aciklama`) VALUES
(1, 'hakkimizda.jpg', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `icerikler`
--

CREATE TABLE `icerikler` (
  `yazi_id` int(11) NOT NULL,
  `yazi_resim` varchar(500) NOT NULL,
  `yazi_baslik` varchar(500) NOT NULL,
  `yazi_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `yazi_kategori_id` int(11) NOT NULL,
  `yazi_gosterim` varchar(500) NOT NULL,
  `yazi_link` varchar(500) NOT NULL,
  `yazi_icerik` text NOT NULL,
  `y_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `icerik_yazar_id` int(11) NOT NULL,
  `etiket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

CREATE TABLE `iletisim` (
  `i_id` int(11) NOT NULL,
  `i_resim` varchar(500) NOT NULL,
  `i_aciklama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `iletisim`
--

INSERT INTO `iletisim` (`i_id`, `i_resim`, `i_aciklama`) VALUES
(1, 'iletisim.jpg', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islem`
--

CREATE TABLE `islem` (
  `islem_id` int(11) NOT NULL,
  `islem_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `islem`
--

INSERT INTO `islem` (`islem_id`, `islem_adi`) VALUES
(1, 'isofsoifsoifs silindi.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kat`
--

CREATE TABLE `kat` (
  `kat_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `action` varchar(500) NOT NULL,
  `starihi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(500) NOT NULL,
  `kategori_link` varchar(500) NOT NULL,
  `kategori_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`, `kategori_link`, `kategori_tarihi`) VALUES
(1, 'Aksiyon', 'localhost/kategori/aksiyon.php', '2019-12-25 20:00:00'),
(2, 'Korku', 'localhost/kategori/korku.php', '2019-12-27 20:00:00');

--
-- Tetikleyiciler `kategoriler`
--
DELIMITER $$
CREATE TRIGGER `bir_kategori_eklendi` BEFORE INSERT ON `kategoriler` FOR EACH ROW BEGIN
  INSERT INTO islem(islem_adi) VALUES(CONCAT(NEW.kategori_adi, ' eklendi.'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bir_kategori_silindi` BEFORE DELETE ON `kategoriler` FOR EACH ROW BEGIN
  INSERT INTO silinenkategori(skategori_adi) VALUES(CONCAT(OLD.kategori_adi, ' silindi.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reklamlar`
--

CREATE TABLE `reklamlar` (
  `reklam_id` int(11) NOT NULL,
  `reklam_resim` varchar(500) NOT NULL,
  `reklam_link` varchar(500) NOT NULL,
  `reklam_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `reklamlar`
--

INSERT INTO `reklamlar` (`reklam_id`, `reklam_resim`, `reklam_link`, `reklam_tarihi`) VALUES
(1, 'reklam.jpg', 'deneme.com', '2019-12-27 20:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `silinencevirmen`
--

CREATE TABLE `silinencevirmen` (
  `scevirmen_id` int(11) NOT NULL,
  `scevirmen_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `silinenetiket`
--

CREATE TABLE `silinenetiket` (
  `setiket_id` int(11) NOT NULL,
  `setiket_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `silinenkategori`
--

CREATE TABLE `silinenkategori` (
  `skategori_id` int(11) NOT NULL,
  `skategori_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `silinenkategori`
--

INSERT INTO `silinenkategori` (`skategori_id`, `skategori_adi`) VALUES
(1, 'DENEME silindi.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `telifhakki`
--

CREATE TABLE `telifhakki` (
  `telif_id` int(11) NOT NULL,
  `telif_resim` varchar(500) NOT NULL,
  `telif_aciklama` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `telifhakki`
--

INSERT INTO `telifhakki` (`telif_id`, `telif_resim`, `telif_aciklama`) VALUES
(1, 't.jpg', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMak');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazar_id` int(11) NOT NULL,
  `yazar_adi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yazar_id`, `yazar_adi`) VALUES
(1, 'dsdssdsd'),
(2, 'fslskflksf'),
(3, 'kfjfsljsljfsl');

--
-- Tetikleyiciler `yazar`
--
DELIMITER $$
CREATE TRIGGER `bir_yazar_silindi` BEFORE DELETE ON `yazar` FOR EACH ROW BEGIN
  INSERT INTO islem(islem_adi) VALUES(CONCAT(OLD.yazar_adi, ' silindi.'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yil`
--

CREATE TABLE `yil` (
  `y_id` int(11) NOT NULL,
  `y_tarihi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayarlar`
--
ALTER TABLE `ayarlar`
  ADD PRIMARY KEY (`site_id`);

--
-- Tablo için indeksler `cevirmen`
--
ALTER TABLE `cevirmen`
  ADD PRIMARY KEY (`c_id`);

--
-- Tablo için indeksler `etiketler`
--
ALTER TABLE `etiketler`
  ADD PRIMARY KEY (`etiket_id`);

--
-- Tablo için indeksler `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`hakkimizda_id`);

--
-- Tablo için indeksler `icerikler`
--
ALTER TABLE `icerikler`
  ADD PRIMARY KEY (`yazi_id`),
  ADD KEY `yazi_kategori_id` (`yazi_kategori_id`),
  ADD KEY `y_id` (`y_id`,`c_id`,`icerik_yazar_id`,`etiket_id`),
  ADD KEY `icerik_yazar_id` (`icerik_yazar_id`),
  ADD KEY `etiket_id` (`etiket_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Tablo için indeksler `iletisim`
--
ALTER TABLE `iletisim`
  ADD PRIMARY KEY (`i_id`);

--
-- Tablo için indeksler `islem`
--
ALTER TABLE `islem`
  ADD PRIMARY KEY (`islem_id`);

--
-- Tablo için indeksler `kat`
--
ALTER TABLE `kat`
  ADD PRIMARY KEY (`kat_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `reklamlar`
--
ALTER TABLE `reklamlar`
  ADD PRIMARY KEY (`reklam_id`);

--
-- Tablo için indeksler `silinencevirmen`
--
ALTER TABLE `silinencevirmen`
  ADD PRIMARY KEY (`scevirmen_id`);

--
-- Tablo için indeksler `silinenetiket`
--
ALTER TABLE `silinenetiket`
  ADD PRIMARY KEY (`setiket_id`);

--
-- Tablo için indeksler `silinenkategori`
--
ALTER TABLE `silinenkategori`
  ADD PRIMARY KEY (`skategori_id`);

--
-- Tablo için indeksler `telifhakki`
--
ALTER TABLE `telifhakki`
  ADD PRIMARY KEY (`telif_id`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazar_id`);

--
-- Tablo için indeksler `yil`
--
ALTER TABLE `yil`
  ADD PRIMARY KEY (`y_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ayarlar`
--
ALTER TABLE `ayarlar`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `cevirmen`
--
ALTER TABLE `cevirmen`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `etiketler`
--
ALTER TABLE `etiketler`
  MODIFY `etiket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `hakkimizda`
--
ALTER TABLE `hakkimizda`
  MODIFY `hakkimizda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `icerikler`
--
ALTER TABLE `icerikler`
  MODIFY `yazi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `iletisim`
--
ALTER TABLE `iletisim`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `islem`
--
ALTER TABLE `islem`
  MODIFY `islem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `reklamlar`
--
ALTER TABLE `reklamlar`
  MODIFY `reklam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `silinencevirmen`
--
ALTER TABLE `silinencevirmen`
  MODIFY `scevirmen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `silinenetiket`
--
ALTER TABLE `silinenetiket`
  MODIFY `setiket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `silinenkategori`
--
ALTER TABLE `silinenkategori`
  MODIFY `skategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `telifhakki`
--
ALTER TABLE `telifhakki`
  MODIFY `telif_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `yil`
--
ALTER TABLE `yil`
  MODIFY `y_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `icerikler`
--
ALTER TABLE `icerikler`
  ADD CONSTRAINT `icerikler_ibfk_1` FOREIGN KEY (`yazi_kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  ADD CONSTRAINT `icerikler_ibfk_2` FOREIGN KEY (`icerik_yazar_id`) REFERENCES `yazar` (`yazar_id`),
  ADD CONSTRAINT `icerikler_ibfk_3` FOREIGN KEY (`etiket_id`) REFERENCES `etiketler` (`etiket_id`),
  ADD CONSTRAINT `icerikler_ibfk_4` FOREIGN KEY (`y_id`) REFERENCES `yil` (`y_id`),
  ADD CONSTRAINT `icerikler_ibfk_5` FOREIGN KEY (`c_id`) REFERENCES `cevirmen` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
