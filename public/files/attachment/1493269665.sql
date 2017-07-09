# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: sushang_fypms
# Generation Time: 2017-04-23 13:21:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `abstract` text,
  `subject_area` varchar(255) DEFAULT NULL,
  `objectives` text,
  `deliverables` text,
  `environment` text,
  `image` varchar(255) DEFAULT '',
  `status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '0:submitted, 1: accepted, 2: onhold, 3: rejected, 4: completed',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;

INSERT INTO `project` (`id`, `created_by`, `code`, `title`, `abstract`, `subject_area`, `objectives`, `deliverables`, `environment`, `image`, `status`, `created_at`, `updated_at`)
VALUES
	(35,9,'PRJ-28468','Intelligence Tutoring System','Nowadays, more and more people aware of ?Picross?, and more and more website about it existed. However, most people are still identifying ?Picross? only as a game. They all are unaware of the effect that it may help us developing our logical mind. Therefore, the aim of this project, the Intelligent  ...','Artificial Intelligence, Computer Education','To study the structure of the Intelligent Tutoring System (ITS)\r\n\r\nTo study and make use of the collaborative learning education model\r\n\r\nTo study the game rules and understand how to play\r\n\r\nEnhance their logical thinking and mathematics deduction\r\n\r\nTo find out the requirement ITS of Picross\r\n\r\nTo study the nature of logic and the methods for logical training\r\n\r\nTo design a ITS which can give logic hints that is detailed enough to simulate the logic develop of the player\r\n\r\nTo implement the design on such ITS\r\n\r\nTo evaluate players? improvement on logic\r\n\r\nTo evaluate the logical benefits for Picross players\r\n\r\nTo evaluate the learning beneficial for collaboratively solving Picross','An application for users to work on Picross exercises., An application provides solution of the exercise and communication platform in between players., An application teaches users how to play Picross in a logical way and provides hints for players, A common area allows players to invite others to join in and to contribute on others exercise., A platform to allow user create their own Pircross questions and share with others player','Mozilla Firefox 3.0.5 [Free], Database: MySQL Community','','1','2017-04-07 11:09:07','2017-04-23 10:29:08'),
	(36,9,'PRJ-11241','Smart Applicants Matching System','Nowadays, no matter what jobs you apply; a resume is the necessary document to let you introduce yourself to the employers. However, many employers face problems in handling resumes for recruitment. The tedious resumes analytical works make the recruitment process inefficient. Also, when there are m ...','Computer system','Everyday, companies and institutions have to handle large amount of applicants&#039\r\ndata (commonly in document format from email) and the data of applicants from some personnel companies (from their database) \r\nThe system is dedicated to get a large set of heterogeneous applicants data sources (e.g. MS Word document, XML, data from MS Access or MS SQL database) to appear to users as a single, homogeneous data source. Also, the system can find out the most suitable applicants automatically with predefined criteria.','Incoming information which comes with different format or database could be transferred to the data base automatically and a single interface for ease of data migration and sharing. Also, the user can generate reports for further analysis.','Pentium PC','','0','2017-04-07 11:42:07','2017-04-07 11:42:07');

/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table project_invitation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_invitation`;

CREATE TABLE `project_invitation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `invitee` enum('student','supervisor') DEFAULT 'student',
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `project_invitation` WRITE;
/*!40000 ALTER TABLE `project_invitation` DISABLE KEYS */;

INSERT INTO `project_invitation` (`id`, `project_id`, `email`, `invitee`, `status`, `created_at`, `updated_at`)
VALUES
	(39,35,'team1@gmail.com','student','accepted','2017-04-07 11:09:07','2017-04-07 11:21:03'),
	(40,35,'supervisor@gmail.com','supervisor','accepted','2017-04-07 11:09:12','2017-04-07 11:23:46'),
	(41,36,'team2@gmail.com','student','pending','2017-04-07 11:42:07','2017-04-07 11:42:07'),
	(42,36,'sushang@gmail.com','student','pending','2017-04-07 11:42:12','2017-04-07 11:42:12'),
	(43,36,'sanjay.khadka@gmail.com','supervisor','accepted','2017-04-07 11:42:12','2017-04-07 11:42:12');

/*!40000 ALTER TABLE `project_invitation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_project_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_project_rel`;

CREATE TABLE `student_project_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `student_project_rel` WRITE;
/*!40000 ALTER TABLE `student_project_rel` DISABLE KEYS */;

INSERT INTO `student_project_rel` (`id`, `student_id`, `project_id`, `created_at`, `updated_at`)
VALUES
	(2,12,35,'2017-04-07 11:21:03','2017-04-07 11:21:03');

/*!40000 ALTER TABLE `student_project_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table submission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `submission`;

CREATE TABLE `submission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table submission_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `submission_comment`;

CREATE TABLE `submission_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) DEFAULT NULL,
  `commented_by` enum('student','supervisor') DEFAULT NULL,
  `commented_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table supervisor_project_rel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supervisor_project_rel`;

CREATE TABLE `supervisor_project_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `supervisor_project_rel` WRITE;
/*!40000 ALTER TABLE `supervisor_project_rel` DISABLE KEYS */;

INSERT INTO `supervisor_project_rel` (`id`, `supervisor_id`, `project_id`, `created_at`, `updated_at`)
VALUES
	(2,11,35,'2017-04-07 11:23:46','2017-04-07 11:23:46'),
	(3,6,36,'2017-04-23 18:01:53',NULL);

/*!40000 ALTER TABLE `supervisor_project_rel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `descr` text,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;

INSERT INTO `tasks` (`id`, `supervisor_id`, `project_id`, `title`, `descr`, `attachment`, `created_at`, `updated_at`, `deadline`)
VALUES
	(1,11,35,'Domain Registration',' dummy detail goes here\ndummy detail goes here\ndummy detail goes here\ndummy detail goes here\ndummy detail goes here\ndummy detail goes heredummy detail goes heredummy detail goes heredummy detail goes heredummy detail goes here','task/4eTKaCTd062IsTsXWUnaV92hnUmfWgGCZWCMymOi.docx','2017-04-23 01:22:28','2017-04-23 01:22:28','2017-04-25 00:00:00'),
	(2,6,36,'PPP assignment','dummy detail goes heredummy detail goes heredummy detail goes here dummy detail goes here\ndummy detail goes here\ndummy detail goes here dummy detail goes heredummy detail goes here','task/4wXEnle59eb0NG2Kc1E1Hze4i2xgoq8FQMnHyRuU.txt','2017-04-23 12:17:57','2017-04-23 12:17:57','2017-04-28 00:00:00'),
	(3,11,35,'Assignment 2','dummy detail goes here dummy detail goes here dummy detail goes here dummy detail goes here\ndummy detail goes here\ndummy detail goes heredummy detail goes heredummy detail goes here ','','2017-04-23 12:21:25','2017-04-23 12:21:25','2017-04-30 00:00:00'),
	(4,6,36,'assignemnt 2','s\r\nfsd\r\nfsd','/files/attachment/1492953413.docx','2017-04-23 13:16:53','2017-04-23 13:16:53','2017-04-25 00:00:00');

/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','supervisor','student') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `remember_token`, `role`, `created_at`, `updated_at`)
VALUES
	(1,'Sushang','','sushang@gmail.com','$2y$10$Gkg0TvdCNzoQezoIH74hKu6/RZPLKI4CpODjzBgeytmpZQk6.0uau','xJ8MqJxA2O8yyi0eelWs9hYmzepImU8DintdUVVCEm8ygF6goIJhuleIFxLe','student','2017-01-29 02:11:12','2017-01-29 02:11:12'),
	(6,'Sanjay','Khadka','sanjay.khadka@gmail.com','$2y$10$qlpxrcPvhiM8A.Q0iUwhGect8yZwvp.w1LYhVvZ5X7xtRriiBaUfW','fpXO3vg3nv72CrkQyCYnLy0s5Xk44tRTSYlMnv7msw6yPKduVdqLiOVgZsYc','supervisor','2017-01-29 09:12:05','2017-01-29 09:12:05'),
	(7,'Prabin','Mishra','prabin@gmail.com','$2y$10$BCkjvNmd17jY/mtPXNfyG./v7vcdulVntA.jXQyRJNFVF3FTklH6C','yFB5vCmop2S2OTHhJBLlRKD5yYu6Xt8i04FaWKrSGNhffpY7yE5F4rZPlnIg','student','2017-01-29 09:32:56','2017-01-29 09:32:56'),
	(8,'Bikash','Khanal','bikash.khanal@gmail.com','$2y$10$5G446kyUqGan3Plvi6OTi.ShnQ6eNbmmAerPQ0gaC0y6jlAUNXvTy',NULL,'student','2017-02-02 10:51:35','2017-02-02 10:51:35'),
	(9,'Student','Student','student@gmail.com','$2y$10$jQTmK8w1TJ4Sy4dqq.oKq.cAPtjx8uluoduOt0THc1SZvfYhRPxG.','NKJg93m8lEOHN978vig7ao6xrFGqmmN03t0qc1y0W2TNIayvUYxR8gfe1pgQ','student','2017-02-28 02:10:07','2017-02-28 02:10:07'),
	(11,'Supervisor','Supervisor','supervisor@gmail.com','$2y$10$30.3QKeyBmg69jbzIfMMruIivUG2X.8mqohXuy2QRkDtrPZRp2YxW','QAC2vaEjNWSLNmkSWM9KspVB6WEs5bfOAtE85MX1oAlH0zCmd6UfCKHfimTP','supervisor','2017-02-28 02:12:00','2017-02-28 02:12:00'),
	(12,'team1','team1','team1@gmail.com','',NULL,'student',NULL,NULL),
	(14,'Admin','Admin','admin@gmail.com','$2y$10$WAbYpwVLmyP0abMc3adkcOON4rLFBvYVc2k96ruF23m6qi7ORvB16','SW0fWi9zeQ4vbcyuaYWWf9NnNIKpUNVu4hujiBkIwfgntzK3xENs99V66wpM','admin','2017-03-21 01:27:54','2017-03-21 01:27:54'),
	(15,'Broadway','sfsdf','broadwayadmin@gmail.com','$2y$10$nqB5atDbDWi57JAx2Sj4B.IvY7WSddnwZVG55W4miYOvghrreUFLa',NULL,'admin','2017-04-03 15:31:22','2017-04-03 15:31:22');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users1`;

CREATE TABLE `users1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `fname` varchar(100) NOT NULL DEFAULT '',
  `lname` varchar(100) NOT NULL DEFAULT '',
  `type` enum('admin','supervisor','student') NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
