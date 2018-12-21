# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: yawl.pmel.noaa.gov (MySQL 5.5.62-MariaDB)
# Database: test_DAW_FlexSystems
# Generation Time: 2018-12-21 16:35:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ControllersInfo
# ------------------------------------------------------------

CREATE TABLE `ControllersInfo` (
  `inst_id` int(10) unsigned NOT NULL,
  `sn` varchar(12) NOT NULL DEFAULT '',
  `dt` datetime NOT NULL,
  `prop` varchar(12) DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`inst_id`),
  UNIQUE KEY `type` (`type_id`,`inst_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ControllersOptions
# ------------------------------------------------------------

CREATE TABLE `ControllersOptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` enum('ctype','call','card','fixes','firm','active') NOT NULL DEFAULT 'ctype',
  `txt` varchar(20) NOT NULL,
  PRIMARY KEY (`key`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ControllersOptions` WRITE;
/*!40000 ALTER TABLE `ControllersOptions` DISABLE KEYS */;

INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
VALUES
	(1,'ctype','TFLEX'),
	(2,'ctype','FLEX Box'),
	(1,'fixes','No'),
	(2,'fixes','Yes'),
	(1,'card','2GB'),
	(2,'card','128MB'),
	(1,'active','Active'),
	(2,'active','Inactive'),
	(1,'call','00:01'),
	(2,'call','00:02'),
	(3,'call','00:03'),
	(4,'call','00:04'),
	(5,'call','00:05'),
	(6,'call','00:06'),
	(7,'call','00:07'),
	(8,'call','00:08'),
	(9,'call','00:09'),
	(10,'call','00:10'),
	(11,'call','00:11'),
	(12,'call','00:12'),
	(13,'call','00:13'),
	(14,'call','00:14'),
	(15,'call','00:15'),
	(16,'call','00:16'),
	(17,'call','00:17'),
	(18,'call','00:18'),
	(19,'call','00:19'),
	(20,'call','00:20'),
	(21,'call','00:21'),
	(22,'call','00:22'),
	(23,'call','00:23'),
	(24,'call','00:24'),
	(25,'call','00:25'),
	(26,'call','00:26'),
	(27,'call','00:27'),
	(28,'call','00:28'),
	(29,'call','00:29'),
	(30,'call','00:30'),
	(31,'call','00:31'),
	(32,'call','00:32'),
	(33,'call','00:33'),
	(34,'call','00:34'),
	(35,'call','00:35'),
	(36,'call','00:36'),
	(37,'call','00:37'),
	(38,'call','00:38'),
	(39,'call','00:39'),
	(40,'call','00:40'),
	(41,'call','00:41'),
	(42,'call','00:42'),
	(43,'call','00:43'),
	(44,'call','00:44'),
	(45,'call','00:45'),
	(46,'call','00:46'),
	(47,'call','00:47'),
	(48,'call','00:48'),
	(49,'call','00:49'),
	(50,'call','00:50'),
	(51,'call','00:51'),
	(52,'call','00:52'),
	(53,'call','00:53'),
	(54,'call','00:54'),
	(55,'call','00:55'),
	(56,'call','00:56'),
	(57,'call','00:57'),
	(58,'call','00:58'),
	(59,'call','00:59'),
	(1,'firm','2.01,170530'),
	(2,'firm','1.12,150313'),
	(3,'firm','1.12,130225'),
	(4,'firm','1.12,130816'),
	(5,'firm','1.12,140211'),
	(6,'firm','1.16,161014');

/*!40000 ALTER TABLE `ControllersOptions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table FlexConfig
# ------------------------------------------------------------

CREATE TABLE `FlexConfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inst_id` int(10) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  `proj_id` int(10) unsigned NOT NULL,
  `iridium_proj` varchar(12) DEFAULT NULL,
  `platform_id` varchar(12) DEFAULT NULL,
  `rf_id` varchar(12) DEFAULT NULL,
  `firmware` int(10) DEFAULT NULL,
  `sim_id` int(10) unsigned DEFAULT NULL,
  `first_call` int(10) DEFAULT NULL,
  `flash_card` int(10) unsigned DEFAULT NULL,
  `fcplt_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`inst_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table FlexFaceplatesInfo
# ------------------------------------------------------------

CREATE TABLE `FlexFaceplatesInfo` (
  `inst_id` int(10) unsigned NOT NULL,
  `sn` varchar(12) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`inst_id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table FlexFixes
# ------------------------------------------------------------

CREATE TABLE `FlexFixes` (
  `inst_id` int(10) unsigned NOT NULL,
  `met_ic` int(10) NOT NULL DEFAULT '1',
  `solder_cpu_jp24` int(10) NOT NULL DEFAULT '1',
  `cpu_r4_887` int(10) NOT NULL DEFAULT '1',
  `rain_gnd` int(10) NOT NULL DEFAULT '1',
  `ss_standoff` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table InstrumentHist
# ------------------------------------------------------------

CREATE TABLE `InstrumentHist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inst_id` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `txt` text NOT NULL,
  PRIMARY KEY (`inst_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table Options
# ------------------------------------------------------------

CREATE TABLE `Options` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `key` enum('owner','proj') NOT NULL,
  `txt` varchar(12) NOT NULL,
  PRIMARY KEY (`key`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `Options` WRITE;
/*!40000 ALTER TABLE `Options` DISABLE KEYS */;

INSERT INTO `Options` (`id`, `key`, `txt`)
VALUES
	(1,'owner','PMEL'),
	(2,'owner','AOML'),
	(3,'owner','EU AtlantOS'),
	(1,'proj','GTMBA'),
	(2,'proj','OCS'),
	(3,'proj','FOCI'),
	(4,'proj','EDD');

/*!40000 ALTER TABLE `Options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SIMConfig
# ------------------------------------------------------------

CREATE TABLE `SIMConfig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inst_id` int(10) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  `proj_id` int(10) unsigned NOT NULL,
  `active` int(10) unsigned NOT NULL,
  `system_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`inst_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table SIMInfo
# ------------------------------------------------------------

CREATE TABLE `SIMInfo` (
  `inst_id` int(10) unsigned NOT NULL,
  `iccid` bigint(12) unsigned NOT NULL,
  `data_num` bigint(12) unsigned NOT NULL,
  `voice_num` bigint(12) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`inst_id`),
  UNIQUE KEY `iccid` (`iccid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
