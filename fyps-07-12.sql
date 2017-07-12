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
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text,
  `status` tinyint(1) DEFAULT '0' COMMENT '0: unread, 1: read',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.messages: ~0 rows (approximately)
DELETE FROM `messages`;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table vproject1.migrations
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.project: ~3 rows (approximately)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `created_by`, `code`, `title`, `abstract`, `subject_area`, `objectives`, `deliverables`, `environment`, `image`, `status`, `created_at`, `updated_at`) VALUES
	(1, 3, 'PRJ-95898', 'Project Sample 1', 'We created this toolkit to simplify the process of creating a project proposal. We know that it can be hard to find templates, samples and guides all on one page. So, we compiled everything you might need to create a good project proposal in an easily digestible format!', 'computer', 'We created this toolkit to simplify the process of creating a project proposal. We know that it can be hard to find templates, samples and guides all on one page. So, we compiled everything you might need to create a good project proposal in an easily digestible format!', 'We created this toolkit to simplify the process of creating a project proposal. We know that it can be hard to find templates, samples and guides all on one page. So, we compiled everything you might need to create a good project proposal in an easily digestible format!', 'college', '/uploads/images/1499877414.png', '0', '2017-07-12 16:36:54', '2017-07-12 16:36:54'),
	(2, 3, 'PRJ-51300', 'Project Sample 2', 'A Project Proposal is generally drafted during one of the early phases of your project (before detailed plans are made and resources are allocated). Therefore, often time and budget estimates are rough, at best.', 'roads', 'A Project Proposal is generally drafted during one of the early phases of your project (before detailed plans are made and resources are allocated). Therefore, often time and budget estimates are rough, at best.', 'A Project Proposal is generally drafted during one of the early phases of your project (before detailed plans are made and resources are allocated). Therefore, often time and budget estimates are rough, at best.', 'roads', '/uploads/images/1499877751.png', '0', '2017-07-12 16:42:31', '2017-07-12 16:42:31'),
	(3, 3, 'PRJ-41936', 'Project Sample 3', 'Despite the fact that many different formats are available, roughly 80-90% of all Project Proposals follow a similar template. They mostly all have the same structure which contains a few key points.', 'computer', 'Despite the fact that many different formats are available, roughly 80-90% of all Project Proposals follow a similar template. They mostly all have the same structure which contains a few key points.', 'Despite the fact that many different formats are available, roughly 80-90% of all Project Proposals follow a similar template. They mostly all have the same structure which contains a few key points.', 'college', '/uploads/images/1499877801.png', '1', '2017-07-12 16:43:21', '2017-07-12 17:01:53');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Dumping structure for table vproject1.project_invitation
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.project_invitation: ~6 rows (approximately)
DELETE FROM `project_invitation`;
/*!40000 ALTER TABLE `project_invitation` DISABLE KEYS */;
INSERT INTO `project_invitation` (`id`, `project_id`, `email`, `invitee`, `message`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'student2@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/student/student2@gmail.com/1">Click here</a>. <br>', 'pending', '2017-07-12 16:36:54', '2017-07-12 16:36:54'),
	(2, 1, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/1">Click here</a>. ', 'pending', '2017-07-12 16:36:58', '2017-07-12 16:39:29'),
	(3, 2, 'student2@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/student/student2@gmail.com/2">Click here</a>. <br>', 'pending', '2017-07-12 16:42:31', '2017-07-12 16:42:31'),
	(4, 2, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/2">Click here</a>. ', 'pending', '2017-07-12 16:42:36', '2017-07-12 16:42:36'),
	(5, 3, 'student2@gmail.com', 'student', 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/student/student2@gmail.com/3">Click here</a>. <br>', 'pending', '2017-07-12 16:43:21', '2017-07-12 16:43:21'),
	(6, 3, 'supervisor@gmail.com', 'supervisor', 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="http://vdemo.dev/project/invitation/supervisor/supervisor@gmail.com/3">Click here</a>. ', 'accepted', '2017-07-12 16:43:23', '2017-07-12 16:55:41');
/*!40000 ALTER TABLE `project_invitation` ENABLE KEYS */;

-- Dumping structure for table vproject1.student_project_rel
CREATE TABLE IF NOT EXISTS `student_project_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.student_project_rel: ~3 rows (approximately)
DELETE FROM `student_project_rel`;
/*!40000 ALTER TABLE `student_project_rel` DISABLE KEYS */;
INSERT INTO `student_project_rel` (`id`, `student_id`, `project_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, '2017-07-12 16:36:54', '2017-07-12 16:36:54'),
	(2, 4, 2, '2017-07-12 16:42:31', '2017-07-12 16:42:31'),
	(3, 4, 3, '2017-07-12 16:43:21', '2017-07-12 16:43:21');
/*!40000 ALTER TABLE `student_project_rel` ENABLE KEYS */;

-- Dumping structure for table vproject1.submission
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.submission: ~0 rows (approximately)
DELETE FROM `submission`;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` (`id`, `task_id`, `student_id`, `attachment`, `created_at`, `updated_at`, `status`, `read`) VALUES
	(1, 1, 3, '/files/submission/1499878934.docx', '2017-07-12 17:02:14', '2017-07-12 17:02:14', 'ontime', '0');
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;

-- Dumping structure for table vproject1.submission_comment
CREATE TABLE IF NOT EXISTS `submission_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) DEFAULT NULL,
  `commented_by` int(11) NOT NULL COMMENT 'can be either supervisor or student',
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.submission_comment: ~0 rows (approximately)
DELETE FROM `submission_comment`;
/*!40000 ALTER TABLE `submission_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comment` ENABLE KEYS */;

-- Dumping structure for table vproject1.supervisor_project_rel
CREATE TABLE IF NOT EXISTS `supervisor_project_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.supervisor_project_rel: ~4 rows (approximately)
DELETE FROM `supervisor_project_rel`;
/*!40000 ALTER TABLE `supervisor_project_rel` DISABLE KEYS */;
INSERT INTO `supervisor_project_rel` (`id`, `supervisor_id`, `project_id`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, '2017-07-12 16:36:58', '2017-07-12 16:36:58'),
	(2, 2, 2, '2017-07-12 16:39:29', '2017-07-12 16:39:29'),
	(3, 2, 2, '2017-07-12 16:42:36', '2017-07-12 16:42:36'),
	(4, 2, 3, '2017-07-12 16:43:23', '2017-07-12 16:43:23'),
	(5, 2, 6, '2017-07-12 16:55:41', '2017-07-12 16:55:41');
/*!40000 ALTER TABLE `supervisor_project_rel` ENABLE KEYS */;

-- Dumping structure for table vproject1.table_data
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table vproject1.tasks: ~0 rows (approximately)
DELETE FROM `tasks`;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id`, `supervisor_id`, `project_id`, `title`, `descr`, `attachment`, `status`, `created_at`, `updated_at`, `deadline`) VALUES
	(1, 2, 3, 'sample task 3', 'By defaut, the menu is added right after the input element. Use this option to add the menu to another div. It should not be used if you want to use bootstrap dropup or dropdown-menu-right classes.', '/files/attachment/1499878853.doc', 1, '2017-07-12 17:00:53', '2017-07-12 17:02:14', '2017-07-31 00:00:00');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;

-- Dumping structure for table vproject1.users
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vproject1.users: ~4 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'main', 'admin@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', NULL, 'admin', '2017-07-12 21:25:43', '2017-07-12 21:25:44'),
	(2, 'main', 'supervisor', 'supervisor@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', NULL, 'supervisor', '2017-07-12 21:26:15', '2017-07-12 21:26:16'),
	(3, 'studen', 'main', 'student@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', NULL, 'student', '2017-07-12 21:26:34', '2017-07-12 21:26:35'),
	(4, 'studen', 'secondary', 'student2@gmail.com', '$2y$10$6kEQlK1BF82HMvxsPIMcYONQRN5/pDA6ER8e7bNZjJWwUwCo4qhRq', NULL, 'student', '2017-07-12 21:26:34', '2017-07-12 21:26:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table vproject1.users1
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
