-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2017 at 12:43 PM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zeabrose_zeabrose`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `caption`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '2017-04-19 16:04:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `group_slug` varchar(200) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `setorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_slug` (`group_slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `group_slug`, `created_at`, `updated_at`, `status`, `setorder`) VALUES
(1, 0, 'Bags', 'bags-all', NULL, NULL, 1, 1),
(2, 0, 'Jackets', 'jackets-all', NULL, NULL, 1, 0),
(3, 0, 'Pashmina', 'pashmina-all', NULL, NULL, 1, 4),
(5, 1, 'Backpack', 'backpack-bags', NULL, NULL, 1, 0),
(6, 1, 'Shoulder / Crossbody', 'shoulder-crossbody-bags', NULL, NULL, 1, 0),
(7, 2, 'Gents', 'jacket-gents', NULL, NULL, 1, 0),
(8, 2, 'Ladies', 'jacket-ladies', NULL, NULL, 1, 0),
(9, 1, 'Tote Bags', 'tote-bags', NULL, NULL, 1, 0),
(10, 3, 'Poncho', 'pashmina-poncho', NULL, NULL, 1, 0),
(11, 3, 'Stole', 'pashmina-stole', NULL, NULL, 1, 0),
(12, 3, 'Triangle', 'pashmina-triangle', NULL, NULL, 1, 0),
(13, 3, 'Shawl', 'pashmina-shawl', NULL, NULL, 1, 0),
(14, 0, 'Accessories', 'accessories-all', '2017-04-18 14:50:29', NULL, 1, 2),
(15, 0, 'Miscellaneous', 'miscellaneous', '2017-04-18 14:50:53', NULL, 1, 3),
(17, 1, 'Laptop / File Bags', 'laptop-file-bags', '2017-04-18 15:03:00', NULL, 1, 0),
(18, 1, 'Overnight Bags', 'overnight-bags', '2017-04-19 20:09:08', NULL, 1, 0),
(19, 14, 'Laptop/Tablet/Phone Sleeves', 'laptop-tablet-phone-sleeves', '2017-04-19 20:12:32', NULL, 1, 0),
(20, 14, 'Laptop/Tablet Bags', 'laptop-tablet-bags', '2017-04-19 20:13:01', NULL, 1, 0),
(21, 14, 'Wallet & Money Clips', 'wallet-money-clips', '2017-04-19 20:13:22', NULL, 1, 0),
(22, 14, 'Card Holder', 'cart-holder', '2017-04-19 20:13:35', NULL, 1, 0),
(23, 14, 'Organizer', 'organizer', '2017-04-19 20:13:44', NULL, 1, 0),
(24, 15, 'Pillow Covers', 'pillow-covers', '2017-04-19 20:16:48', NULL, 1, 0),
(25, 15, 'Bean Bags', 'bean-bags', '2017-04-19 20:17:03', NULL, 1, 0),
(26, 15, 'Travel Bags', 'travel-bags', '2017-04-19 20:17:16', NULL, 1, 0),
(27, 0, 'Te', 'te', '2017-04-20 09:39:32', NULL, 1, 0),
(28, 27, 'test test', 'test-test', '2017-04-20 09:39:54', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contactinfo`
--

CREATE TABLE IF NOT EXISTS `contactinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `key` varchar(32) DEFAULT NULL,
  `location` text,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `gplus` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `contactinfo`
--

INSERT INTO `contactinfo` (`id`, `title`, `key`, `location`, `phone`, `mobile`, `email`, `skype`, `facebook`, `gplus`, `twitter`, `linkedin`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Header', 'headercontact', NULL, '+977-1-4428497', '+977-1-9851037895, 9813554545', 'info@zeabrose.com', 'zeabrose', 'https://facebook.com/zeabrose', 'https://plus.google.com/+Zeabrose', 'https://twitter.com/zeabrose', 'https://linkedin.com/zeabrose', NULL, '2017-04-20 13:52:25', 1),
(2, 'Body', 'bodycontact', 'Lazimpat, Kathmandu, Nepal', '+977-01-4117578,4111849', '+977-1-9851157215', 'info@zeabrose.com, hr@zeabrose.com', 'zeabrose', 'https://facebook.com/zeabrose', 'https://plus.google.com/+zeabrose', 'https://twitter.com/zeabrose', 'https://www.linkedin.com/company/zeabrose', NULL, '2017-03-15 13:33:30', 1),
(4, 'Footer', 'footercontact', 'Lazimpat, Kathmandu, Nepal', '41000000', '+977-1-41100000', 'info@zeabrose.com', 'zeabrose', 'https://facebook.com/zeabrose', 'https://plus.google.com/+zeabrose', 'https://twitter.com/zeabrose', 'https://www.linkedin.com/company/zeabrose', NULL, '2017-04-19 17:08:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `discount_percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event id',
  `event_title` varchar(200) DEFAULT NULL COMMENT 'गतिविधि शीर्षक',
  `event_slug` varchar(200) DEFAULT NULL COMMENT 'गतिविधि ठेगाना स्लग',
  `event_content` text COMMENT 'गतिविधि विवरन',
  `event_image` varchar(200) DEFAULT NULL COMMENT 'गतिविधि तस्बिर ',
  `event_image_width` int(5) DEFAULT NULL,
  `event_image_height` int(5) DEFAULT NULL,
  `event_status` enum('0','1') DEFAULT '0' COMMENT 'गतिविधि (स्थिती) Status',
  `event_date` date DEFAULT NULL COMMENT 'गतिविधि गरिएको मिती',
  `event_created_date` date DEFAULT NULL COMMENT 'गतिविधि लेखिएको मिती',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='सूचना/समाचार' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `event_slug`, `event_content`, `event_image`, `event_image_width`, `event_image_height`, `event_status`, `event_date`, `event_created_date`) VALUES
(1, 'zdzsf', 'f a', '<p>asdf safasf s</p>\r\n\r\n<p>f s</p>\r\n', 'sf', NULL, NULL, '1', '0000-00-00', '0000-00-00'),
(2, '', '', '', '', NULL, NULL, '0', '0000-00-00', '0000-00-00'),
(3, 'af sf sf sfsf', '', '<p>sf dsfsdf sdfsd&nbsp;</p>\r\n', 'files/gallery/1.JPG', 270, 202, '1', '2014-07-22', '2014-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `featured_product`
--

CREATE TABLE IF NOT EXISTS `featured_product` (
  `fp_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`fp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `gallery_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Gallery Id',
  `category_id` int(11) NOT NULL,
  `gallery_title` varchar(200) DEFAULT NULL COMMENT 'फोटो ग्यालरी शीर्षक ',
  `gallery_slug` varchar(200) DEFAULT NULL COMMENT 'फोटो ग्यालरी ठेगाना स्लग ',
  `gallery_content` text COMMENT 'फोटो ग्यालरी विवरन',
  `gallery_height` varchar(32) NOT NULL DEFAULT '',
  `gallery_weight` varchar(32) NOT NULL DEFAULT '',
  `gallery_colors` varchar(50) NOT NULL DEFAULT '',
  `gallery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gallery_image` varchar(200) DEFAULT NULL COMMENT 'फोटो ग्यालरी तस्बिर ',
  `gallery_image_width` int(5) DEFAULT NULL,
  `gallery_image_height` int(5) DEFAULT NULL,
  `gallery_featured` enum('0','1') NOT NULL DEFAULT '0',
  `gallery_new_arrival` enum('0','1') NOT NULL DEFAULT '0',
  `gallery_status` enum('0','1') DEFAULT '0' COMMENT 'फोटो ग्यालरी (स्थिती) Status',
  `gallery_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'फोटो ग्यालरी राखिएको मिती ',
  PRIMARY KEY (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='सूचना/समाचार' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `category_id`, `gallery_title`, `gallery_slug`, `gallery_content`, `gallery_height`, `gallery_weight`, `gallery_colors`, `gallery_price`, `gallery_image`, `gallery_image_width`, `gallery_image_height`, `gallery_featured`, `gallery_new_arrival`, `gallery_status`, `gallery_created_date`) VALUES
(1, 6, 'Product name', '', '', '', '', '', '0.00', 'files/gallery/1.jpg', 250, 250, '0', '1', '1', '2014-07-19 04:00:00'),
(2, 0, 'product name 2', '', '', '', '', '', '0.00', 'files/gallery/2.JPG', 250, 250, '0', '0', '1', '2014-07-20 04:00:00'),
(3, 0, 'Product 3', '', '', '', '', '', '0.00', 'files/gallery/3.jpg', 250, 250, '1', '0', '1', '2016-06-08 04:00:00'),
(4, 0, 'Product name 4', '', '', '', '', '', '0.00', 'files/gallery/4.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(5, 6, 'Product 5', '', '', '', '', '', '0.00', 'files/gallery/5.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(6, 0, 'Product 6', '', '', '', '', '', '0.00', 'files/gallery/6.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(7, 0, 'Product 7', '', 'On the Insert tab, the galleries include items that are designed to coordinate with the overall look of your document. You can use these galleries to insert tables, headers, footers, lists, cover pages, and other document building blocks. When you create pictures, charts, or diagrams, they also coordinate with your current document look.</p>\r\n          <p>You can easily change the formatting of selected text in the document text by choosing a look for the selected text from the Quick Styles gallery on the Home tab. You can also format text directly by using the other controls on the Home tab. Most controls offer a choice of using the look from the current theme or using a format that you specify directly.</p>\r\n          <p>To change the overall look of your document, choose new Theme elements on the Page Layout tab. To change the looks available in the Quick Style gallery, use the Change Current Quick Style Set command. Both the Themes gallery and the Quick Styles gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.', '', '', '', '0.00', 'files/gallery/7.jpg', 250, 250, '1', '0', '1', '2016-06-08 04:00:00'),
(8, 0, 'Product 8', '', '', '', '', '', '0.00', 'files/gallery/8.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(9, 0, 'Product 9', '', '', '', '', '', '0.00', 'files/gallery/9.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(10, 6, 'Product 10', '', '', '', '', '', '0.00', 'files/gallery/10.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(11, 0, 'Product 11', '', '', '', '', '', '0.00', 'files/gallery/11.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00'),
(12, 0, 'Product 12', '', '', '', '', '', '0.00', 'files/gallery/12.jpg', 250, 250, '1', '0', '1', '2016-06-08 04:00:00'),
(13, 0, 'Product 13', '', '', '', '', '', '0.00', 'files/gallery/13.jpg', 250, 250, '0', '0', '1', '2016-06-08 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'News Id',
  `news_title` varchar(200) DEFAULT NULL COMMENT 'सूचना/समाचार शीर्षक',
  `news_slug` varchar(200) DEFAULT NULL COMMENT 'सूचना/समाचार ठेगाना स्लग',
  `news_content` text COMMENT 'सूचना/समाचार विवरन',
  `news_image` varchar(200) DEFAULT NULL COMMENT 'सूचना/समाचार तस्बिर',
  `news_image_width` int(5) DEFAULT NULL,
  `news_image_height` int(5) DEFAULT NULL,
  `news_status` enum('0','1') DEFAULT '0' COMMENT 'सूचना/समाचार (स्थिती) Status',
  `news_date` date DEFAULT NULL COMMENT 'सूचना/समाचार मिती',
  `news_created_date` date DEFAULT NULL COMMENT 'सूचना/समाचार राखिएको मिती',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='सूचना/समाचार' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_slug`, `news_content`, `news_image`, `news_image_width`, `news_image_height`, `news_status`, `news_date`, `news_created_date`) VALUES
(4, 'adsa', 'aaaaa', '<p>sf af a f as</p>\r\n\r\n<p>&nbsp;</p>\r\n', '/freelance/dols/files/news/9.JPG', 72, 70, '1', '2014-07-10', '2014-07-10'),
(5, 'sss this is test new title', '', '<p>Test content</p>\r\n', 'files/page/8.jpg', 270, 202, '1', '2014-07-20', '2014-07-20'),
(6, 'demonstration to teamhub team', 'sf sdf s', '<p>sf</p>\r\n\r\n<p>&nbsp;sf</p>\r\n\r\n<p>&nbsp;s</p>\r\n\r\n<p>f s</p>\r\n', 'files/news/specialnews/coda-2-icon.png', 50, 50, '1', '2014-07-24', '2014-07-24'),
(7, 'ssssss', '', '<p>sdf sfs f&nbsp;</p>\r\n\r\n<p>s f</p>\r\n\r\n<p>sd</p>\r\n', 'news/bulletinnews/Coda-2-Intro.jpg', 30, 30, '0', '2014-07-24', '2014-07-24');

-- --------------------------------------------------------

--
-- Table structure for table `new_arrival`
--

CREATE TABLE IF NOT EXISTS `new_arrival` (
  `na_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`na_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `page_title` varchar(200) DEFAULT NULL COMMENT 'पेज शीर्षक',
  `page_slug` varchar(200) DEFAULT NULL COMMENT 'पेज ठेगाना स्लग',
  `page_content` text COMMENT 'पेज विवरन',
  `page_image` varchar(200) DEFAULT NULL COMMENT 'पेज तस्बिर',
  `page_image_width` int(5) DEFAULT NULL,
  `page_image_height` int(5) DEFAULT NULL,
  `page_status` enum('0','1') DEFAULT '0' COMMENT 'पेज (स्थिती) Status',
  `page_created_date` date DEFAULT NULL COMMENT 'पेज राखिएको मिती',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='सूचना/समाचार' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `page_title`, `page_slug`, `page_content`, `page_image`, `page_image_width`, `page_image_height`, `page_status`, `page_created_date`) VALUES
(1, 'Special Discount', 'special-discount', '<p>15%</p>\r\n', 'files/special-discount/top-banner.jpg', 270, 202, '1', '2016-07-27'),
(2, 'Dealers', 'dealers', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n', '', 270, 202, '1', '2016-06-10'),
(3, 'Career', 'career', '<p>Career contents goes here</p>\r\n', '', 270, 202, '1', '2016-05-30'),
(4, 'About Us', 'about-us', '<p>On the Insert tab, the galleries include items that are designed to coordinate with the overall look of your document. You can use these galleries to insert tables, headers, footers, lists, cover pages, and other document building blocks. When you create pictures, charts, or diagrams, they also coordinate with your current document look.</p>\r\n\r\n<p>You can easily change the formatting of selected text in the document text by choosing a look for the selected text from the Quick Styles gallery on the Home tab. You can also format text directly by using the other controls on the Home tab. Most controls offer a choice of using the look from the current theme or using a format that you specify directly.</p>\r\n\r\n<p>To change the overall look of your document, choose new Theme elements on the Page Layout tab. To change the looks available in the Quick Style gallery, use the Change Current Quick Style Set command. Both the Themes gallery and the Quick Styles gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.</p>\r\n\r\n<h2>Heading Second</h2>\r\n\r\n<p>You can easily change the formatting of selected text in the document text by choosing a look for the selected text from the Quick Styles gallery on the Home tab. You can also format text directly by using the other controls on the Home tab. Most controls offer a choice of using the look from the current theme or using a format that you specify directly.</p>\r\n\r\n<p>To change the overall look of your document, choose new Theme elements on the Page Layout tab. To change the looks available in the Quick Style gallery, use the Change Current Quick Style Set command. Both the Themes gallery and the Quick Styles gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.</p>\r\n', 'files/page/logo-about.jpg', 340, 305, '1', '2016-07-27'),
(5, 'Services', 'service-center', '<p>sfsd</p>\r\n', '', 270, 202, '1', '2016-05-30'),
(6, 'References', 'references', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\r\n', '', 270, 202, '1', '2016-06-03'),
(7, 'Test Pages', 'service-centers-on-map', '', '', 270, 202, '1', '2016-05-30'),
(8, 'Product sizes', 'product-size', '<p><strong>Products Size</strong></p>\r\n\r\n<ul class="normal-list">\r\n	<li>1ft x 2ft x 0.4 inch<br />\r\n	30 x 60 x 10 (cm)</li>\r\n	<li>1ft x 2ft x 0.6 inch<br />\r\n	30 x 60 x 15 (cm)</li>\r\n	<li>1ft x 2ft x 0.8 inch<br />\r\n	30 x 60 x 20 (cm)</li>\r\n</ul>\r\n', '', 270, 202, '1', '2016-06-03'),
(9, 'Welcome', 'welcome', '<p>Zeab Rose is an endeavor towards building an eco-conscious society where nature and future can grow harmoniously. Modern day construction practices take many points in to consideration. While aesthetic and strength are the prime factors, products are also judged on the attributes such as.</p>\r\n', 'news/470081625.jpg', 270, 202, '1', '2016-07-27'),
(10, 'For Developers', 'for-developers', '<ul class="normal-list">\r\n            <li>Very light density</li>\r\n            <li>Good sound transmission</li>\r\n            <li>Excellent thermal resistance</li>\r\n            <li>Short construction time</li>\r\n            <li>Low maintenance cost</li>\r\n            <li>Accurate in size</li>\r\n            <li>Solid walls</li>\r\n          </ul>', '', 270, 202, '1', '2016-06-08'),
(11, 'For Owners', 'for-owners', '<ul class="normal-list">\r\n            <li>Strong structural ability</li>\r\n            <li>Fire and vermin resistance</li>\r\n            <li>Insect and termite proof</li>\r\n            <li>Unique architectural structure</li>\r\n            <li>Structures are safe, sound and functional</li>\r\n            <li>Durability and dimensional stability</li>\r\n            <li>Energy efficient</li>\r\n            <li>Low maintenance</li>\r\n            <li>Environmental friendly</li>\r\n            <li>Solid investment</li>\r\n            <li>High standard living</li>\r\n            <li>Reduces noise pollution</li>\r\n            <li>Improves indoor air quality</li>\r\n          </ul>', '', 270, 202, '0', '2016-06-08'),
(12, 'For Contractors', 'for-contractors', '<ul class="normal-list">\r\n            <li>Construction process is quick and easy</li>\r\n            <li>Product is light weight and easy to handle</li>\r\n            <li>Fast and efficient workability</li>\r\n            <li>It produces less waste</li>\r\n            <li>Increase in productivity</li>\r\n            <li>Ease in handling</li>\r\n          </ul>', '', 270, 202, '1', '2016-06-08'),
(13, 'For Engineers', 'for-engineers', '<div class="left-side">\r\n          <ul class="normal-list">\r\n            <li>Highly adaptable construction material</li>\r\n            <li>Unique architectural structure</li>\r\n            <li>Easy to work with</li>\r\n            <li>It can be cut and shaped with hand tools</li>\r\n            <li>Flexibility in innovative designs externally and internally</li>\r\n          </ul>\r\n          <h2>Autoclaved aerated concrete (AAC)</h2>\r\n          <p>Autoclaved aerated concrete, or AAC, is concrete that has been manufactured to contain lots of closed air pockets. Lightweight and fairly energy efficient, it is produced by adding a foaming agent to concrete in a mold, then wire-cutting  blocks or panels from the resulting ‘cake’ and ‘cooking’ them with steam (autoclaving).</p>\r\n          <p><strong>Aerated Concrete Blocks</strong> <strong>-&nbsp;AAC </strong>is produced from the common materials lime, sand, cement and water, and a small amount of rising agent. After mixing and molding, it is then <strong>autoclaved</strong> under heat and pressure to create its unique properties. <strong>AAC </strong>has excellent thermal insulation and acoustic absorption properties. AAC is fire and pest resistant, and is economically and environmentally superior to the more traditional structural building materials such as <strong>concrete</strong>, wood, brick and stone. It has moderate embodied energy content and performs well as thermal and sound insulation, due to the aerated structure of the material and its unique combination of thermal insulation and thermal mass. It is light, does not burn, is an excellent fire barrier, and is able to support quite large loads. Blocks are made to very exacting dimensions and are usually laid in thin-bed mortar that is applied with a toothed trowel, although more conventional thick-bed mortar can be used. Wall panels are storey height, reinforced and mechanically fixed. AAC can also be used in panel form for floor and roof construction. It has a long life and does not produce toxic gases after it has been put in place.</p>\r\n          <p><strong>Benefits of AAC</strong></p>\r\n          <ul class="normal-list">\r\n            <li>It uses less material--important for concrete, since portland cement is one of the most energy- and carbon-intensive building materials.</li>\r\n            <li>Despite the energy-intensive autoclaving process, takes about 50% less energy to make, because of the lower portland cement content by volume.</li>\r\n            <li>It''s lighter, which cuts down on transportation costs and fuel use.</li>\r\n            <li>It''s a better insulator, with a steady-state R-value just a hair above R-1 as opposed to something more like R-0.2 (neither of these factors in thermal mass, which we''ll get to later).</li>\r\n            <li>Air leakage is minimal.</li>\r\n            <li>AAC also has excellent soundproofing properties.</li>\r\n          </ul>\r\n          <p><strong>Green building</strong></p>\r\n          <ul class="normal-list">\r\n            <li>Eco-friendly</li>\r\n            <li>Recyclable, inert and non-toxic.</li>\r\n            <li>Energy saving, manufacturing through occupancy.</li>\r\n            <li>Excellent life-cycle cost</li>\r\n            <li>Durable, natural finish options.</li>\r\n            <li> Supports LEED credits.</li>\r\n          </ul>\r\n          <p><img class="img-responsive" alt="AAC" src="/freelance/bhutanecolite/files/page/data-aac.jpg"></p>\r\n          <p>Source: febecel handbook 2000, le beton cellulaire- materiau d avenir p.32</p>\r\n          <h2>Production</h2>\r\n          <p>Thanks to continuous efficiency improvements, production of AAC demands relatively small amounts of raw materials per m3 of product, and up to a fifth as much as other construction products. No raw materials are wasted in the production process and all production offcuts are fed back into the production circuit. The small amount of surplus material left over after curing is ground and recovered for other uses.</p>\r\n          <p>The manufacture of AAC requires less energy than for all other masonry products, thereby reducing use of fossil fuels and associated emissions of carbon dioxide (CO2). Energy is also saved in the curing process since steam curing is carried out at relatively low temperatures and the hot steam generated in the autoclaves is reused for subsequent batches. Industrial-quality water is used and neither water nor steams are released into the environment. No toxic gases are created in the production process.</p>\r\n        </div>', '', 270, 202, '1', '2016-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_position` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0: no position (Do not display), 1: footer first column, 2: footer second column, 3: footer third column, 4: top header, ',
  `menu_order` tinyint(3) DEFAULT '0',
  `menu_text` varchar(32) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(100) NOT NULL DEFAULT '',
  `page_heading` varchar(100) DEFAULT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `banner_heading` varchar(100) DEFAULT NULL,
  `banner_sub_heading` varchar(255) DEFAULT NULL,
  `page_content` text,
  `page_excerpt` text,
  `meta_title` text,
  `meta_keywords` text,
  `meta_description` text,
  `meta_head` text,
  `image` varchar(100) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `menu_position`, `menu_order`, `menu_text`, `title`, `slug`, `page_heading`, `sub_heading`, `banner_heading`, `banner_sub_heading`, `page_content`, `page_excerpt`, `meta_title`, `meta_keywords`, `meta_description`, `meta_head`, `image`, `image_alt`, `image_title`, `created_at`, `updated_at`, `status`) VALUES
(1, '1', 1, 'About Us', 'About Us', 'about-us', 'About Us', NULL, 'About Us', NULL, '<p><img alt="Zeab Rose" src="/assets/images/logo-about.jpg" style="float:left; margin:5px 20px 5px 0px" />Zeabrose started in the early 90&#39;s&nbsp;when everybody wanted everything in leather and synthetic leather didn&#39;t exist and&nbsp;hadn&#39;t ruined the market with well, cheap stuff. However, that never bothered us, we know that&nbsp;leather can never be replaced, be it a wallet, a jacket, a bag or even the seat covers in our&nbsp;luxury cars, if it is not&nbsp;leather it does not&nbsp;feel special.&nbsp;At Zeabrose, we&nbsp;only work with Genuine leather&nbsp;since its&nbsp;pretigious touch and scent has the potential for&nbsp;creating obsession. We are obsesed with&nbsp;leather and so are our customers! It&#39;s in human&nbsp;nature, aren&#39;t we all&nbsp;attracted to skin afterall! Being from the &#39;Leather&#39; era we assure there is no compromise on the quality of our craftsmanship and the precision of our techniques. We expect our customers to have personal feelings and values for the products they make&nbsp;from us<strong>.&nbsp;</strong>We take the satisfaction of our customers seriously and&nbsp;we offer to fulfil customised bespoke orders. Its an addictive process really,&nbsp;choosing your design, your&nbsp;skin, the inside lining, the hardware&nbsp;and then seeing it all become a real product. They do it over and over again.&nbsp;We truely&nbsp;believe that our personal belongings deserve to be thoughtfully designed with soul and purpose while expressing beauty and authenticity.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Our Story</h2>\r\n\r\n<p>We are manufacturers, exporters and retailers of genuine Leather products and we&nbsp;also work with Pashmina,&nbsp;Canvas and Dhaka.<br />\r\nWe produce for the following&nbsp;industries :-<br />\r\n- Leather Guarments (Biker Jackets, Bomber Jackets, Blazers, Formal Coats, Trench Coats, Sleeveless Vests, Fur Coats,&nbsp;Skirts, Pants and Shirts for all sexes)<br />\r\n- Accessories ( Laptop Bags, Corporate File Bags, Messenger Bags, Ladies Hand Bags, Tote Bags, Travel Bags, Money Purse,&nbsp;Laptop Sleeves, Tablet Sleeves, Shaving Kits, Cosmetic Kit, Phone Covers, Wallets, Money Clipper, Coat Wallet&nbsp;and Belts&nbsp;for all sexes)</p>\r\n\r\n<p>- Miscellaneous ( cushion covers, bean bags, tie, restaurant menu covers)</p>', 'On the Insert tab, the galleries include items that are designed to coordinate with the overall look of your document. You can use these galleries to insert tables, headers, footers, lists, cover pages, and other document building blocks. When you create pictures, charts, or diagrams, they also coordinate with your current document look.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-26 13:36:06', '2017-04-22 18:17:05', 1),
(12, '1', 1, 'Contact Us', 'Contact Us', 'contact-us', 'Contact Us', '', '', '', '', NULL, 'Contact Us - Broadway Infosys Nepal', 'contact broadway infosys nepal, how to contact broadway infosys nepal, contact number broadway infosys nepal', 'Contact Broadway Infosys Nepal. Our phone numbers are - +977-01-4117578 & 4111849. Our email address is: info@broadwayinfosysnepal.com.', '', NULL, '', '', '2016-10-27 15:43:02', '2017-03-23 20:10:13', 1),
(13, '0', NULL, NULL, 'WELCOME', 'welcome', 'WELCOME TO ZEAB ROSE', NULL, NULL, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently.</p>', NULL, 'WELCOME TO ZEAB ROSE', NULL, NULL, NULL, NULL, NULL, NULL, '2017-04-16 09:24:33', '2017-04-16 09:24:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Gallery Id',
  `category_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT 'फोटो ग्यालरी शीर्षक ',
  `slug` varchar(200) DEFAULT NULL COMMENT 'फोटो ग्यालरी ठेगाना स्लग ',
  `content` text COMMENT 'फोटो ग्यालरी विवरन',
  `height` varchar(32) DEFAULT '',
  `weight` varchar(32) DEFAULT '',
  `colors` varchar(50) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `image` varchar(200) DEFAULT NULL COMMENT 'फोटो ग्यालरी तस्बिर ',
  `image_title` varchar(200) DEFAULT NULL,
  `image_alt` varchar(200) DEFAULT NULL,
  `image_width` int(5) DEFAULT NULL,
  `image_height` int(5) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `new_arrival` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'फोटो ग्यालरी राखिएको मिती ',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='सूचना/समाचार' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `slug`, `content`, `height`, `weight`, `colors`, `price`, `image`, `image_title`, `image_alt`, `image_width`, `image_height`, `featured`, `new_arrival`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'Product name', '', '', '', '', '', '0.00', 'files/gallery/1.jpg', NULL, NULL, 250, 250, 1, 2, 1, '2014-07-19 04:00:00', NULL),
(2, 0, 'product name 2', '', '', '', '', '', '0.00', 'files/gallery/2.JPG', NULL, NULL, 250, 250, 1, 1, 1, '2014-07-20 04:00:00', NULL),
(3, 0, 'Product 3', '', '', '', '', '', '0.00', 'files/gallery/3.jpg', NULL, NULL, 250, 250, 2, 1, 1, '2016-06-08 04:00:00', NULL),
(4, 0, 'Product name 4', '', '', '', '', '', '0.00', 'files/gallery/4.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(5, 6, 'Product 5', '', '', '', '', '', '0.00', 'files/gallery/5.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(6, 0, 'Product 6', '', '', '', '', '', '0.00', 'files/gallery/6.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(7, 0, 'Product 7', '', 'On the Insert tab, the galleries include items that are designed to coordinate with the overall look of your document. You can use these galleries to insert tables, headers, footers, lists, cover pages, and other document building blocks. When you create pictures, charts, or diagrams, they also coordinate with your current document look.</p>\r\n          <p>You can easily change the formatting of selected text in the document text by choosing a look for the selected text from the Quick Styles gallery on the Home tab. You can also format text directly by using the other controls on the Home tab. Most controls offer a choice of using the look from the current theme or using a format that you specify directly.</p>\r\n          <p>To change the overall look of your document, choose new Theme elements on the Page Layout tab. To change the looks available in the Quick Style gallery, use the Change Current Quick Style Set command. Both the Themes gallery and the Quick Styles gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.', '', '', '', '0.00', 'files/gallery/7.jpg', NULL, NULL, 250, 250, 2, 1, 1, '2016-06-08 04:00:00', NULL),
(8, 0, 'Product 8', '', '', '', '', '', '0.00', 'files/gallery/8.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(9, 0, 'Product 9', '', '', '', '', '', '0.00', 'files/gallery/9.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(10, 6, 'Product 10', '', '', '', '', '', '0.00', 'files/gallery/10.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(11, 0, 'Product 11', '', '', '', '', '', '0.00', 'files/gallery/11.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(12, 0, 'Product 12', '', '', '', '', '', '0.00', 'files/gallery/12.jpg', NULL, NULL, 250, 250, 2, 1, 1, '2016-06-08 04:00:00', NULL),
(13, 0, 'Product 13', '', '', '', '', '', '0.00', 'files/gallery/13.jpg', NULL, NULL, 250, 250, 1, 1, 1, '2016-06-08 04:00:00', NULL),
(14, 1, 'title test', 'title test', '<p>&nbsp;</p>\r\n\r\n<p>sf</p>\r\n\r\n<p>sdf</p>\r\n\r\n<p>sdf</p>\r\n\r\n<p>sdf</p>\r\n\r\n<p>&nbsp;</p>', '345', '45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-04-20 13:18:59', '2017-04-20 13:19:44'),
(15, 3, 'pash tsdf sd', 'pash-sdf-sdf', '<p>sdvf</p>\r\n\r\n<p>dsf</p>\r\n\r\n<p>sd</p>\r\n\r\n<p>f</p>', '33434', '232', NULL, NULL, '/files/product/1492680830.jpg', 'sdfsd', 'fsdf', NULL, NULL, NULL, 1, 1, '2017-04-20 13:33:50', '2017-04-20 13:33:50'),
(16, 28, 'Test product', 'test-product', '<p>f</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>sdf</p>\r\n\r\n<p>s fsdf dsf</p>\r\n\r\n<p>sdf</p>\r\n\r\n<p>&nbsp;</p>', '343', '434', NULL, NULL, '/files/product/1492681345.png', 'sfs', 'sdfsd', NULL, NULL, NULL, 1, 1, '2017-04-20 13:42:25', '2017-04-20 13:42:25'),
(17, 7, 'Leather Biker Jacket', 'Leather Biker Jacket', '<p>Gents Leather biker jacket with buckle</p>', NULL, NULL, NULL, NULL, '/files/product/1492770375.jpg', 'Biker Jacket', 'Biker Jacket', NULL, NULL, NULL, 1, 1, '2017-04-21 14:26:15', '2017-04-21 14:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: active, 0: inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `title`, `value`, `created_at`, `updated_at`, `status`) VALUES
(1, 'facebook', 'Facebok Page', 'http://facebook.com/zeabrose', NULL, '2017-04-09 06:13:20', 1),
(2, 'twitter', 'Twitter Page', 'http://twitter.com/zeabrose', NULL, '2017-04-09 06:13:57', 1),
(3, 'googleplus', 'Google Plus Page', 'http://plus.google.com/+zeabrose', NULL, '2017-04-09 06:14:04', 1),
(4, 'infoemail', 'Info Email', 'zeabrose@gmail.com', NULL, '2017-04-20 13:54:05', 1),
(5, 'mobile', 'Mobile', '+977-982342342', NULL, '2017-04-09 06:14:26', 1),
(6, 'phone', 'Phone', '+977-1-534534535', NULL, '2017-04-09 06:14:30', 1),
(7, 'supportemail', 'Support Email', 'support@zeabrose.com', NULL, '2017-04-09 06:14:37', 1),
(8, 'body_script', 'Body Scripts', '<script></script>', NULL, '2017-04-09 06:14:49', 1),
(9, 'head_script', 'Head Scripts', '<script></script>', NULL, '2017-04-09 06:14:58', 1),
(10, 'google_analytics', 'Google Analytics Script', '<script>zeabrose google analytics script goes here</script>', NULL, '2017-04-09 06:15:25', 1),
(11, 'skype', 'Skype', 'zeabrose skype', '2017-03-08 05:35:30', '2017-04-09 06:15:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings1`
--

CREATE TABLE IF NOT EXISTS `settings1` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(50) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` varchar(200) NOT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `settings1`
--

INSERT INTO `settings1` (`setting_id`, `setting_name`, `setting_key`, `setting_value`) VALUES
(1, 'Facebook', 'facebook', 'https://www.facebook.com/zeabrose'),
(2, 'Twitter', 'twitter', 'twitter'),
(3, 'Google Plus', 'gplus', 'google.plus'),
(4, 'Info Email', 'infoemail', 'info@zeabrose.com'),
(5, 'Phone', 'phone', ' +977-1-444444'),
(6, 'We chat', 'wechat', '+984-000000'),
(7, 'Viber', 'viber', '+984-000000'),
(8, 'Whatsapp', 'whatsapp', '+984-000000'),
(9, 'City', 'city', 'Ktm'),
(10, 'State', 'state', 'Bagmati'),
(11, 'Zip Code', 'zip', '44600');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `caption`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Walletssss', 'files/slider/2.jpg', 1, '0000-00-00 00:00:00', NULL),
(2, 'Belt', 'files/slider/2.jpg', 1, '0000-00-00 00:00:00', NULL),
(3, 'Bag', 'files/slider/3.jpg', 1, '0000-00-00 00:00:00', NULL),
(4, 'Bags', 'files/slider/4.jpg', 1, '0000-00-00 00:00:00', NULL),
(5, 'Leather bag', 'files/slider/5.jpg', 1, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `special`
--

CREATE TABLE IF NOT EXISTS `special` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT '' COMMENT 'banner image if any',
  `title` varchar(100) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `special`
--

INSERT INTO `special` (`id`, `product_id`, `image`, `title`, `discount`, `created_at`, `updated_at`) VALUES
(1, 13, '/assets/images/top-banner.jpg', 'Teej Special Discount', '5%', '2017-04-19 09:17:43', '2017-04-19 09:17:43'),
(2, 16, '/files/special/1492681637.jpeg', 'Teej Special', NULL, '2017-04-20 13:47:17', '2017-04-20 13:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$K/BlHKe/gHgK9Y73f9tOxODc3um.fALXY4FGwj848JiwcVPZ.DkDO', 'sNIxLkxBiWlJYRyyi31BEsfryTf7A6eb9MEVmlO3RwlwqniPFladOG63IY7Y', '2017-04-08 15:07:45', '2017-04-08 15:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE IF NOT EXISTS `users1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fname` varchar(32) NOT NULL,
  `lname` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users1`
--

INSERT INTO `users1` (`id`, `username`, `password`, `fname`, `lname`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
