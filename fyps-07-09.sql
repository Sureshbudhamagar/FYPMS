-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.18-0ubuntu0.17.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table vproject1.conversation
DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.conversation: ~0 rows (approximately)
DELETE FROM `conversation`;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;

-- Dumping structure for table vproject1.conversation_reply
DROP TABLE IF EXISTS `conversation_reply`;
CREATE TABLE IF NOT EXISTS `conversation_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.conversation_reply: ~0 rows (approximately)
DELETE FROM `conversation_reply`;
/*!40000 ALTER TABLE `conversation_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_reply` ENABLE KEYS */;

-- Dumping structure for table vproject1.messages
DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text,
  `status` tinyint(1) DEFAULT '0' COMMENT '0: unread, 1: read',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.messages: ~12 rows (approximately)
DELETE FROM `messages`;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `from`, `to`, `message`, `status`, `created_at`, `updated_at`) VALUES
	(1, 9, 11, 'test message 1', 1, '2017-05-03 07:36:55', '2017-07-08 06:21:56'),
	(2, 11, 9, 'hello message', 0, '2017-05-03 07:37:15', '2017-05-03 04:42:39'),
	(3, 17, 11, 'ok message', 1, '2017-05-03 07:37:39', '2017-05-03 04:42:25'),
	(4, 9, 17, 'very ok message', 0, '2017-05-03 07:37:48', NULL),
	(5, 11, 8, 'hello bikash', 0, '2017-05-03 04:45:47', '2017-05-03 04:45:47'),
	(6, 11, 9, 'hello student', 0, '2017-05-03 04:46:12', '2017-05-03 04:46:12'),
	(7, 9, 11, 'sfkjsdf\r\nsf\r\nsdf', 0, '2017-05-03 04:50:42', '2017-07-08 05:57:13'),
	(8, 14, 8, 'testse', 0, '2017-07-08 06:23:23', '2017-07-08 06:23:23'),
	(9, 11, 9, 'asd fasd fasdf asd fasd f', 1, '2017-07-08 08:54:45', '2017-07-08 09:38:09'),
	(10, 11, 9, 'asdfas dasd fasd asd f', 1, '2017-07-08 08:55:55', '2017-07-08 09:38:04'),
	(11, 11, 9, 'asdf asdf asd f', 1, '2017-07-08 08:56:45', '2017-07-08 09:37:59'),
	(12, 11, 9, 'as dfasd fasdf asdf asdf asd f', 1, '2017-07-08 08:58:50', '2017-07-08 09:37:55'),
	(13, 11, 9, 'sadf asdf asdf asdf', 1, '2017-07-08 09:00:07', '2017-07-08 09:37:52'),
	(14, 11, 17, 'asd fasd fasdf asd f', 0, '2017-07-08 09:00:52', '2017-07-08 09:00:52');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table vproject1.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vproject1.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table vproject1.project
DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.project: ~9 rows (approximately)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `created_by`, `code`, `title`, `abstract`, `subject_area`, `objectives`, `deliverables`, `environment`, `image`, `status`, `created_at`, `updated_at`) VALUES
	(35, 9, 'PRJ-28468', 'Intelligence Tutoring System', 'Nowadays, more and more people aware of ?Picross?, and more and more website about it existed. However, most people are still identifying ?Picross? only as a game. They all are unaware of the effect that it may help us developing our logical mind. Therefore, the aim of this project, the Intelligent  ...', 'Artificial Intelligence, Computer Education ddd', 'To study the structure of the Intelligent Tutoring System (ITS)\r\n\r\nTo study and make use of the collaborative learning education model\r\n\r\nTo study the game rules and understand how to play\r\n\r\nEnhance their logical thinking and mathematics deduction\r\n\r\nTo find out the requirement ITS of Picross\r\n\r\nTo study the nature of logic and the methods for logical training\r\n\r\nTo design a ITS which can give logic hints that is detailed enough to simulate the logic develop of the player\r\n\r\nTo implement the design on such ITS\r\n\r\nTo evaluate players? improvement on logic\r\n\r\nTo evaluate the logical benefits for Picross players\r\n\r\nTo evaluate the learning beneficial for collaboratively solving Picross', 'An application for users to work on Picross exercises., An application provides solution of the exercise and communication platform in between players., An application teaches users how to play Picross in a logical way and provides hints for players, A common area allows players to invite others to join in and to contribute on others exercise., A platform to allow user create their own Pircross questions and share with others player', 'Mozilla Firefox 3.0.5 [Free], Database: MySQL Community asdfasdf asdf asdf', '', '3', '2017-04-07 11:09:07', '2017-07-08 09:35:43'),
	(36, 9, 'PRJ-11241', 'Smart Applicants Matching System', 'Nowadays, no matter what jobs you apply; a resume is the necessary document to let you introduce yourself to the employers. However, many employers face problems in handling resumes for recruitment. The tedious resumes analytical works make the recruitment process inefficient. Also, when there are m ...', 'Computer system', 'Everyday, companies and institutions have to handle large amount of applicants&#039\r\ndata (commonly in document format from email) and the data of applicants from some personnel companies (from their database) \r\nThe system is dedicated to get a large set of heterogeneous applicants data sources (e.g. MS Word document, XML, data from MS Access or MS SQL database) to appear to users as a single, homogeneous data source. Also, the system can find out the most suitable applicants automatically with predefined criteria.', 'Incoming information which comes with different format or database could be transferred to the data base automatically and a single interface for ease of data migration and sharing. Also, the user can generate reports for further analysis.', 'Pentium PC', '', '0', '2017-04-07 11:42:07', '2017-04-07 11:42:07'),
	(37, 17, 'PRJ-67282', 'FYPMS', 'fypms', 'fypms subject', 'sfsf\r\nsf\r\ndsf', 's\r\ndfs\r\nfd\r\nsd', 'sdsfsd sd', '', '1', '2017-04-27 05:01:56', '2017-07-07 13:29:22'),
	(38, 9, 'PRJ-54350', 'ffffff', 'sdfdsfsdf', 'sdfsd', NULL, 'sfsdfsdf', 'sfsdfs', '', '0', '2017-05-02 00:20:02', '2017-05-02 00:20:02'),
	(39, 9, 'PRJ-13748', 'sssss', 'sdfdsfsdf', 'sdfsd', NULL, 'sfsdfsdf', 'sfsdfs', '', '0', '2017-05-02 00:20:56', '2017-05-02 00:20:56'),
	(40, 9, 'PRJ-50016', 'hamro f', 'asdfdsaff', 'sdfsaffsad', 'ddd', 'hhh', 'hhh', '', '0', '2017-07-07 13:22:43', '2017-07-07 13:22:43'),
	(41, 9, 'PRJ-85062', 'hamro f', 'asdfdsaff', 'sdfsaffsad', 'ddd', 'hhh', 'hhh', '', '0', '2017-07-07 13:23:43', '2017-07-07 13:23:43'),
	(42, 9, 'PRJ-38707', 'hamro f', 'asdfdsaff', 'sdfsaffsad', 'ddd', 'hhh', 'hhh', '', '0', '2017-07-07 13:23:47', '2017-07-07 13:23:47'),
	(43, 9, 'PRJ-77214', 'hamro f', 'asdfdsaff', 'sdfsaffsad', 'ddd', 'hhh', 'hhh', '', '0', '2017-07-07 13:24:21', '2017-07-07 13:24:21');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Dumping structure for table vproject1.project_invitation
DROP TABLE IF EXISTS `project_invitation`;
CREATE TABLE IF NOT EXISTS `project_invitation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `invitee` enum('student','supervisor') DEFAULT 'student',
  `message` text,
  `status` enum('pending','accepted','rejected','hold') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.project_invitation: ~14 rows (approximately)
DELETE FROM `project_invitation`;
/*!40000 ALTER TABLE `project_invitation` DISABLE KEYS */;
INSERT INTO `project_invitation` (`id`, `project_id`, `email`, `invitee`, `message`, `status`, `created_at`, `updated_at`) VALUES
	(39, 35, 'team1@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/student/team1@gmail.com/35">Click here</a>. <br>', 'pending', '2017-04-07 11:09:07', '2017-04-07 11:21:03'),
	(40, 35, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/supervisor/supervisor@gmail.com/35">Click here</a>. ', 'accepted', '2017-04-07 11:09:12', '2017-07-08 04:20:05'),
	(41, 36, 'team2@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/student/team2@gmail.com/36">Click here</a>. <br>', 'pending', '2017-04-07 11:42:07', '2017-04-07 11:42:07'),
	(42, 36, 'sushang@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/student/sushang@gmail.com/36">Click here</a>. <br>', 'pending', '2017-04-07 11:42:12', '2017-04-07 11:42:12'),
	(43, 36, 'sanjay.khadka@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/supervisor/sanjay.khadka@gmail.com/36">Click here</a>. <br>', 'pending', '2017-04-07 11:42:12', '2017-04-07 11:42:12'),
	(44, 37, 'teamfypms@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/student/teamfypms@gmail.com/37">Click here</a>. <br>', 'pending', '2017-04-27 05:01:56', '2017-04-27 05:01:56'),
	(45, 37, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/supervisor/supervisor@gmail.com/37">Click here</a>. ', 'hold', '2017-04-27 05:02:03', '2017-07-08 09:00:52'),
	(46, 38, 'team1@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/student/team1@gmail.com/38">Click here</a>. <br>', 'pending', '2017-05-02 00:20:02', '2017-05-02 00:20:02'),
	(47, 38, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/supervisor/supervisor@gmail.com/38">Click here</a>. ', 'pending', '2017-05-02 00:20:06', '2017-07-08 04:05:45'),
	(48, 39, 'team1@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/student/team1@gmail.com/39">Click here</a>. <br>', 'pending', '2017-05-02 00:20:56', '2017-05-02 00:20:56'),
	(49, 39, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://localhost:8080/project/invitation/supervisor/supervisor@gmail.com/39">Click here</a>. ', 'rejected', '2017-05-02 00:20:59', '2017-07-08 08:58:50'),
	(50, 40, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/40">Click here</a>. ', 'rejected', '2017-07-07 13:22:43', '2017-07-08 08:56:45'),
	(51, 41, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/41">Click here</a>. ', 'rejected', '2017-07-07 13:23:43', '2017-07-08 08:55:55'),
	(52, 42, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/42">Click here</a>. ', 'accepted', '2017-07-07 13:23:47', '2017-07-08 05:16:54'),
	(53, 43, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/43">Click here</a>. ', 'accepted', '2017-07-07 13:24:21', '2017-07-08 04:40:53');
/*!40000 ALTER TABLE `project_invitation` ENABLE KEYS */;

-- Dumping structure for table vproject1.student_project_rel
DROP TABLE IF EXISTS `student_project_rel`;
CREATE TABLE IF NOT EXISTS `student_project_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.student_project_rel: ~0 rows (approximately)
DELETE FROM `student_project_rel`;
/*!40000 ALTER TABLE `student_project_rel` DISABLE KEYS */;
INSERT INTO `student_project_rel` (`id`, `student_id`, `project_id`, `created_at`, `updated_at`) VALUES
	(2, 12, 35, '2017-04-07 11:21:03', '2017-04-07 11:21:03');
/*!40000 ALTER TABLE `student_project_rel` ENABLE KEYS */;

-- Dumping structure for table vproject1.submission
DROP TABLE IF EXISTS `submission`;
CREATE TABLE IF NOT EXISTS `submission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'submitted date',
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('ontime','late') DEFAULT 'ontime',
  `read` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.submission: ~3 rows (approximately)
DELETE FROM `submission`;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` (`id`, `task_id`, `student_id`, `attachment`, `created_at`, `updated_at`, `status`, `read`) VALUES
	(1, 5, 17, '/files/submission/1493271886.docx', '2017-04-27 05:44:46', '2017-04-27 05:44:46', 'ontime', '1'),
	(2, 5, 17, '/files/submission/1493272986.sql', '2017-04-27 06:03:07', '2017-04-27 06:03:07', 'ontime', '1'),
	(3, 6, 9, '/files/submission/1493718889.docx', '2017-05-02 09:54:49', '2017-05-02 09:54:49', 'late', '1'),
	(4, 8, 9, '/files/submission/1499579651.docx', '2017-07-09 05:54:11', '2017-07-09 05:54:11', 'ontime', '1'),
	(5, 8, 9, '/files/submission/1499579855.docx', '2017-07-09 05:57:35', '2017-07-09 05:57:35', 'ontime', '0');
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;

-- Dumping structure for table vproject1.submission_comment
DROP TABLE IF EXISTS `submission_comment`;
CREATE TABLE IF NOT EXISTS `submission_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) DEFAULT NULL,
  `commented_by` int(11) NOT NULL COMMENT 'can be either supervisor or student',
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.submission_comment: ~6 rows (approximately)
DELETE FROM `submission_comment`;
/*!40000 ALTER TABLE `submission_comment` DISABLE KEYS */;
INSERT INTO `submission_comment` (`id`, `submission_id`, `commented_by`, `comment`, `created_at`, `updated_at`) VALUES
	(1, 2, 17, 'This is a test comment\ns\nfsd\nfs\ndf\n<br>sdf sd\nf s\n', '2017-05-02 14:16:38', NULL),
	(2, 2, 11, 'commented by supervisor\nsf\nsf\ns \nsf \ntest comment', '2017-05-02 14:17:20', NULL),
	(3, 2, 11, 'test test s\r\nf\r\nsdf', '2017-05-02 09:47:09', '2017-05-02 09:47:09'),
	(4, 2, 11, 'test test s\r\nf\r\nsdf', '2017-05-02 09:48:27', '2017-05-02 09:48:27'),
	(5, 2, 11, 'hello test sd\r\nf s\r\nsf', '2017-05-02 09:48:52', '2017-05-02 09:48:52'),
	(7, 3, 9, 's\r\nfs\r\ndf', '2017-05-02 10:24:06', '2017-05-02 10:24:06');
/*!40000 ALTER TABLE `submission_comment` ENABLE KEYS */;

-- Dumping structure for table vproject1.supervisor_project_rel
DROP TABLE IF EXISTS `supervisor_project_rel`;
CREATE TABLE IF NOT EXISTS `supervisor_project_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.supervisor_project_rel: ~15 rows (approximately)
DELETE FROM `supervisor_project_rel`;
/*!40000 ALTER TABLE `supervisor_project_rel` DISABLE KEYS */;
INSERT INTO `supervisor_project_rel` (`id`, `supervisor_id`, `project_id`, `created_at`, `updated_at`) VALUES
	(2, 11, 35, '2017-04-07 11:23:46', '2017-04-07 11:23:46'),
	(3, 6, 36, '2017-04-23 18:01:53', NULL),
	(4, 11, 37, '2017-04-27 05:04:29', '2017-04-27 05:04:29'),
	(5, 11, 43, '2017-07-08 03:42:44', '2017-07-08 03:42:44'),
	(6, 11, 42, '2017-07-08 03:43:43', '2017-07-08 03:43:43'),
	(7, 11, 41, '2017-07-08 03:44:04', '2017-07-08 03:44:04'),
	(8, 11, 40, '2017-07-08 03:46:12', '2017-07-08 03:46:12'),
	(9, 11, 49, '2017-07-08 04:05:40', '2017-07-08 04:05:40'),
	(10, 11, 47, '2017-07-08 04:05:45', '2017-07-08 04:05:45'),
	(11, 11, 40, '2017-07-08 04:20:05', '2017-07-08 04:20:05'),
	(12, 11, 53, '2017-07-08 04:40:53', '2017-07-08 04:40:53'),
	(13, 11, 52, '2017-07-08 05:16:54', '2017-07-08 05:16:54'),
	(14, 11, 41, '2017-07-08 08:55:55', '2017-07-08 08:55:55'),
	(15, 11, 40, '2017-07-08 08:56:45', '2017-07-08 08:56:45'),
	(16, 11, 39, '2017-07-08 08:58:50', '2017-07-08 08:58:50'),
	(17, 11, 38, '2017-07-08 09:00:07', '2017-07-08 09:00:07'),
	(18, 11, 37, '2017-07-08 09:00:52', '2017-07-08 09:00:52');
/*!40000 ALTER TABLE `supervisor_project_rel` ENABLE KEYS */;

-- Dumping structure for table vproject1.table_data
DROP TABLE IF EXISTS `table_data`;
CREATE TABLE IF NOT EXISTS `table_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_data_values` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.table_data: ~0 rows (approximately)
DELETE FROM `table_data`;
/*!40000 ALTER TABLE `table_data` DISABLE KEYS */;
INSERT INTO `table_data` (`id`, `table_data_values`, `created_at`, `updated_at`) VALUES
	(1, '{"gender":"Male","maritalstatus":"Married","working":"[\\"employed\\",\\"unemployed\\"]"}', '2017-05-10 06:07:55', '2017-05-10 06:07:55');
/*!40000 ALTER TABLE `table_data` ENABLE KEYS */;

-- Dumping structure for table vproject1.table_header
DROP TABLE IF EXISTS `table_header`;
CREATE TABLE IF NOT EXISTS `table_header` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `options` longtext,
  `default` varchar(100) DEFAULT NULL,
  `display_order` tinyint(3) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.table_header: ~3 rows (approximately)
DELETE FROM `table_header`;
/*!40000 ALTER TABLE `table_header` DISABLE KEYS */;
INSERT INTO `table_header` (`id`, `label`, `name`, `type`, `options`, `default`, `display_order`, `created_at`, `updated_at`) VALUES
	(3, 'Gender', 'gender', 'select', 'a:3:{i:0;s:4:"Male";i:1;s:6:"Female";i:2;s:5:"Other";}', 'Male', 0, '2017-05-10 04:10:59', '2017-05-10 04:10:59'),
	(4, 'Marital Status', 'maritalstatus', 'radio', 'a:3:{i:0;s:7:"Married";i:1;s:9:"Unmarried";i:2;s:5:"Widow";}', 'Married', 2, '2017-05-10 05:45:48', '2017-05-10 05:45:48'),
	(5, 'Working', 'working', 'checkbox', 'a:3:{i:0;s:8:"employed";i:1;s:10:"unemployed";i:2;N;}', 'unemployed', 3, '2017-05-10 05:46:43', '2017-05-10 05:46:43');
/*!40000 ALTER TABLE `table_header` ENABLE KEYS */;

-- Dumping structure for table vproject1.tasks
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `descr` text,
  `attachment` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.tasks: ~9 rows (approximately)
DELETE FROM `tasks`;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `supervisor_id`, `project_id`, `title`, `descr`, `attachment`, `status`, `created_at`, `updated_at`, `deadline`) VALUES
	(1, 11, 35, 'Domain Registration', ' dummy detail goes here\ndummy detail goes here\ndummy detail goes here\ndummy detail goes here\ndummy detail goes here\ndummy detail goes heredummy detail goes heredummy detail goes heredummy detail goes heredummy detail goes here', 'task/4eTKaCTd062IsTsXWUnaV92hnUmfWgGCZWCMymOi.docx', 1, '2017-04-23 01:22:28', '2017-04-23 01:22:28', '2017-04-25 00:00:00'),
	(2, 6, 36, 'PPP assignment', 'dummy detail goes heredummy detail goes heredummy detail goes here dummy detail goes here\ndummy detail goes here\ndummy detail goes here dummy detail goes heredummy detail goes here', 'task/4wXEnle59eb0NG2Kc1E1Hze4i2xgoq8FQMnHyRuU.txt', 1, '2017-04-23 12:17:57', '2017-04-23 12:17:57', '2017-04-28 00:00:00'),
	(3, 11, 35, 'Assignment 2', 'dummy detail goes here dummy detail goes here dummy detail goes here dummy detail goes here\ndummy detail goes here\ndummy detail goes heredummy detail goes heredummy detail goes here ', '', 1, '2017-04-23 12:21:25', '2017-04-23 12:21:25', '2017-04-30 00:00:00'),
	(4, 6, 36, 'assignemnt 2', 's\r\nfsd\r\nfsd', '/files/attachment/1492953413.docx', 1, '2017-04-23 13:16:53', '2017-04-23 13:16:53', '2017-04-25 00:00:00'),
	(5, 11, 37, 'dsfsdfs', 'sf\r\nsd\r\nfsd', '/files/attachment/1493269623.sql', 1, '2017-04-27 05:07:03', '2017-04-27 05:07:03', '2017-04-30 00:00:00'),
	(6, 11, 35, 'do workshop 5 reportdddddddddddddddd', 's\r\nfs\r\nfd\r\nsd', '/files/attachment/1493269665.sql', 1, '2017-04-27 05:07:46', '2017-07-08 09:49:16', '2017-07-29 00:00:00'),
	(7, 11, 35, 'tetset', 'asfgasdf asd fasd', '/files/attachment/1499577399.docx', 1, '2017-07-09 05:16:39', '2017-07-09 05:16:39', '2017-07-31 00:00:00'),
	(8, 11, 35, 'asdfasdf', 'asdfasdf', '/files/attachment/1499577498.doc', 1, '2017-07-09 05:18:18', '2017-07-09 05:54:11', '2017-07-29 00:00:00'),
	(9, 11, 43, 'test task', 'sdf sd sdffg sdfg', '/files/attachment/1499578202.docx', 0, '2017-07-09 05:30:02', '2017-07-09 05:30:02', '2017-07-31 00:00:00');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;

-- Dumping structure for table vproject1.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vproject1.users: ~10 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'Sushang', 'Dhanpat', 'sushang@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'xJ8MqJxA2O8yyi0eelWs9hYmzepImU8DintdUVVCEm8ygF6goIJhuleIFxLe', 'student', '2017-01-29 02:11:12', '2017-01-29 02:11:12'),
	(6, 'Sanjay', 'Khadka', 'sanjay.khadka@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'fpXO3vg3nv72CrkQyCYnLy0s5Xk44tRTSYlMnv7msw6yPKduVdqLiOVgZsYc', 'supervisor', '2017-01-29 09:12:05', '2017-01-29 09:12:05'),
	(7, 'Prabin', 'Mishra', 'prabin@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'yFB5vCmop2S2OTHhJBLlRKD5yYu6Xt8i04FaWKrSGNhffpY7yE5F4rZPlnIg', 'student', '2017-01-29 09:32:56', '2017-01-29 09:32:56'),
	(8, 'Bikash', 'Khanal', 'bikash.khanal@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', NULL, 'student', '2017-02-02 10:51:35', '2017-02-02 10:51:35'),
	(9, 'Student', 'Student', 'student@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'C6bvljZkyGHKDoCqiKJRUKpyq4IYzOcJeeS6p1ISmtQEqRV8NxoglfnhPPYL', 'student', '2017-02-28 02:10:07', '2017-05-02 00:08:06'),
	(11, 'Supervisor', 'Supervisor', 'supervisor@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'CNQp3jL50VXrkunGNBNp3tcEC9YiowWl1UjfjD73ZQPCCnQJN6etJxtHdxO4', 'supervisor', '2017-02-28 02:12:00', '2017-02-28 02:12:00'),
	(12, 'team1', 'team1', 'team1@gmail.com', '', NULL, 'student', NULL, NULL),
	(14, 'Admin', 'Admin', 'admin@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'MMaVslHetiIGWSSp5GmBbeXcIXMvHEhRN34KHImcZZucszqCiNejGzIguyuC', 'admin', '2017-03-21 01:27:54', '2017-03-21 01:27:54'),
	(15, 'Broadway', 'sfsdf', 'broadwayadmin@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', NULL, 'admin', '2017-04-03 15:31:22', '2017-04-03 15:31:22'),
	(17, 'Raju', 'Lama Student', 'raju.lama@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', 'aL5Lcf5DQr9hAGxWyw3nsmtjEcLn3YM5KzhUwTAfShcTrWDmAYFvnkokcxLH', 'student', '2017-04-27 05:00:43', '2017-04-27 05:00:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table vproject1.users1
DROP TABLE IF EXISTS `users1`;
CREATE TABLE IF NOT EXISTS `users1` (
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

-- Dumping data for table vproject1.users1: ~0 rows (approximately)
DELETE FROM `users1`;
/*!40000 ALTER TABLE `users1` DISABLE KEYS */;
/*!40000 ALTER TABLE `users1` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
