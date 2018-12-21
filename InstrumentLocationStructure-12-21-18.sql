# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: yawl.pmel.noaa.gov (MySQL 5.5.62-MariaDB)
# Database: test_DAW_InstrumentLocation
# Generation Time: 2018-12-21 16:34:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table History
# ------------------------------------------------------------

CREATE TABLE `History` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inst_id` int(10) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  `label_id` tinyint(3) unsigned NOT NULL,
  `txt` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`inst_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table Label
# ------------------------------------------------------------

CREATE TABLE `Label` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `txt` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `Label` WRITE;
/*!40000 ALTER TABLE `Label` DISABLE KEYS */;

INSERT INTO `Label` (`id`, `txt`)
VALUES
	(1,'PMEL'),
	(2,'CALIBRATION'),
	(3,'INBOUND'),
	(4,'OUTBOUND'),
	(5,'LOST'),
	(6,'RETIRED'),
	(7,'DEPLOYED'),
	(8,'UNKNOWN');

/*!40000 ALTER TABLE `Label` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
