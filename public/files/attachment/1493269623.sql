# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: freelance_zeabrose
# Generation Time: 2017-04-26 04:29:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table contact_us
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_us`;

CREATE TABLE `contact_us` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `refpage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reflink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `phone`, `subject`, `message`, `refpage`, `reflink`, `created_at`, `updated_at`)
VALUES
	(1,'hari','balancehari@gmail.com','98417878','','hello','hello','contact-us','pages/contact-us','2017-02-09 11:34:00','2017-02-09 11:34:00'),
	(2,'Sanjay Khadka','sanjay.khadka@gmail.com','98417878','','testing','hello','contact-us','pages/contact-us','2017-02-10 06:45:53','2017-02-10 06:45:53'),
	(3,'sundar','broadwayinfosys@gmail.com','98444444444','','test','terwerwrwrw','Contact Us','http://newsite.broadwayinfosys.com/page/contact-us','2017-03-21 11:24:22','2017-03-21 11:24:22'),
	(4,'akash','balancehari@gmail.com','98444444444','','test','twerwerw','Contact Us','http://newsite.broadwayinfosys.com/page/contact-us','2017-03-21 11:26:05','2017-03-21 11:26:05'),
	(5,'govinda adhikari','adhikarigopi2015@gmail.com','9841696518','','php','hello ','Contact Us','https://broadwayinfosys.com/page/contact-us','2017-03-22 08:38:02','2017-03-22 08:38:02'),
	(6,'Shovna','karkisr@gmail.com','9841936873','','seo','hi','Contact Us','https://broadwayinfosys.com/page/contact-us','2017-03-23 05:01:10','2017-03-23 05:01:10'),
	(7,'sdfsdf','sfds@gmail.com','34343434','343434343','sfdsfsdf','s\r\nfds\r\nf','Contact Us','http://zeabrose.dev/page/contact-us','2017-04-20 05:15:36','2017-04-20 05:15:36'),
	(8,'Sanjay','sanjay.khadka@gmail.com','9851188676','4106000','test subject','test messge\r\n\r\nxd\r\nf\r\ndsf\r\nsdf','Contact Us','http://zeabrose.dev/page/contact-us','2017-04-20 05:24:46','2017-04-20 05:24:46'),
	(9,'Sanjay','sanjay.khadka@gmail.com','324242424242','4343434','test subject','s\r\nfs\r\ndf\r\nsd','Contact Us','http://zeabrose.dev/page/contact-us','2017-04-22 16:19:31','2017-04-22 16:19:31');

/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
