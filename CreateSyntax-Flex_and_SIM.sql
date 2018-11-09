-- Drop tables if exists
DROP TABLE IF EXISTS `ControllersInfo`;
DROP TABLE IF EXISTS `ControllersOptions`;
DROP TABLE IF EXISTS `FlexConfig`;
DROP TABLE IF EXISTS `FlexFaceplatesInfo`;
DROP TABLE IF EXISTS `FlexFixes`;
DROP TABLE IF EXISTS `SIMInfo`;
DROP TABLE IF EXISTS `SIMConfig`;

-- ControllersInfo
CREATE TABLE `ControllersInfo` (
  `inst_id` int(10) unsigned NOT NULL,
  `sn` varchar(12) NOT NULL DEFAULT '',
  `dt` datetime NOT NULL,
  `prop` varchar(12) DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`inst_id`),
  UNIQUE KEY `type` (`type_id`,`inst_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ControllerOptions + content
CREATE TABLE `ControllersOptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` enum('ct_type','call','card','fixes') NOT NULL,
  `txt` varchar(20) NOT NULL,
  PRIMARY KEY (`key`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
VALUES
	(1,'ct_type','TFLEX'),
	(2,'ct_type','FLEX Box'),
	(1,'fixes','No'),
	(2,'fixes','Yes'),
	(1,'card','2GB'),
	(2,'card','128MB');

-- FlexConfig
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

-- FlexFaceplates
CREATE TABLE `FlexFaceplatesInfo` (
  `inst_id` int(10) unsigned NOT NULL,
  `sn` varchar(12) NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`inst_id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- FlexFixes
CREATE TABLE `FlexFixes` (
  `inst_id` int(10) unsigned NOT NULL,
  `met_ic` int(10) NOT NULL DEFAULT '1',
  `solder_cpu_jp24` int(10) NOT NULL DEFAULT '1',
  `cpu_r4_887` int(10) NOT NULL DEFAULT '1',
  `rain_gnd` int(10) NOT NULL DEFAULT '1',
  `ss_standoff` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`inst_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- SIMInfo
CREATE TABLE `SIMInfo` (
  `inst_id` int(10) unsigned NOT NULL,
  `iccid` int(11) unsigned NOT NULL,
  `data_num` bigint(12) unsigned NOT NULL,
  `voice_num` bigint(12) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`inst_id`),
  UNIQUE KEY `iccid` (`iccid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- SIMConfig
CREATE TABLE `SIMConfig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inst_id` int(10) unsigned NOT NULL,
  `dt` datetime NOT NULL,
  `proj_id` int(10) unsigned NOT NULL,
  `active` int(10) unsigned NOT NULL,
  `system_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`inst_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;