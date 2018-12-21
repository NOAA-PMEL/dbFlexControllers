/* DB/mksql.py */;
/* DATA/mksql.py */
USE `test_DAW_FlexSystems`;
DROP TABLE IF EXISTS `ControllersInfo`; DROP TABLE IF EXISTS `ControllersOptions`; DROP TABLE IF EXISTS `FlexConfig`; DROP TABLE IF EXISTS `FlexFaceplatesInfo`; DROP TABLE IF EXISTS `FlexFixes`; DROP TABLE IF EXISTS `SIMInfo`; DROP TABLE IF EXISTS `SIMConfig`;
CREATE TABLE `ControllersInfo` ( `inst_id` int(10) unsigned NOT NULL, `sn` varchar(12) NOT NULL DEFAULT '', `dt` datetime NOT NULL, `prop` varchar(12) DEFAULT NULL, `type_id` int(10) unsigned NOT NULL, PRIMARY KEY (`inst_id`), UNIQUE KEY `type` (`type_id`,`inst_id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `ControllersOptions` ( `id` int(11) unsigned NOT NULL AUTO_INCREMENT, `key` enum('ctype','call','card','fixes','firm','active') NOT NULL DEFAULT 'ctype', `txt` varchar(20) NOT NULL, PRIMARY KEY (`key`,`id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `FlexConfig` ( `id` int(10) unsigned NOT NULL AUTO_INCREMENT, `inst_id` int(10) unsigned NOT NULL, `dt` datetime NOT NULL, `proj_id` int(10) unsigned NOT NULL, `iridium_proj` varchar(12) DEFAULT NULL, `platform_id` varchar(12) DEFAULT NULL, `rf_id` varchar(12) DEFAULT NULL, `firmware` int(10) DEFAULT NULL, `sim_id` int(10) unsigned DEFAULT NULL, `first_call` int(10) DEFAULT NULL, `flash_card` int(10) unsigned DEFAULT NULL, `fcplt_id` int(10) unsigned DEFAULT NULL, PRIMARY KEY (`inst_id`,`id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `FlexFaceplatesInfo` ( `inst_id` int(10) unsigned NOT NULL, `sn` varchar(12) NOT NULL, `status_id` int(10) unsigned NOT NULL, PRIMARY KEY (`inst_id`), UNIQUE KEY `sn` (`sn`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `FlexFixes` ( `inst_id` int(10) unsigned NOT NULL, `met_ic` int(10) NOT NULL DEFAULT '1', `solder_cpu_jp24` int(10) NOT NULL DEFAULT '1', `cpu_r4_887` int(10) NOT NULL DEFAULT '1', `rain_gnd` int(10) NOT NULL DEFAULT '1', `ss_standoff` int(10) NOT NULL DEFAULT '1', PRIMARY KEY (`inst_id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `SIMInfo` ( `inst_id` int(10) unsigned NOT NULL, `iccid` bigint(12) unsigned NOT NULL, `data_num` bigint(12) unsigned NOT NULL, `voice_num` bigint(12) unsigned NOT NULL, `dt` datetime NOT NULL, PRIMARY KEY (`inst_id`), UNIQUE KEY `iccid` (`iccid`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `SIMConfig` ( `id` int(11) unsigned NOT NULL AUTO_INCREMENT, `inst_id` int(10) unsigned NOT NULL, `dt` datetime NOT NULL, `proj_id` int(10) unsigned NOT NULL, `active` int(10) unsigned NOT NULL, `system_id` int(10) DEFAULT NULL, PRIMARY KEY (`inst_id`,`id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (1,'ctype','TFLEX'), (2,'ctype','FLEX Box'), (1,'fixes','No'), (2,'fixes','Yes'), (1,'card','2GB'), (2,'card','128MB'), (1,'active','Active'), (2,'active','Inactive'),
(NULL,'call','00:01'),
(NULL,'call','00:02'),
(NULL,'call','00:03'),
(NULL,'call','00:04'),
(NULL,'call','00:05'),
(NULL,'call','00:06'),
(NULL,'call','00:07'),
(NULL,'call','00:08'),
(NULL,'call','00:09'),
(NULL,'call','00:10'),
(NULL,'call','00:11'),
(NULL,'call','00:12'),
(NULL,'call','00:13'),
(NULL,'call','00:14'),
(NULL,'call','00:15'),
(NULL,'call','00:16'),
(NULL,'call','00:17'),
(NULL,'call','00:18'),
(NULL,'call','00:19'),
(NULL,'call','00:20'),
(NULL,'call','00:21'),
(NULL,'call','00:22'),
(NULL,'call','00:23'),
(NULL,'call','00:24'),
(NULL,'call','00:25'),
(NULL,'call','00:26'),
(NULL,'call','00:27'),
(NULL,'call','00:28'),
(NULL,'call','00:29'),
(NULL,'call','00:30'),
(NULL,'call','00:31'),
(NULL,'call','00:32'),
(NULL,'call','00:33'),
(NULL,'call','00:34'),
(NULL,'call','00:35'),
(NULL,'call','00:36'),
(NULL,'call','00:37'),
(NULL,'call','00:38'),
(NULL,'call','00:39'),
(NULL,'call','00:40'),
(NULL,'call','00:41'),
(NULL,'call','00:42'),
(NULL,'call','00:43'),
(NULL,'call','00:44'),
(NULL,'call','00:45'),
(NULL,'call','00:46'),
(NULL,'call','00:47'),
(NULL,'call','00:48'),
(NULL,'call','00:49'),
(NULL,'call','00:50'),
(NULL,'call','00:51'),
(NULL,'call','00:52'),
(NULL,'call','00:53'),
(NULL,'call','00:54'),
(NULL,'call','00:55'),
(NULL,'call','00:56'),
(NULL,'call','00:57'),
(NULL,'call','00:58'),
(NULL,'call','00:59');
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (NULL,'firm','2.01,170530');
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (NULL,'firm','1.12,150313');
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (NULL,'firm','1.12,130225');
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (NULL,'firm','1.12,130816');
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (NULL,'firm','1.12,140211');
INSERT INTO `ControllersOptions` (`id`, `key`, `txt`) VALUES (NULL,'firm','1.16,161014');
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%128MB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0000','2010-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2010-06-01',1,'FLEX','1000','0',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%128MB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0001','2010-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2010-06-01',1,'FLEX','1001','1',@firm_id,36,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%128MB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0002','2010-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2010-06-01',1,'FLEX','1002','2',@firm_id,37,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0003','2010-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2010-06-01',1,'FLEX','1003','3',@firm_id,38,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0004','2011-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2011-09-01',1,'FLEX','1004','4',@firm_id,39,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,130225%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0005','2011-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2011-09-01',1,'FLEX','1005','5',@firm_id,NULL,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,130816%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0006','2011-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2011-09-01',1,'FLEX','1006','6',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0007','2011-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2011-09-01',1,'FLEX','1007','7',@firm_id,41,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0008','2012-03-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-03-01',1,'FLEX','1008','8',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0009','2012-03-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-03-01',1,'FLEX','1009','9',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0010','2012-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-08-01',1,'FLEX','1010','10',@firm_id,44,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0011','2012-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-08-01',1,'FLEX','1011','11',@firm_id,45,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,140211%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0012','2012-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-08-01',1,'FLEX','1012','12',@firm_id,35,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0013','2012-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-08-01',1,'FLEX','1013','13',@firm_id,36,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0014','2012-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-08-01',1,'FLEX','1014','14',@firm_id,37,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0015','2012-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2012-08-01',1,'FLEX','1015','15',@firm_id,38,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,1,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0016','2014-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-05-01',1,'FLEX','1016','16',@firm_id,39,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0017','2014-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-05-01',1,'FLEX','1017','17',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,1,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0018','2015-10-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2015-10-01',1,'FLEX','1018','18',@firm_id,41,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0019','2015-10-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2015-10-01',1,'FLEX','1019','19',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0020','2015-10-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2015-10-01',1,'FLEX','1020','20',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0021','2015-10-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2015-10-01',1,'FLEX','1021','21',@firm_id,44,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0022','2015-11-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2015-11-01',1,'FLEX','1022','22',@firm_id,45,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0023','2015-11-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2015-11-01',1,'FLEX','1023','23',@firm_id,45,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0024','2016-04-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-04-01',1,'FLEX','1024','24',@firm_id,36,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0025','2016-04-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-04-01',1,'FLEX','1025','25',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0026','2016-04-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-04-01',1,'FLEX','1026','26',@firm_id,38,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0027','2016-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-05-01',1,'FLEX','1027','27',@firm_id,39,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0028','2016-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-05-01',1,'FLEX','1028','28',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.16,161014%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0029','2016-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-05-01',1,'FLEX','1029','29',@firm_id,41,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0030','2016-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-05-01',1,'FLEX','1030','30',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0031','2016-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-05-01',1,'FLEX','1031','31',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0032','2016-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-05-01',1,'FLEX','1032','32',@firm_id,44,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0033','2016-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-06-01',1,'FLEX','1033','33',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0034','2016-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-06-01',1,'FLEX','1034','34',@firm_id,45,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0035','2016-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-06-01',1,'FLEX','1035','35',@firm_id,36,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0036','2016-07-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-07-01',1,'FLEX','1036','36',@firm_id,37,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0037','2016-07-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-07-01',1,'FLEX','1037','37',@firm_id,38,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0038','2016-07-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-07-01',1,'FLEX','1038','38',@firm_id,39,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0039','2016-07-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-07-01',1,'FLEX','1039','39',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0040','2016-07-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-07-01',1,'FLEX','1040','40',@firm_id,41,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0041','2016-07-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2016-07-01',1,'FLEX','1041','41',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0042','2017-03-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-03-01',1,'FLEX','1042','42',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0043','2017-03-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-03-01',1,'FLEX','1043','43',@firm_id,44,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0044','2017-03-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-03-01',1,'FLEX','1044','44',@firm_id,45,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0045','2017-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-05-01',1,'FLEX','1045','45',@firm_id,35,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0046','2017-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-05-01',1,'FLEX','1046','46',@firm_id,36,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0047','2017-05-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-05-01',1,'FLEX','1047','47',@firm_id,37,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0048','2017-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-08-01',1,'FLEX','1048','48',@firm_id,38,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0049','2017-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-08-01',1,'FLEX','1049','49',@firm_id,39,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0051','2017-08-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-08-01',1,'FLEX','1051','51',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0052','2017-10-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-10-01',1,'FLEX','1052','52',@firm_id,41,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0053','2017-10-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-10-01',1,'FLEX','1053','53',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0054','2017-12-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-12-01',1,'FLEX','1054','54',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0055','2017-12-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-12-01',1,'FLEX','1055','55',@firm_id,44,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0056','2017-12-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-12-01',1,'FLEX','1056','56',@firm_id,45,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0057','2017-12-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2017-12-01',1,'FLEX','1057','57',@firm_id,37,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0058','2018-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2018-06-01',1,'FLEX','1058','58',@firm_id,38,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0059','2018-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2018-06-01',1,'FLEX','1059','59',@firm_id,39,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0060','2018-06-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2018-06-01',1,'FLEX','1060','60',@firm_id,40,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0061','2018-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2018-09-01',1,'FLEX','1061','61',@firm_id,41,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0062','2018-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2018-09-01',1,'FLEX','1062','62',@firm_id,42,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%2.01,170530%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%2GB%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0063','2018-09-01',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2018-09-01',1,'FLEX','1063','63',@firm_id,43,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,2,2,2,2,2);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0002','2008-12-02 14:54:57',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2008-12-02 14:54:57',2,'','','0002',@firm_id,2,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0004','2008-01-13 12:00:00',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2008-01-13 12:00:00',2,'','','0004',@firm_id,4,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0005','2009-01-23 14:05:27',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2009-01-23 14:05:27',2,'','','0005',@firm_id,5,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0006','2008-12-15 15:36:55',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2008-12-15 15:36:55',2,'','','0006',@firm_id,6,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0007','2008-06-24 12:00:00',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2008-06-24 12:00:00',2,'','','0007',@firm_id,7,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0008','2008-12-02 15:04:08',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2008-12-02 15:04:08',2,'','','0008',@firm_id,8,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0009','2008-06-24 12:00:00',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2008-06-24 12:00:00',2,'','','0009',@firm_id,9,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0010','2010-03-08 19:09:44',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2010-03-08 19:09:44',2,'','','0010',@firm_id,10,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'0011','2007-06-01 12:00:00',2); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2007-06-01 12:00:00',2,'','','0011',@firm_id,11,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'2001','2014-06-18 00:00:00',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-06-18 00:00:00',2,'','','2001',@firm_id,1,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'2002','2014-06-28 00:00:00',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-06-28 00:00:00',2,'','','2002',@firm_id,2,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'2003','2014-06-15 00:00:00',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-06-15 00:00:00',2,'','','2003',@firm_id,3,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'2004','2014-06-15 00:00:00',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-06-15 00:00:00',2,'','','2004',@firm_id,4,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'2005','2014-06-15 00:00:00',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-06-15 00:00:00',2,'','','2005',@firm_id,5,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @con_inst_id = LAST_INSERT_ID(); SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%1.12,150313%'; SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%NULL%'; INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`) VALUES (@con_inst_id,'2006','2014-06-15 00:00:00',1); INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`) VALUES (@con_inst_id,'2014-06-15 00:00:00',2,'','','2006',@firm_id,6,@card_id); INSERT INTO `FlexFixes` (`inst_id`,`met_ic`,`solder_cpu_jp24`,`cpu_r4_887`,`rain_gnd`,`ss_standoff`) VALUES (@con_inst_id,1,1,1,1,1);
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0000' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514000626049','881693761030','881651461223','2010-06-05 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2010-06-05 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0001' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514000626056','881693761031','881651461224','2010-06-05 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2010-06-05 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0002' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514000626064','881693761032','881651461225','2010-06-05 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2010-06-05 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0003' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514000626031','881693761029','881651461222','2010-06-05 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2010-06-05 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0004' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169224000617242','881692441794','881622441870','2011-09-29 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2011-09-29 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0005' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169224000617259','881692441795','881622441871','2011-09-29 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2011-09-29 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0006' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169224000617267','881692441796','881622441872','2011-09-29 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2011-09-29 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0007' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169224000617275','881692441797','881622441873','2011-09-29 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2011-09-29 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0008' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000860785','881693156995','881621457058','2012-03-01 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2012-03-01 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0009' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000860793','881693156997','881621457059','2012-03-01 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2012-03-01 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0010' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000877003','881693166571','881621466633','2013-05-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2013-05-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0011' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000877011','881693166572','881621466635','2013-05-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2013-05-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0012' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000877029','881693166576','881621466638','2013-05-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2013-05-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0013' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000877037','881693166578','881621466639','2013-05-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2013-05-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0014' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000877045','881693166579','881621466642','2013-05-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2013-05-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0015' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000877052','881693166580','881621466644','2013-05-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2013-05-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0016' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836123','881692939922','881631439951','2014-05-20 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-05-20 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0017' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836131','881692939928','881631439952','2014-05-20 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-05-20 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0018' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113864','881693723347','881651431248','2015-10-20 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2015-10-20 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0019' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113872','881693723352','881651431254','2015-10-20 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2015-10-20 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0020' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113880','881693723357','881651431259','2015-10-20 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2015-10-20 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0021' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113898','881693723367','881651431277','2015-10-20 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2015-10-20 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0022' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113906','881693723501','881651431303','2015-11-16 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2015-11-16 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0023' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113914','881693723845','881651431306','2015-11-16 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2015-11-16 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0024' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113963','881693731264','881651431559','2016-04-21 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-04-21 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0025' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113971','881693731265','881651431560','2016-04-21 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-04-21 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0026' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113989','881693731268','881651431561','2016-04-21 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-04-21 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0027' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114151','881693731317','881651434519','2016-05-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-05-18 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0028' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114169','881693731318','881651434520','2016-05-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-05-18 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0029' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114177','881693731320','881651434521','2016-05-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-05-18 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0030' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114185','881693731321','881651434522','2016-05-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-05-18 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0031' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114193','881693731322','881651434527','2016-05-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-05-18 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0032' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114201','881693731323','881651434528','2016-05-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-05-18 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0033' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001113997','881693731347','881651434578','2016-06-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-06-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0034' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114003','881693731392','881651434579','2016-06-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-06-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0035' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114011','881693731372','881651434586','2016-06-30 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-06-30 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0036' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114029','881693731396','881651434624','2016-08-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-08-15 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0037' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114037','881693731397','881651434625','2016-08-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-08-15 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0038' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114045','881693731400','881651434628','2016-08-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-08-15 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0039' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114060','881693731484','881651434650','2016-09-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-09-15 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0040' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114078','881693731485','881651434656','2016-09-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-09-15 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0041' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114086','881693731486','881651434657','2016-09-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2016-09-15 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0042' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114136','881693731633','881651435113','2017-03-27 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-03-27 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0043' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514001114144','881693731646','881651435114','2017-03-24 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-03-24 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0044' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001234145','881692764570','881621455590','2017-03-24 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-03-24 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0045' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447382','881692428180','881621456216','2017-05-23 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-05-23 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0046' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447390','881692428181','881621456217','2017-05-23 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-05-23 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0047' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447408','881692428182','881621456219','2017-05-23 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-05-23 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0048' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447416','881692428643','881621456953','2017-08-23 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-08-23 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0049' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447424','881692428642','881621456945','2017-08-23 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-08-23 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0051' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447432','881692428641','881621456941','2017-08-23 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-08-23 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0052' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447440','881692429024','881621457512','2017-10-19 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-10-19 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0053' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447457','881692429037','881621457513','2017-10-19 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-10-19 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0054' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447465','881692429038','881621457515','2017-10-19 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2017-10-19 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0055' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447473','881692429160','881621457910','2018-01-04 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-01-04 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0056' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447481','881692429161','881621457911','2018-01-04 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-01-04 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0057' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001447499','881692429168','881621457914','2018-01-04 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-01-04 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0058' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001233998','881692430014','881621466681','2018-06-07 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-06-07 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0059' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001234004','881692430012','881621466666','2018-06-07 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-06-07 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0060' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001234012','881692430013','881621466673','2018-06-07 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-06-07 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0061' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001233980','881692430844','881621467360','2018-09-12 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-09-12 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0062' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001233972','881692430847','881621467361','2018-09-12 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-09-12 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0063' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169234001233824','881692430848','881621467362','2018-09-12 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2018-09-12 00:00:00','1',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0002' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514000626007','881693760915','881651461105','2008-12-02 14:54:57'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2008-12-02 14:54:57','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0004' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000612269','881693167707','881621467707','2008-01-13 12:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2008-01-13 12:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0005' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000612251','881693167706','881621467706','2009-01-23 14:05:27'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2009-01-23 14:05:27','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0006' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169514000625991','881693760914','881651461104','2008-12-15 15:36:55'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2008-12-15 15:36:55','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0008' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169414000461424','881693403876','881641403889','2008-12-02 15:04:08'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2008-12-02 15:04:08','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0009' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169414000461507','881693429908','881641429963','2008-06-24 12:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2008-06-24 12:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0010' AND `type_id` = 2; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169214000612293','881693167687','881621467686','2010-03-08 19:09:44'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2010-03-08 19:09:44','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2001' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836008','881692939125','881631439111','2014-06-18 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-06-18 00:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2002' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836016','881692939126','881631439114','2014-06-28 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-06-28 00:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2003' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836024','881692939137','881631439115','2014-06-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-06-15 00:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2004' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836032','881692939138','881631439116','2014-06-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-06-15 00:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2005' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836040','881692939142','881631439117','2014-06-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-06-15 00:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @sim_inst_id = LAST_INSERT_ID(); SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2006' AND `type_id` = 1; INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`) VALUES (@sim_inst_id,'8988169312003836057','881692939143','881631439119','2014-06-15 00:00:00'); INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`) VALUES (@sim_inst_id,'2014-06-15 00:00:00','2',1,@con_inst_id); UPDATE `FlexConfig` SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'01',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Recovered from PA004 6/13/11."); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),1);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'03',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Papa 2017"); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),7);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'04',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Unused Iridium connector available for new rad sensor if needed. Deployed at KE009 11/14/11. Recovered 7/5/12."); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),3);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'05',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Unused Iridium connector available for new rad sensor if needed."); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),6);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'06',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Papa 2018 Spare"); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),3);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'07',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"KEO 2017"); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),7);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'08',1); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Paros connector found corroded after PA006. Replaced 7/2013."); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),1);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'02',2); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Recovered from KE008 11/14/11. Corrosion on contacts due to water in well."); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),6);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'09',2); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Pat's Office"); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),6);
INSERT INTO `Instrument` VALUES (NULL); SET @fcp_inst_id = LAST_INSERT_ID(); INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`) VALUES (@fcp_inst_id,'10',2); INSERT INTO `InstrumentHist` (`inst_id`,`dt`,`txt`) VALUES (@fcp_inst_id,NOW(),"Lab"); INSERT INTO `test_DAW_InstrumentLocation`.`History` (`inst_id`,`dt`,`label_id`) VALUES (@fcp_inst_id,NOW(),6);USE `test_DAW_FlexSystems`;
/* History/mksql.py < ../CSV/OCST2001.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2001' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-18 00:00:00','New TFlex system. Deployed at PA008. JAK'),
(@con_inst_id,'2015-07-01 14:38:07','Recovered from PA008 6/16/15. Evidence of water intrusion. Salt crystals below RF antenna. JAK'),
(@con_inst_id,'2017-06-30 14:21:25','Deployed PA011A 6/14/17 - PB');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-06-30 14:21:25',7,'Deployed PA011A 6/14/17 - PB');
/* History/mksql.py < ../CSV/OCST2002.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2002' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-28 00:00:00','New TFlex system deployed at KE012. FW v 1.12 140211. JAK'),
(@con_inst_id,'2015-09-07 11:34:12','Recovered from KE-012. Failed in April 2015. System was at FLEX> prompt when connected to laptop upon recovery. Configuration information was garbled. No obvious cause. JAK'),
(@con_inst_id,'2016-04-21 09:16:20','Cause of issue noted 9/7/15 likely due to minor water intrusion through RF antenna port. Sealed threads with \"Blue-75.\" JAK'),
(@con_inst_id,'2017-07-27 15:56:48','Deployed KE015 KE1-17-BF - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-07-27 15:56:48',7,'Deployed KE015 KE1-17-BF - Pb');
/* History/mksql.py < ../CSV/OCST2003.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2003' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'),
(@con_inst_id,'2015-07-01 14:31:35','Deployed at PA009 6/15/16. JAK'),
(@con_inst_id,'2016-08-18 08:37:51','Recovered from PA 009 on 07/05/16. DK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-08-18 08:37:51',1,'Recovered from PA 009 on 07/05/16. DK');
/* History/mksql.py < ../CSV/OCST2004.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2004' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'),
(@con_inst_id,'2015-09-07 13:15:46','Deployed on KE-013. JAK'),
(@con_inst_id,'2016-08-18 08:59:57','Recovered on 08/01/16 from KE 013. DK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-08-18 08:59:57',1,'Recovered on 08/01/16 from KE 013. DK');
/* History/mksql.py < ../CSV/OCST2005.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2005' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'),
(@con_inst_id,'2016-08-18 08:30:13','Deployed at PA 010 on 06/15/16. DK'),
(@con_inst_id,'2017-06-30 10:26:58','Recovered PA010A P1-17-TU - Pb'),
(@con_inst_id,'2017-06-30 10:26:58','Recovered PA010A P1-17-TU - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-06-30 10:26:58',1,'Recovered PA010A P1-17-TU - Pb');
/* History/mksql.py < ../CSV/OCST2006.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2006' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'),
(@con_inst_id,'2016-08-18 08:43:05','Deployed at KE 014 on 07/31/16. DK'),
(@con_inst_id,'2017-07-27 14:58:07','Recovered KEO14A KE1-17-BF - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-07-27 14:58:07',1,'Recovered KEO14A KE1-17-BF - Pb');
/* History/mksql.py < ../CSV/OCSX0002.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0002' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 14:54:57','Box for bench testing. Has power and data connectors on opposite sides.\nWired for Paros, Vaisala\n128MB\nCPU board 40029\nserial board 1000\nmet board 1000\nRIG board 1000'),
(@con_inst_id,'2008-12-31 15:47:19','testing in buoy in parking lot for Papa'),
(@con_inst_id,'2009-02-23 16:50:33','testing in lake for PA003\r\n1.07 2009-09-20 firmware'),
(@con_inst_id,'2009-04-06 12:00:00','Lake testing concluded - battery died; HLB buoy mods'),
(@con_inst_id,'2009-04-08 00:00:00','to EDD to add 2nd 64pin connector'),
(@con_inst_id,'2009-05-01 00:00:00','Back from EDD, 2nd 64 pin added; 1.07 2009-04-20 firmware'),
(@con_inst_id,'2009-05-06 19:00:00','Out to grassy knoll van for PA003 testing'),
(@con_inst_id,'2009-05-22 12:00:00','New I/O cals. AT: A3 -3.998587E-01 A4 2.430431E-04\r\nRH: A3 2.803436E-04 A4 2.688063E-04'),
(@con_inst_id,'2009-05-30 14:37:48','Shipping to PA2-09-TU as PA003 primary. v1.07 090420 firmware'),
(@con_inst_id,'2010-06-22 16:10:25','Recovered from PA003 and returned to lab on PA1-10-TU - DEM'),
(@con_inst_id,'2010-11-15 15:16:57','GPS and Iridium installed internally. JAK'),
(@con_inst_id,'2010-11-16 11:33:01','SIM Card 89881 69514 00062 6007'),
(@con_inst_id,'2011-01-05 11:59:36','New CPU board installed 12/23/2010. Board #40206. JAK'),
(@con_inst_id,'2011-01-13 12:38:09','Circuit boards damaged by 40V. Replaced with boards from box 7. CPU 40212 (fully modified), MET no S/N, SER no S/N, RIG 2000.'),
(@con_inst_id,'2011-01-13 12:40:48','Iridium antenna damaged by 12V because proper mods weren\'t made to Serial board. Replaced with new. IMEI 300224010731080. DRHS0022D, L5, 32835, 7072RA. Still has same SIM card as noted 11/16/2010. JAK'),
(@con_inst_id,'2011-12-22 15:07:33','Added Iridium handshaking and hygroclip wiring. JAK'),
(@con_inst_id,'2012-03-30 09:43:14','Firmware upgraded to version 1.11 111121 JAK'),
(@con_inst_id,'2012-06-03 13:11:15','Deployed at PA006. JAK'),
(@con_inst_id,'2013-06-18 20:40:00','Rec. PA006. Batteries low. JAK'),
(@con_inst_id,'2014-03-06 13:51:41','I/O cal completed - JAK'),
(@con_inst_id,'2015-07-01 14:29:49','Deployed at PA009 6/15/16. JAK'),
(@con_inst_id,'2016-08-18 08:36:39','Recovered on 07/05/16, PA 009. Three system resets throughout deployment. DK'),
(@con_inst_id,'2017-06-30 14:20:54','Deployed PA011A 6/14/17 - PB');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-06-30 14:20:54',7,'Deployed PA011A 6/14/17 - PB');
/* History/mksql.py < ../CSV/OCSX0004.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0004' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 14:58:10','Deployed PA002\r\nWired for Paros'),
(@con_inst_id,'2008-01-13 12:00:00','AT channel A/D cal:\r\n-0.39877 	0.00024402\r\nRH channel A/D cal:\r\n-0.0015392 	0.00026992'),
(@con_inst_id,'2009-01-15 13:20:23','back from PA002. In buoy still for McLain testing.'),
(@con_inst_id,'2009-11-25 12:05:38','At some point in 2009 upgraded to 2nd 62 pin connector.'),
(@con_inst_id,'2009-11-25 12:07:40','Iridium modem and GPS mounted inside box for testing.'),
(@con_inst_id,'2009-11-25 12:08:32','Box in lake for testing -rk'),
(@con_inst_id,'2010-02-24 12:00:00','Lake testing ended. Load cell wiring suspect. Bott to replace? -rk'),
(@con_inst_id,'2010-02-25 09:37:40','SIM verified - 8988 1692 1400 0612 269\r\nVoice number 8816 2146 7707; Data 8816 9316 7707'),
(@con_inst_id,'2010-03-01 16:31:20','Software upgraded to v1.09 10-02-08 -rk'),
(@con_inst_id,'2010-03-17 17:07:42','Out in parking lot for testing; assigned as Papa primary. -rk'),
(@con_inst_id,'2010-05-12 19:02:41','did Io cal on ATRH channel. AT	A3 = -3.951827E-01	A4 = 2.430344E-04	 RH	A3 = 6.922950E-05	A4 = 2.686332E-04 ---KBR'),
(@con_inst_id,'2010-07-09 15:39:57','deployed at PAPA, 14 June 2010, PA-004 with v 1.10 (5-14-10) software, internal GPS and Iridium antennas. - KBR'),
(@con_inst_id,'2012-01-10 15:08:29','Added Iridium handshaking. JAK'),
(@con_inst_id,'2012-03-30 09:43:25','Firmware upgraded to version 1.11 111121 JAK'),
(@con_inst_id,'2013-06-17 17:10:00','Deployed at PA-007. FW v.1.12 030225. RF modem did not always go to low power mode as scheduled. Turned off via Iridium command from shore after cruise. JAK'),
(@con_inst_id,'2016-08-18 08:28:22','Deployed at PA 010 on 06/15/16. DK'),
(@con_inst_id,'2017-06-30 10:26:34','Recovered PA010A P1-17-TU - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-06-30 10:26:34',1,'Recovered PA010A P1-17-TU - Pb');
/* History/mksql.py < ../CSV/OCSX0005.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0005' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2009-01-23 14:05:27','Wired for ParoS, Vaisala\r\n128 MB\r\nCPU board 4003\r\nserial board 1003\r\nmet board 1003\r\nRIG board 2003'),
(@con_inst_id,'2009-01-23 14:06:20','In lab, PA003 spare\r\n01.06 08/12/08 firmware'),
(@con_inst_id,'2009-02-23 16:33:35','testing in parking lot for PA003\n1.07 2009-09-20 firmware'),
(@con_inst_id,'2009-05-30 14:29:54','Shipping to PA003 (PA2-09-TU) as spare. 1.07 090420 firmware.'),
(@con_inst_id,'2009-05-29 00:00:00','Showed intermittent noise on LWR and Rain channels when testing near bldg 3 (shed and buoy). No problems up at grassy knoll van. -rk'),
(@con_inst_id,'2009-05-22 12:00:00','New I/O cals. AT: A3 -4.020891E-01 A4 2.435749E-04\r\nRH: A3 -1.949958E-05 A4 2.700646E-04'),
(@con_inst_id,'2010-04-14 11:34:54','New I/O cals AT (a1) 2.434973E-04 (A0) -4.019696E-01 RH (A1) 2.698898E-04 (A0) 3.844729E-05\r\n\r\n'),
(@con_inst_id,'2010-05-12 19:05:09','since I was doing the I/O on Flexbox 4, I decided to redo the I/O cal on this box - 0005.\r\nAT	A3 = -4.022514E-01	A4 = 2.435749E-04	 RH	A3 = 3.844729E-05	A4 = 2.698898E-04 ---KBR'),
(@con_inst_id,'2010-05-24 11:27:43','Installed SIM card - 89881 69514 00062 6007 -dm'),
(@con_inst_id,'2010-06-22 16:11:43','Returned as unused spare from PA1-10-TU - DEM'),
(@con_inst_id,'2010-11-16 11:32:01','No longer has SIM card 89881 69514 00062 6007'),
(@con_inst_id,'2011-04-29 12:45:03','SIM card 8988 1692 1400 0612 251 JAK'),
(@con_inst_id,'2011-06-11 09:03:18','Deployed at PA005. JAK'),
(@con_inst_id,'2012-06-04 13:13:05','Rec. PA005. JAK'),
(@con_inst_id,'2014-03-06 13:52:15','I/O cal completed - JAK'),
(@con_inst_id,'2014-06-18 00:00:00','Deployed at PA008. JAK'),
(@con_inst_id,'2015-07-01 14:36:51','Recovered from PA008 6/16/15. JAK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-07-01 14:36:51',1,'Recovered from PA008 6/16/15. JAK');
/* History/mksql.py < ../CSV/OCSX0006.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0006' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-15 15:36:55','in lab\r\nWired for Druck, SWR/LWR\r\n128 MB\r\nCPU board 4006\r\nserial board 1006\r\nmet board 1006\r\nRIG board 2006\r\n'),
(@con_inst_id,'2008-12-31 15:45:26','lake testing'),
(@con_inst_id,'2009-01-21 16:50:27','upgraded to latest 1.07 firmware (today\'s date)'),
(@con_inst_id,'2010-05-22 14:31:39','Recovered from KEO repair (KE1-10-MI). Sent to Randy 5.24.10 for firmware update (v1.09-->v1.10) and internal GPS/Iridum antenna upgrade. Use guts of Iridum/GPS can 003 for upgrade. Check box for excessive power usage when returned from RB and prior to deployment-jms'),
(@con_inst_id,'2010-05-29 12:00:08','Randy used the Iridium/GPS from Flex can 5 to upgrade this box. - KBR'),
(@con_inst_id,'2010-09-14 12:51:05','Sent to ARC as primary box. - JAK'),
(@con_inst_id,'2011-01-05 12:02:29','Swapped CPU board in the field. Problems with IM comms. Not deployed. In return shipment. JAK'),
(@con_inst_id,'2011-04-26 15:18:05','Received from ARC shipment 3/24. Installed original CPU board and tested. No further problems with IM comms as tested through 4/26. JAK'),
(@con_inst_id,'2011-07-08 14:09:25','Firmware updated to version 1.11 110708 JAK'),
(@con_inst_id,'2012-01-10 15:08:54','Added Iridium handshaking. JAK'),
(@con_inst_id,'2012-03-30 09:42:25','Firmware upgraded to version 1.11 111121 JAK'),
(@con_inst_id,'2012-10-17 08:19:14','Replaced IMM in box, due to intermittent 2E35s.'),
(@con_inst_id,'2013-07-05 14:46:01','Deployed at KE011. Firmware 1.12 130225.'),
(@con_inst_id,'2014-06-26 00:00:00','Recovered from KE011. JAK'),
(@con_inst_id,'2016-08-18 08:19:59','Deployed on 07/31/16 at KE 014. DK'),
(@con_inst_id,'2017-07-27 14:57:39','Recovered KEO14A KE1-17-BF - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-07-27 14:57:39',1,'Recovered KEO14A KE1-17-BF - Pb');
/* History/mksql.py < ../CSV/OCSX0007.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0007' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 14:59:11','Deployed KE006\r\nWired for Druck, Vaisala\r\n'),
(@con_inst_id,'2008-06-24 12:00:00','AT channel A/D calibration:\r\n-3.991594E-01	2.464431E-04\r\nRH channel A/D calibration:\r\n4.527267E-04	2.686891E-04'),
(@con_inst_id,'2009-09-04 00:00:00','Recovered KE006, Flex v1.05 080721. Worked well -rk'),
(@con_inst_id,'2010-01-14 11:55:17','Post-deployment (KEO006) I/O cal for ATRH performed by Pat. AT A/D calibration A3 = -3.98868E-01, A4= 2.465779E-04, RH A/D calibration A3 = 1.672821E-04, A4 = 2.692713E-04 (kbr)'),
(@con_inst_id,'2010-02-25 10:10:48','Only has one 62 pin; use for hygroclip cal box - rk'),
(@con_inst_id,'2010-03-01 16:30:18','Modified to be hygroclip cal box, ATRH cal software installed. -rk'),
(@con_inst_id,'2011-01-13 12:37:40','Circuit boards removed to use in box 2. JAK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-01-13 12:37:40',6,'Circuit boards removed to use in box 2. JAK');
/* History/mksql.py < ../CSV/OCSX0008.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0008' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 15:04:08','Currently in lake testing\nWired for Druck, Vaisala\n512MB\nCPU board 4002\nserial board 1002\nmet board 1002\nRIG board 2002'),
(@con_inst_id,'2010-02-24 15:07:08','box modified with GPS card and NAL modem pulled from IRID tube 0002. So now has GPS board LeadTek LR9548S P7110000655 and NAL A3LA-D modem IMEI 300124010602070 with no SIM when pulled from tube '),
(@con_inst_id,'2010-02-25 10:01:43','SIM installed: 8988 1694 1400 0461 424 Data phone number: 881693403876 Voice phone number: 881641403889'),
(@con_inst_id,'2010-02-25 10:13:59','Will go to KE1-10-MI repair cruise. Test in parking lot. -rk'),
(@con_inst_id,'2010-03-10 14:06:21','in shipment to KEO repair cruise on the Mirai, ATRH cals done 3/9/10 AT A3= -3.912534E-01	A4=2.414813E-04; 	RH	A3= 1.192501E-04	A4= 2.686542E-04'),
(@con_inst_id,'2010-09-17 14:05:20','Sent to KEO as spare. JAK'),
(@con_inst_id,'2010-10-06 08:43:48','Not deployed. In return shipment from KEO. JAK'),
(@con_inst_id,'2011-07-08 14:12:38','Firmware updated to version 1.11 110708. JAK'),
(@con_inst_id,'2011-07-20 14:11:17','Current drain tested 7/18 & 19. Max = 1.15A, Avg. = 0.078A, Min = 0.052A JAK'),
(@con_inst_id,'2011-11-29 14:55:08','Deployed at KE009 11/14/11. JAK'),
(@con_inst_id,'2012-07-05 09:12:29','Rec. KE009. JAK'),
(@con_inst_id,'2014-03-06 13:52:26','I/O cal completed - JAK'),
(@con_inst_id,'2014-06-28 00:00:00','Deployed at KE012. FW v1.12 140211. JAK'),
(@con_inst_id,'2015-09-07 11:25:53','Recovered from KE-012. Not all data downloaded in the field. Re-check and replace memory card before redeployment. JAK'),
(@con_inst_id,'2017-07-27 15:56:22','Deployed KE015 KE1-17-BF - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-07-27 15:56:22',7,'Deployed KE015 KE1-17-BF - Pb');
/* History/mksql.py < ../CSV/OCSX0009.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0009' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 14:56:45','Spare on KE2-08-KY\r\nWired for Druck, Vaisala\r\n128MB\r\n'),
(@con_inst_id,'2008-06-24 12:00:00','AT channel A/D calibration:\r\n-3.998985E-01	2.437989E-04\r\nRH channel A/D calibration:\r\n2.186590E-05	2.683036E-04'),
(@con_inst_id,'2009-12-31 00:00:00','Upgraded to 2 x 62 pin during 2009.'),
(@con_inst_id,'2010-02-25 10:17:09','Modified to be hygroclip cal box. Change back to standard druck box. -rk'),
(@con_inst_id,'2010-03-01 16:32:18','Reverted to standard box. -rk'),
(@con_inst_id,'2010-09-14 12:52:17','Sent to ARC as spare. - JAK'),
(@con_inst_id,'2011-01-05 12:04:39','Deployed at ARC 11/30/2010. JAK'),
(@con_inst_id,'2012-01-10 15:09:11','Added Iridium handshaking. JAK'),
(@con_inst_id,'2012-03-30 09:43:39','Firmware upgraded to version 1.11 111121 JAK'),
(@con_inst_id,'2012-03-30 09:43:46','Current drain test done 3/27-28/12. Avg = 32.6mA, Max = 210mA, min = -97mA. JAK'),
(@con_inst_id,'2012-07-04 09:30:50','Deployed at KE010. JAK'),
(@con_inst_id,'2013-06-28 14:49:35','Recovered from KE010.'),
(@con_inst_id,'2014-03-06 13:52:35','I/O cal completed - JAK'),
(@con_inst_id,'2015-09-07 13:13:58','Deployed on KE-013. JAK'),
(@con_inst_id,'2016-08-18 08:55:13','Recovered 08/01/16 from KE 013. DK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-08-18 08:55:13',1,'Recovered 08/01/16 from KE 013. DK');
/* History/mksql.py < ../CSV/OCSX0010.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0010' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2010-03-08 19:09:44','FLEX Box 0010 installed on buoy in parking lot. will go to KEO April 2010 repair cruise as a spare. Configured for Druck. Has internal GPS and Iridium modem. Repaired 8 march 2010 (AT and BP did not work) Randy swapped in card pulled from box 0009. now has SIM 89881 69214 00061 2293 installed. Seems to be working well. Software 1.09, 10_02_08 installed. - KBR'),
(@con_inst_id,'2010-09-17 14:06:13','Sent to KEO as primary. JAK'),
(@con_inst_id,'2010-11-09 15:24:29','appears to have mobile # 881621467686, and data #881693167687 associated with this SIM card - KBR'),
(@con_inst_id,'2010-11-09 15:15:24','Deployed at KEO 9/29/10 with software version 1.11 100805 JAK'),
(@con_inst_id,'2011-11-29 14:55:35','Recovered from KE008 11/14/11. Stopped transmitting in September, but still able to communicate with internal comms. JAK'),
(@con_inst_id,'2012-03-30 09:44:37','Firmware upgraded to version 1.11 111121 JAK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-03-30 09:44:37',6,'Firmware upgraded to version 1.11 111121 JAK');
/* History/mksql.py < ../CSV/OCSX0011.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0011' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 15:00:38','Previously known as \"KEO\", deployed KE005\nWired for Druck, SWR/LWR\n128MB\nCPU board 4005\nserial board 1005\nmet board 1005\nRIG board 2005'),
(@con_inst_id,'2007-06-01 12:00:00','AT channel A/D cal:\r\n-0.39877 .00024402\r\nRH channel A/D cal:\r\n-0.0015392 0.00026992\r\ndate VERY approximate');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2007-06-01 12:00:00',6,'AT channel A/D cal:\r\n-0.39877 .00024402\r\nRH channel A/D cal:\r\n-0.0015392 0.00026992\r\ndate VERY approximate');
/* History/mksql.py < ../CSV/TMBA0000.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0000' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2010-07-23 19:00:00','Start of first TEST outside Bldg 3 with everything working, all met sensors connected and 1 inductive SBE39T'),
(@con_inst_id,'2010-08-09 21:00:00','Brought Inside ending test outside of Bldg 3'),
(@con_inst_id,'2010-08-13 19:00:00','Put back on test outside of Bldg 3'),
(@con_inst_id,'2010-08-19 22:20:00','Restarted (taken out and put back into log mode) because Pat accidently reset it while testing his bench RF modem, which was also set to RF modem ID 0.'),
(@con_inst_id,'2010-09-02 15:45:00','Brought Inside ending test outside of Bldg 3 to update firmware to 1.11 100813'),
(@con_inst_id,'2010-09-02 21:20:00','Put back on test outside of Bldg 3, in log mode, added Aquadopp CM.'),
(@con_inst_id,'2010-09-20 21:00:00','Reset, took out of LOG mode, updated Configuration to set \"GPS Interval\" from every 6 hours to 24 hours (once/day). Also updated \"GPS set time\" to 12:15. Then put pack into LOG mode.'),
(@con_inst_id,'2010-09-27 21:15:00','Stopped testing. Brought inside lab. Pat using to do some further testing for the RF modem.'),
(@con_inst_id,'2010-09-27 22:20:00','TEST restarted, put back into LOG mode via the RF modem.'),
(@con_inst_id,'2010-10-07 20:20:00','TEST ended. Brought TFLEX0000 in lab to upgrade Iridium transmitter firmware.'),
(@con_inst_id,'2010-10-08 00:00:00','Randy Bott updated Iridium transmitter firmware.'),
(@con_inst_id,'2010-10-27 20:09:00','Put in LOG mode for extended testing outside Bldg. 3-Full suite of SBE and Met sensors per standard TFLEX deployment . -jms'),
(@con_inst_id,'2010-10-27 00:00:00','1-SBE37 TC-SMP, 5-SBE37 TC-IM, 4-SBE39 T-IM, 2-SBE39 TP-IM, 1-AQUADOPP CM--swr, rain,gill,atrh'),
(@con_inst_id,'2010-11-02 16:25:00','Restarted system with new cal file to reflect addion of new Gill Wind. Loaded cal file via RF. Switched out induct. Loop wire due to SBE37IM-TC drop outs. Suspect bad ground. -jms'),
(@con_inst_id,'2010-11-02 20:45:00','Stopped LOGGING to fix CAL file-Wrong address in CAL file for 500m TP. Changed address of 500m TP from 01-->12. -jms'),
(@con_inst_id,'2010-11-02 20:53:00','Put in LOG -jms'),
(@con_inst_id,'2010-11-02 20:58:00','No SBE39TC-SMP. Wrong data string from instrument. Missing salinity. Reformated instrument. Restarted LOGGING'),
(@con_inst_id,'2010-11-02 00:00:00','SSTC=OK, TESTIND=OK, ATRH=ON, WIND=OK, SWR=OK, RAIN=OK -jms'),
(@con_inst_id,'2010-11-15 00:00:00','Last transmission received from TFLEX can -jms'),
(@con_inst_id,'2010-11-17 00:00:00','Tried to establish comms with TLEX can via term cable. No Joy. System not responding -jms'),
(@con_inst_id,'2010-11-18 16:20:00','Tried restarting system via Iridium call at 0000Z (16:00 local). No carrier'),
(@con_inst_id,'2010-11-21 00:00:00','System brought into lab. Burning in an older firmware version'),
(@con_inst_id,'2010-11-22 00:00:00','Burned in V1.10 100514 PAPA VERSION (due to failure of v1.11 100813)'),
(@con_inst_id,'2010-11-22 00:00:00','System back out to test stand. All sensors plugged into face plate. DID NOT apply power.'),
(@con_inst_id,'2010-11-22 22:06:00','Powered up system- NO RF, Tried connecting directly to term. NO COMMS Batteries????? Left connected to battery. Will try different battery Nov 23.'),
(@con_inst_id,'2010-12-02 17:30:00','Tried to establish coms with TFLEX0000, no response, brought inside for check-out. Gave to Pat to reload firmware.'),
(@con_inst_id,'2010-12-06 22:00:00','System would not respond because of Flash card. Flash card had to be removed and reformatted with watchdog timer disabled(jumper removed). Pat also updated firmware to v1.12 101206, which fixes Sparton compass problem with v 1.10 100514.'),
(@con_inst_id,'2010-12-07 00:00:00','START of TESTING for firmware v1.12 101206 with full set of deployment sensors. XMIT, GPS, ALL sensors working, put in LOG mode.'),
(@con_inst_id,'2010-12-07 18:00:00','Stopped testing. Brought inside lab. Pat wants to revert back to the firmware version that is one version before the version that failed. v1.11 100813 failed, the version before that is v1.11 100805. Pat installed version 1.11100805 into system 0000.'),
(@con_inst_id,'2010-12-07 19:20:00','ReSTARTED TESTING in LOG mode, now with firmware version 1.11 100805. XMIT, GPS, ALL sensors tested and working.'),
(@con_inst_id,'2010-12-08 23:00:00','Data from RF modem putting out control characters at time in Tera Term, but not in XCTU terminal program. Installed older version of TeraTerm, but control characters still being displayed (but not all RF modem data on screen). Not sure if it\'s a TeraTerm problem or System RF modem problem.'),
(@con_inst_id,'2010-12-09 23:50:00','Pat accidentally reset this System 0000 via the RF modem. RESTARTED.'),
(@con_inst_id,'2010-12-10 19:30:00','RESET and configured RF modem ID to 4 (per Pat\'s suggestion) because of the garbage control character data coming out of RF modem. RESTARTED testing in LOG mode.'),
(@con_inst_id,'2010-12-10 20:10:00','Not picking up data on RF modem address 4. RESET again, set back to RF ID 0.'),
(@con_inst_id,'2010-12-13 17:20:00','Stopped Logging to fix RF modem. REPLACED RF MODEM on System 0000.'),
(@con_inst_id,'2010-12-13 18:35:00','ReSTATARED testing in LOG mode with new RF modem, RF ID = 4.'),
(@con_inst_id,'2011-01-05 23:00:00','Noticed that XMIT (Iridium) Battery Voltage data reading 0 in data. Pat says some resistors need to be added to the CPU board to fix this. TO DO after testing.'),
(@con_inst_id,'2011-01-27 23:55:00','STOPPED TEST. Brought TFLEX0000 can inside to fix xmit battery voltage. Found Bat voltage connector loose. Re-connected and now both battery voltage data working.'),
(@con_inst_id,'2011-01-28 20:00:00','STARTED wind & ATRH test at the Grassy Knoll (on top of the van)'),
(@con_inst_id,'2011-02-01 23:40:00','STOPPED test, added SW rad, RESTARTED test on Grassy Knoll.'),
(@con_inst_id,'2011-02-02 21:10:00','STOPPED test, Changed Iridium 1st call time from 00:00 to 00:10, then RESTARTED test on Grassy Knoll'),
(@con_inst_id,'2011-02-07 18:15:00','STOPPED test, did xmit, loaded deploy calfile, connected new SW rad 33724, then RESTARTED.'),
(@con_inst_id,'2011-02-09 18:10:00','STOPPED test, did xmit, Grassy Knoll testing done. Brought back to TAO lab for IO2-11 shipping.'),
(@con_inst_id,'2011-02-23 00:00:00','Air Shipped for IO3-11-BJ'),
(@con_inst_id,'2011-03-20 00:00:00','Deployed at 12S-93E on IO2-11-BJ, RT001'),
(@con_inst_id,'2012-04-01 00:00:00','Recovered at 12S-93E on IO3-12-BJ, RT001'),
(@con_inst_id,'2012-05-01 00:00:00','Air shipped back from Indonesia from IO3-12-BJ'),
(@con_inst_id,'2012-08-07 00:00:00','Updated firmware to version 1.11, 120504'),
(@con_inst_id,'2012-08-22 00:00:00','Installed Iridium modem wire upgrade (per Pat) from pin 22 on DB25 to pin 4 on connector board, plus added 1KOhm resistor on pin 4 to pin 8 on DB25. Plus cleaned up brass I/O connectors on tophat.'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-20 00:30:00','Started test for IO3-13 without inductive sensors (due to firmware problems), plus temp RF ID = 1'),
(@con_inst_id,'2013-02-25 17:50:00','Stopped test without inductive sensors.'),
(@con_inst_id,'2013-02-25 23:30:00','Updated firmware to v1.12, 130225, fixing microcat address #09 problem.'),
(@con_inst_id,'2013-02-26 02:05:00','Started testing for IO3-13 with set of spare sensors, all calibrated.'),
(@con_inst_id,'2013-02-26 18:00:00','The SSTC microcat data reading 1435-1462 for salinity in error. Normally in error conductivity & salinity read near zero. Disconnected and brought microcat 9737 inside lab for checkout.'),
(@con_inst_id,'2013-02-26 19:00:00','Reconnected SSTC microcat 9737. Corrected setup problem. It was outputting sound velocity instead of salinity.'),
(@con_inst_id,'2013-03-18 17:45:00','Stopped outside TEST for IO3-13, spare system.'),
(@con_inst_id,'2015-03-20 00:00:00','Updated CPU R4 to 887 Ohms, removed solder bridge on CPU JP24, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-08-15 00:00:00','Used for Gill All-in-one sensor TEST at Grassy Knoll.'),
(@con_inst_id,'2018-08-06 00:00:00','Installed metal SS standoffs on bottom of the circuit board stack.'),
(@con_inst_id,'2018-08-06 00:00:00','Fixed Rain Ground, shield now connected to power ground. Installed new ground 4-pin Ground faceplate bulkhead and rewired 2-wire, (pin1 & pin2) IM ground connection.'),
(@con_inst_id,'2018-08-06 00:00:00','Updated firmware to version 2.01, 170530.'),
(@con_inst_id,'2018-08-06 00:00:00','Updated Iridium 1st Xmit time to 00:40.'),
(@con_inst_id,'2018-08-06 00:00:00','Installed new Orings, face and jam seal.'),
(@con_inst_id,'2018-08-08 00:00:00','Ran current drain/functional test overnight on bench, 14.25mA average. Everything working, Flash RAM data write good.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2010-07-23 19:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0001.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0001' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2010-07-23 21:30:00','Start of first TEST outside Bldg 3 with everything working, all met sensors connected and 1 inductive SBE39TP'),
(@con_inst_id,'2010-08-10 16:00:00','Brought Inside ending test outside of Bldg 3'),
(@con_inst_id,'2010-08-11 22:00:00','Used the HAYES to do buoy ride and Installed into Buoy anchored in lake. All Met sensors connected, plus SBE39TP, SBE37TC, and Aquadopp CM. NOTE: Vaisala SBD 23 installed 7/23/2010 left on buoy.'),
(@con_inst_id,'2010-10-07 17:00:00','BUOY TEST ended. Did boat ride and removed TFLEX0001 electronics and all tower-mounted sensors. Buoy is still anchored and subsurface sensors are still in the water, a bridle mounted microcat, and about a 5m piece of wire with a microcat, SBE39TP, and a Nortek current meter. Vaisala SBD 23 also removed and brought back to lab . Iridium transmitter needs firmware upgraded.'),
(@con_inst_id,'2010-10-08 00:00:00','Randy Bott updated Iridium transmitter firmware.'),
(@con_inst_id,'2010-10-28 20:09:00','Put in LOG mode for extended testing outside Bldg. 3-Full suite of SBE and Met sensors per standard TFLEX deployment . -jms'),
(@con_inst_id,'2010-10-28 00:00:00','1-SBE37 TC-SMP, 5-SBE37 TC-IM, 4-SBE39 T-IM, 2-SBE39 TP-IM, 1-AQUADOPP CM--swr, rain,gill,atrh'),
(@con_inst_id,'2010-11-02 19:50:00','Stopped LOGGING'),
(@con_inst_id,'2010-11-02 20:10:00','Restarted LOGGING w/new CAL file to reflect addition of new Gill'),
(@con_inst_id,'2010-11-15 00:00:00','Last transmission received from TFLEX can -jms'),
(@con_inst_id,'2010-11-17 00:00:00','Tried to establish comms with TLEX can via term cable. No Joy. System not responding -jms'),
(@con_inst_id,'2010-11-18 16:20:00','Tried restarting system via Iridium call at 0000Z (16:00 local). No carrier -jms'),
(@con_inst_id,'2010-11-21 00:00:00','System brought into lab. '),
(@con_inst_id,'2010-11-22 00:00:00','Burned in V1.10 100514 PAPA VERSION (due to failure of v1.11 100813)'),
(@con_inst_id,'2010-11-22 00:00:00','System back out to test stand. All sensors plugged into face plate. DID NOT apply power.'),
(@con_inst_id,'2010-11-22 22:06:00','Powered up system-RF comms good. No GPS ATRH=OK, Wind-No U NO V, SWR = OK, Rain = OK SST = OK, NO Induc. Put into LOG via RF'),
(@con_inst_id,'2010-11-22 00:00:00','FAST MODE DATE: Induc = OK, NO Wind, ATRH = OK, SWR = OK, Rain = OK, SST = OK, GPS = YES'),
(@con_inst_id,'2010-12-02 17:30:00','Checked data , NO wind vectors, reading 1E35.'),
(@con_inst_id,'2010-12-03 17:00:00','Stopped LOGGING to test wind problem. Gill not making numbers, reading 1E35, swapped sensor & cable. Sent initwindsonic cmd, which worked. Sent initsparton. Compass working & windsonic working, but not producing vectors, still reads 1E35'),
(@con_inst_id,'2010-12-03 17:45:00','Brought inside and gave can to Pat for testing.'),
(@con_inst_id,'2010-12-03 18:00:00','Pat says the wind problem is software related, the older version of software V1.10 100514, is not compatible with the Sparton compass. Sparton data reads 000 (not 1E35). Pat will have to modify V1.10 100514 to work with the Sparton compass.'),
(@con_inst_id,'2010-12-06 22:00:00','Pat updated firmware to v1.12 101206, which fixes Sparton compass problem with v 1.10 100514.'),
(@con_inst_id,'2010-12-06 23:00:00','START of TESTING for firmware v1.12 101206 with full set of deployment sensors. XMIT, GPS, ALL sensors working, put in LOG mode.'),
(@con_inst_id,'2011-01-28 16:50:00','STOPPED TEST. Brought Can inside to upgrade firmware to 1.11 100805.'),
(@con_inst_id,'2011-01-28 20:00:00','STARTED wind & ATRH test at the Grassy Knoll (on top of the van)'),
(@con_inst_id,'2011-02-01 23:40:00','STOPPED test, added SW rad, RESTARTED test on Grassy Knoll.'),
(@con_inst_id,'2011-02-02 21:10:00','STOPPED test, Changed Iridium 1st call time from 00:00 to 00:20, then RESTARTED test on Grassy Knoll'),
(@con_inst_id,'2011-02-07 18:15:00','STOPPED test, did xmit, loaded deploy calfile, connected new SW rad 35951, then RESTARTED.'),
(@con_inst_id,'2011-02-09 18:10:00','STOPPED test, did xmit, Grassy Knoll testing done. Brought back to TAO lab for IO2-11 shipping.'),
(@con_inst_id,'2011-06-08 17:00:00','Updated firmware to version 1.11 110408, which changes Iridium Listen call up time to 2200 GMT. '),
(@con_inst_id,'2011-06-09 22:20:00','Started test outside Bldg 3 for PI1-11-RB, 20N-38W, full sensors suite.'),
(@con_inst_id,'2011-06-28 00:00:00','Test finished for PI1-11'),
(@con_inst_id,'2011-07-07 00:00:00','Shipped for PI1-11'),
(@con_inst_id,'2011-07-30 00:00:00','Deployed at 20N-38W on PI1-11-RB, PT001'),
(@con_inst_id,'2013-01-13 00:00:00','Recovered from 20N-38W, PT001 on PI3-12-RB. Steve Kunze dumped 66.5MB of data after a 17+ deployment.'),
(@con_inst_id,'2014-02-10 00:00:00','Removed MET board. Gave to Pat to track down Druck not working on MET board for OCS folks.'),
(@con_inst_id,'2014-03-26 00:00:00','Updated wiring. Added 1KOhm resistor and Pin 22 wire on Iridium DB25. Removed incorrect ground connection for IM faceplate connector. Grounded to IM only from Ground faceplate connector.'),
(@con_inst_id,'2014-03-27 00:00:00','Upgraded firmware to v1.12, 140211'),
(@con_inst_id,'2014-05-22 00:00:00','PreTest for Bai Long'),
(@con_inst_id,'2014-06-27 00:00:00','Start of BaiLong test, setup at the grassy knoll by Mike Strick while I was at sea on KEO.'),
(@con_inst_id,'2014-07-25 00:00:00','Stopped TFLEX0001 to dump high frequency Flash Ram data per Paul\'s instructions, then put back into LOG mode.'),
(@con_inst_id,'2014-09-16 00:00:00','BaiLong test finished.'),
(@con_inst_id,'2015-04-07 00:00:00','Removed JP24 Solder bridge on CPU Bd. Changed R4 to 887 Ohms on CPU bd. '),
(@con_inst_id,'2015-04-07 00:00:00','Updated firmware to version 1.12, 150313.'),
(@con_inst_id,'2015-04-10 00:00:00','Ran 2-day Current drain test with all sensors in doghouse, 14.65mA average (promedio)'),
(@con_inst_id,'2015-10-28 00:00:00','Changed Rain Shield ground from Seawater to Chassis, power PIN 1 ground.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2010-07-23 21:30:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0002.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0002' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2010-07-13 00:00:00','Start of first TEST on buoy in and out of water inside boat basin with everything working, all Met sensors connected and 1 SBE39TP, 1 SBE37TC, and 1 Aquadopp.'),
(@con_inst_id,'2010-07-21 20:30:00','Start of moored buoy test. Buoy towed outside of boat basin and anchored in lake.'),
(@con_inst_id,'2010-07-28 00:00:00','Vaisala SBD 23 added to buoy for comparison'),
(@con_inst_id,'2010-08-11 20:20:00','Taken off buoy for repair, GPS not working.'),
(@con_inst_id,'2010-09-02 21:30:00','Back outside on test outside Bldg 3, GPS repaired, updated firmware to v1.11 100813, added Aquadopp CM.'),
(@con_inst_id,'2010-09-20 16:00:00','Noticed that this TFLEX unit, 0002, was only getting GPS position updates sporadically while set to every 6 hours, so will try to change it to once per day. Pat says this could be because it\'s testing outside of Bldg 3, and the building is interfering with GPS satellite reception.'),
(@con_inst_id,'2010-09-20 21:00:00','Reset, took out of LOG mode, updated Configuration to set \"GPS Interval\" from every 6 hours to 24 hours (once/day). Also updated \"GPS set time\" to 12:15. Then put back into LOG mode.'),
(@con_inst_id,'2010-09-22 18:00:00','Noticed that GPS not coming in at all, no positions.'),
(@con_inst_id,'2010-09-23 20:30:00','Stopped test, disconnected battery and all sensors and brought in TFLEX 0002 to repair GPS.'),
(@con_inst_id,'2010-10-05 17:30:00','GPS Repaired, Started test out in EDD Dog House shed with NO sensors connected.'),
(@con_inst_id,'2010-10-06 15:45:00','Stopped test. Brought inside to use to test some Gill winds.'),
(@con_inst_id,'2010-10-06 16:35:00','Put back out on test in Dog house shed to test GPS, set for every 6 hours'),
(@con_inst_id,'2010-10-08 16:20:00','Stopped test. GPS working okay. Brought inside lab to upgrade Iridium transmitter firmware.'),
(@con_inst_id,'2010-10-08 00:00:00','Randy Bott updated Iridium transmitter firmware.'),
(@con_inst_id,'2010-11-04 16:51:00','Started LOGGING. SPARE TFLEX SYSTEM. '),
(@con_inst_id,'2010-11-04 00:00:00','INDUCTIVE SET TO START 19:00 GMT'),
(@con_inst_id,'2010-11-05 00:00:00','NO INDUCTIVE COMMS.'),
(@con_inst_id,'2010-11-05 15:29:00','Taken out of LOG mode'),
(@con_inst_id,'2010-11-05 15:48:00','Put back into LOG mode. Loaded new cal file with AQUADOPP'),
(@con_inst_id,'2010-11-05 16:20:00','RF update. NO SSTC (SBE37TC-SMP)-->All other sensors GOOD'),
(@con_inst_id,'2010-11-05 20:44:00','Restart system in LOG. Rectified SBE37TC-SMP issue. Must OUTPUT SALINITY from instrument for TFLEX to read.'),
(@con_inst_id,'2010-11-05 00:00:00','ATRH=OK, RAIN=OK, SWR=OK, TESTIND=OK, SSTC=OK'),
(@con_inst_id,'2010-11-15 00:00:00','Last transmission received from TFLEX can -jms (due to failure of v1.11 100813)'),
(@con_inst_id,'2010-11-17 00:00:00','Tried to establish comms with TLEX can via term cable. No Joy. System not responding -jms'),
(@con_inst_id,'2010-11-17 00:00:00','Brought system into Pat\'s Lab (can+batt connected). Pat running diagnostics on it. -jms'),
(@con_inst_id,'2010-12-06 22:00:00','Pat updated firmware to v1.12 101206, which fixes Sparton compass problem with v 1.10 100514.'),
(@con_inst_id,'2010-12-07 00:30:00','START of TESTING for firmware v1.12 101206 with set of spare deployment sensors, SBE39T, SBE39TP, SBE37TC, Aquadopp. XMIT, GPS, ALL sensors working, put in LOG mode.'),
(@con_inst_id,'2010-12-09 21:20:00','Stopped TESTING so Pat can do some bench testing & current drain testing.'),
(@con_inst_id,'2010-12-13 22:45:00','ReStarted TESTING in LOG mode, v1.12 101206. (see above for sensors)'),
(@con_inst_id,'2011-01-26 18:00:00','Disconnected inductive test cable, NO inductive sensors connected. Brought sensors inside to prep for PI2-10 cruise shipment.'),
(@con_inst_id,'2011-01-28 17:05:00','STOPPED TEST. Brought Can inside to upgrade firmware to 1.11 100805.'),
(@con_inst_id,'2011-01-28 20:00:00','STARTED wind & ATRH test at the Grassy Knoll (on top of the van)'),
(@con_inst_id,'2011-02-01 23:40:00','STOPPED test, added SW rad, RESTARTED test on Grassy Knoll'),
(@con_inst_id,'2011-02-02 21:10:00','STOPPED test, Changed Iridium 1st call time from 00:00 to 00:30, then RESTARTED test on Grassy Knoll'),
(@con_inst_id,'2011-02-07 18:15:00','STOPPED test, did xmit, loaded deploy calfile, connected new SW rad 34934, then RESTARTED.'),
(@con_inst_id,'2011-02-09 18:10:00','STOPPED test, did xmit, Grassy Knoll testing done. Brought back to TAO lab for IO2-11 shipping.'),
(@con_inst_id,'2011-06-08 17:00:00','Updated firmware to version 1.11 110408, which changes Iridium Listen call up time to 2200 GMT. '),
(@con_inst_id,'2011-06-09 23:30:00','Started test outside Bldg 3 for PI1-11-RB, 20N-38W, Spare system & sensors'),
(@con_inst_id,'2011-06-27 17:30:00','Stopped test for PI1-11-RB.'),
(@con_inst_id,'2011-06-27 00:00:00','Pat is doing a current drain test of this system 0002 out in the dog house outside.'),
(@con_inst_id,'2011-06-28 00:00:00','Pat finished with current drain testing, resulting in 24hr average of 17mA.'),
(@con_inst_id,'2011-07-07 00:00:00','Shipped as Spare for PI1-11.'),
(@con_inst_id,'2011-09-08 00:00:00','Air shipped back from PI1-11, Cape Town'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-02 00:00:00','Updated firmware to version 1.11, 111121'),
(@con_inst_id,'2012-01-24 00:45:00','Started test outside Bldg 3 for IO4-12, all sensors except LWR, BP, and 500 TP (sensor at Seabird for Calibration). Magnetic variation set to 0 degrees.'),
(@con_inst_id,'2012-01-31 23:00:00','IO4-12 TEST completed.'),
(@con_inst_id,'2012-07-18 00:00:00','Shipped for IO4-12, Feb 7, 2012, spare system, but not deployed.'),
(@con_inst_id,'2012-12-18 00:00:00','Retasked for IO7-12.'),
(@con_inst_id,'2012-12-29 00:00:00','Deployed at 12N-90E on IO7-12-SN, RT002'),
(@con_inst_id,'2013-06-04 00:00:00','FAILED, stopped transmitting at 12N-90E, RT002.'),
(@con_inst_id,'2013-06-06 00:00:00','The TFLEX system at 12n90e (TFLEX-1002, deployment RT-002) started to report system resets on May 29 after about 150 days of problem-free operation. The Hygroclip AT/RH data ended after the first reset, and other sensors came back online with some data loss, as has been the observed pattern in other FLEX/TFLEX systems. Several more resets occurred on June 4. There have been no dialin calls for about the last 48 hours (last was 20123-06-04 19:00).'),
(@con_inst_id,'2014-05-08 00:00:00','TFLEX0002 finally shipped back from India. Failure of TFLEX0002 caused by Hygroclip 60194533 failure. Somehow saltwater got into the pigtail interconnection cable, RMG-4-MP male pins, which corroded and shorted out system.'),
(@con_inst_id,'2014-05-09 00:00:00','Did a bench-top current drain test of system with no sensors connected inside lab. Currrent drain average was 6.3mA.'),
(@con_inst_id,'2015-04-30 00:00:00','Found Serial board missing Q2 & Q5 with jumpers shorted? So replaced Serial board.'),
(@con_inst_id,'2015-04-30 00:00:00','Changed R4 to 887Ohms and removed solder bridge on JP24 on CPU board.'),
(@con_inst_id,'2015-04-30 00:00:00','Upgraded Firmware to version 1.12, 150313.'),
(@con_inst_id,'2015-11-29 00:00:00','FAILED on RT002, at 12N-90E. Hygroclip cable not sealed (pigtail to interconnection connector), so saltwater leaked in and shorted out, shorting out TFLEX electronics. System works, but has a high current drain.'),
(@con_inst_id,'2015-05-01 00:00:00','Tried to do a current drain inside the lab, 1st time with roof-mounted antennas, but this system has a higher than expected current drain at around 60mA. More boards need to be replaced.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2010-07-13 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0003.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0003' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2010-09-02 00:00:00','This unit had problems, but is finally fixed. Everything is working, but it has never been put outside on test. Pat has used it for firmware development on his bench, but that\'s about it.'),
(@con_inst_id,'2010-09-23 23:30:00','Started 1st test with all sensors, SBE39TP & Nortek Aquadopp. Installed Sim card, ran xmit and successfully registered with satellite. Successfully tested all sensors and GPS. So far though, have not been able to talk to the RF modem.'),
(@con_inst_id,'2010-09-27 18:30:00','Ended test, brought TFLEX0003 inside lab, RF modem not working.'),
(@con_inst_id,'2010-09-29 21:00:00','Back out on test, replaced RIG board (that Pat McLain gave me). RF modem now working.'),
(@con_inst_id,'2010-10-07 20:20:00','TEST ended. Brought TFLEX0003 in lab to upgrade Iridium transmitter firmware.'),
(@con_inst_id,'2020-10-08 00:00:00','Randy Bott updated Iridium transmitter firmware.'),
(@con_inst_id,'2010-12-06 22:00:00','Pat updated firmware to v1.12 101206, which fixes Sparton compass problem with v 1.10 100514. (due to failure of v1.11 100813)'),
(@con_inst_id,'2010-12-07 00:00:00','Pat wants to revert back to the firmware version that is one version before the version that failed. v1.11 100813 failed, the version before that is v1.11 100805. Pat installed version 1.11100805 into system 0003.'),
(@con_inst_id,'2010-12-08 23:08:00','STARTED Test in LOG mode of v1.11, 100805 (2nd system with TFLEX0000). XMIT, GPS, ALL sensors working. Connected Gill Wind, SWR, Rain, Hygroclip ATRH, SSTC (SBE37TC), plus Inductive senors: SBE39T, SBE39TP, Aquadopp.'),
(@con_inst_id,'2010-12-09 21:40:00','STOPPED test. Noticed that RF modem was still in continuous mode for both systems 0000 & 0003 running v1.11 100805. RF modem should only be in continuous mode for 1 hour after LOG mode is initiated (determined by configuration setting).'),
(@con_inst_id,'2010-12-10 19:30:00','Did mods on circuit boards to decrease snooze current drain (Snooze power reduction mods per Pat), replaced and removed resistors on the 332, MET, and Serial boards.'),
(@con_inst_id,'2010-12-13 23:40:00','STARTED Test in LOG mode, v1.11 100805, with all Deployment MET sensors, 1 SBE39T, 1 SBE39TP, & 1 Aquadopp.'),
(@con_inst_id,'2010-01-07 17:00:00','Noticed Aquadopp temperature (address 22, depth 30m in calfile) reading constant 22.17 for all data.'),
(@con_inst_id,'2011-01-19 00:00:00','Mentioned to Dan about Nortek temp stuck at 22.17. Turns out that all the Aquadopp data is the same, meaning the Nortek is not in LOG mode, that the TFLEX is just going out and getting the same (last) data sample. OOPS! Didn\'t catch this...'),
(@con_inst_id,'2011-01-27 17:00:00','Disconnected inductive test cable, NO inductive sensors connected. Brought sensors inside to prep for PI2-10 cruise shipment.'),
(@con_inst_id,'2011-02-07 23:00:00','Disconnected Power & brought TFLEX0003 inside TAO lab.'),
(@con_inst_id,'2011-04-20 00:00:00','RF antenna fitting (through faceplate) broke. Took TFLEX Electronics apart, removing faceplate, so RF antenna mount hole could be tapped at the Machine Shop for new RF antenna fitting.'),
(@con_inst_id,'2011-05-05 00:00:00','RF antenna faceplate hole tapped. Needs to be re-assembled.'),
(@con_inst_id,'2011-09-26 00:00:00','Installed new antenna with new type fitting. Re-assembled and tested okay.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-01 00:00:00','Updated firmware to v1.11, 111121, which fixes wind, Aquadopp, and Iridium problems.'),
(@con_inst_id,'2011-12-02 00:00:00','Start of test for IO2-12-BJ. All MET sensors, except LW & Baro. All inductive sensors, except no TPs (at Seabird for CAL). Setup outside next to tube rack.'),
(@con_inst_id,'2011-12-02 17:00:00','Reset and stopped logging. SSTC not working. SBE37SMP setup problem. Had to set Outputexecutedtag=N, so an HTML tag \"executed\" would not be used. '),
(@con_inst_id,'2011-12-02 18:00:00','System restarted in Log mode. SSTC now working.'),
(@con_inst_id,'2011-12-16 16:45:00','Noticed Hygroclip 60780300 at max humidity of 100% on multiple days for multiple hours at a time. Sensor is laying down on its side. Will set sensor upright on by mounting in one of the tube rack mounts.'),
(@con_inst_id,'2011-12-19 00:00:00','Hygroclip 60780300 continues to read higher than other sensors, maxing out at 100% for multiple hours.'),
(@con_inst_id,'2011-12-19 18:45:00','Reset and stopped logging. Added 2 TPs, and swapped hygroclip to 60194537. '),
(@con_inst_id,'2011-12-19 18:55:00','Restarted test, put back in LOG mode.'),
(@con_inst_id,'2012-01-03 22:03:00','Successfully sent Rudics dialout command XO to turn-on the RF modem'),
(@con_inst_id,'2012-01-04 18:50:00','Reset, taken out of LOG mode, IO2-12 test concluded.'),
(@con_inst_id,'2012-04-01 00:00:00','NOT deployed on IO3-12-BJ. Air shipped back to Seattle.'),
(@con_inst_id,'2012-07-20 00:00:00','Upgraded firmware from 1.11, 111121 to 120504.'),
(@con_inst_id,'2012-07-20 21:30:00','Re-configured cal file for PI3-12-RB, 20N-38W deployment, added Baro & LW'),
(@con_inst_id,'2012-07-20 23:30:00','Started test for PI3-12'),
(@con_inst_id,'2012-07-26 16:25:00','Ended test for PI3-12'),
(@con_inst_id,'2012-07-30 00:00:00','Shipped for PI3-12-RB.'),
(@con_inst_id,'2013-01-06 00:00:00','Deployed at 20N-38W, PT002, on PI3-12-RB.'),
(@con_inst_id,'2013-11-20 00:00:00','Rec PT002, Failed? Xmit problems?'),
(@con_inst_id,'2015-04-14 00:00:00','Removed JP24 Solder bridge on CPU Bd. Changed R4 to 887 Ohms on CPU bd. '),
(@con_inst_id,'2015-04-14 00:00:00','Verified MET board with updated U1, U2, U40 TI chips.'),
(@con_inst_id,'2015-04-14 00:00:00','Updated firmware to version 1.12, 150313.'),
(@con_inst_id,'2015-04-17 00:00:00','Tried to start a current drain test in the doghouse outside, but this system could not get through on the Iridium satellite when sending the XMIT command, so I replaced the Irdium antenna cable, but still no luck. Needs further testing.'),
(@con_inst_id,'2015-04-20 00:00:00','Ran current drain test over the weekend. Current drain okay at 14.9mA, BUT, no 1003 data transmissions got through Iridium. Saw platform ID 2003 for some reason.'),
(@con_inst_id,'2015-07-05 00:00:00','Iridium Transmit problems. Does not get through to Iridium satellite. Swapped wiring, antenna cable, IR antenna, NONE of this fixed the problem. Swapped sim card on IR xmitter. No fix.'),
(@con_inst_id,'2017-06-09 00:00:00','Updated Rain shield ground to power ground.'),
(@con_inst_id,'2017-06-09 00:00:00','Troubleshooting Iridium Transmit problem, replaced Serial bd, CPU board, and installed NEW Iridium Modem, which finally fixed the Iridium transmit problem. Had to change the chassis frame to mount the new Iridium modem.'),
(@con_inst_id,'2017-06-16 00:00:00','Ran current drain test for 3 days, 13.82mA Average.'),
(@con_inst_id,'2016-10-24 00:00:00','Back from Grassy Knoll, Gill wind Spartan vs. Ocean Server test.'),
(@con_inst_id,'2016-10-24 00:00:00','Upgraded firmware from 2.01, 170530.'),
(@con_inst_id,'2018-03-13 00:00:00','Sent as the Spare for PI4-17-RB (PNE 2018). Sent with v1.16, but Steve needed v2.01. Since he forgot to take the PE Micro firmware interface box, he could not change the firmware in TFLEX0003, he instead swapped in the CPU from his problem system TFLEX0009, which had bad Iriudium coms and corrosion on its Connector board.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2010-09-02 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0004.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0004' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-10-06 00:00:00','Ran current drain test with v1.11, 110408, problem with RF modem not turning off and powering down.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-02 00:00:00','Updated firmare to version 1.11, 111121.'),
(@con_inst_id,'2011-12-06 00:10:00','Started test for IO2-12, put in LOG mode with all MET sensors except LWR & Baro. All subsurface sensors except no SBE39TPs (which are at Seabird getting calibrated).'),
(@con_inst_id,'2011-12-07 17:58:00','Stopped system, took out of LOG mode. Battery voltages not working, reading high, 20v with 10v input.'),
(@con_inst_id,'2011-12-08 00:00:00','Pat tried to troubleshoot voltage problem on CPU board, A/D CH 6, but could not fix it, so replaced CPU board. New CPU board working, battery voltage telemetry is now working.'),
(@con_inst_id,'2011-12-16 19:50:00','Started test for IO2-12, put in LOG mode with all MET sensors except LWR & Baro, plus 4 inductive sensors: TC, T, Nortek, TP. Located outside of Bldg 3 in tube test rack.'),
(@con_inst_id,'2012-01-05 22:05:00','Successfully sent Rudics dialout command XO to turn-on the RF modem'),
(@con_inst_id,'2012-01-06 19:00:00','IO-12 TEST COMPLETE, disconnected power from TFLEX0004 electronics (accidentally, instead of cntrl-C out of LOG mode)'),
(@con_inst_id,'2012-04-01 00:00:00','NOT used on IO3-12-BJ, air shipped back to Seattle.'),
(@con_inst_id,'2012-07-20 00:00:00','Updated firmware to version 1.11, 120504'),
(@con_inst_id,'2012-07-23 21:40:00','Started testing outside for PI3-12, spare system. Reconfigured with new cal file with LWR & Baro.'),
(@con_inst_id,'2012-07-27 16:00:00','Ended testing for PI3-12'),
(@con_inst_id,'2012-07-30 00:00:00','Shipped for PI3-12-RB, Spare system.'),
(@con_inst_id,'2013-02-04 00:00:00','Spare system from PI3-12-RB, not deployed. Will be shipped back after cruise.'),
(@con_inst_id,'2013-03-15 00:00:00','Spare system back at PMEL from PI3-12-RB, not deployed. '),
(@con_inst_id,'2013-03-18 19:00:00','Updated firmware to version 1.12, 130225.'),
(@con_inst_id,'2013-03-18 21:00:00','Started testing outside for PI3-13 (to replace TFLEX0007 with data Flash RAM write problem).'),
(@con_inst_id,'2013-03-19 17:00:00','Accidently knocked over TFLEX0004 electronics can while painting the Nortek heads, which disconnected & reconnected power, resetting LOG mode.'),
(@con_inst_id,'2013-03-21 16:30:00','Stopped TEST for PI3-13.'),
(@con_inst_id,'2013-07-21 00:00:00','Deployed at 8S-67E, RT004, on IO3-13-SK'),
(@con_inst_id,'2014-09-04 00:00:00','Mooring ADRIFT, RECOVERED?'),
(@con_inst_id,'2015-10-31 00:00:00','Recovered RT004, IO4-15-SN, at 7 38.10S 60 11.27E. ATRH broken, Anemometer damaged on recovery. All instruments recovered, all nylon lost. Release Lost. '),
(@con_inst_id,'2016-07-15 00:00:00','Back from India, TFLEX0004 physically undamaged. Mooring vandalized and set adrift. Needs checkout.'),
(@con_inst_id,'2017-06-13 00:00:00','Verified U1 & U2 on MET board TI ICs, removed solder bridge JP24 on CPU board, updated Rain Ground from Seawater to Power ground.'),
(@con_inst_id,'2017-06-13 00:00:00','Installed firmware v1.12, 150313 to do current drain test.'),
(@con_inst_id,'2017-06-13 00:00:00','Found corrosion on connector board pins, so replaced connector board.'),
(@con_inst_id,'2017-06-19 00:00:00','Ran current drain test for 3 days, 17.26mA Ave. See intermittent spurious command characters in always 1 of 6 Aquadopp IM data lines in the Iridium buffer: examples >/sa >/sam'),
(@con_inst_id,'2017-09-07 00:00:00','Replaced GND faceplate connector (adding pin1&2, before only pin2). Installed NEW IMM and NEW Serial board in an attempt to fix the read command characters (>/sa & >/sam) intermittantly corrupting one velocity aquadopp data string (in a 6 hour data buffer).'),
(@con_inst_id,'2017-09-11 00:00:00','Ran a new current drain test and Aquadopp data test (with new IMM & Serial bd). Ran for 4 Days, 14.03mA average.'),
(@con_inst_id,'2017-09-11 00:00:00','Upgraded to v2.01, 170530 Firmware'),
(@con_inst_id,'2018-10-30 00:00:00','Back from Indonesia, IO1-18, not deployed.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0005.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0005' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-02 00:00:00','Updated firmware to version 1.11, 111121.'),
(@con_inst_id,'2011-12-06 21:45:00','Started test, put into LOG mode with all MET sensors, except LWR & Baro. All inductive sensors, except no TPs. No instrument cases available, so put everything in Dog House outside Bldg 3.'),
(@con_inst_id,'2011-12-16 19:00:00','Reset test, took out of LOG mode. Added 2 TPs to inductive test line.'),
(@con_inst_id,'2011-12-16 19:15:00','Restarted test, put back in LOG mode, loaded new CAL file with added 2 TPs.'),
(@con_inst_id,'2012-01-03 22:06:00','Successfully sent Rudics dialout command XO to turn-on the RF modem'),
(@con_inst_id,'2012-01-04 23:37:00','Reset, taken out of LOG mode, IO2-12 test concluded.'),
(@con_inst_id,'2012-04-01 00:00:00','NOT deployed on IO3-12-BJ. Air shipped back to Seattle.'),
(@con_inst_id,'2012-05-29 00:00:00','Air shipped back from Indonesia from IO3-12-BJ'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-20 00:30:00','Started test for IO3-13 without inductive sensors (due to firmware problems).'),
(@con_inst_id,'2013-02-25 17:50:00','Stopped test without inductive sensors.'),
(@con_inst_id,'2013-02-25 23:00:00','Updated firmware to v1.12, 130225, fixing microcat address #09 problem.'),
(@con_inst_id,'2013-02-26 01:30:00','Started testing for IO3-13 with full set of sensors, all calibrated.'),
(@con_inst_id,'2013-03-18 17:45:00','Stopped outside TEST for IO3-13.'),
(@con_inst_id,'2013-07-18 00:00:00','Deployed at 12S-67E, RT003, on IO3-13-SK'),
(@con_inst_id,'2014-01-11 00:00:00','Inductive subsurface data FAILED and stopped transmitting, reading 3E+35 & 1E+35 on RT003, 12S-67E.'),
(@con_inst_id,'2014-01-11 00:00:00','*LOST AT SEA on RT003, 12S-67E.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0006.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0006' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-02 00:00:00','Updated firmware to version 1.11, 111121'),
(@con_inst_id,'2012-01-26 19:40:00','Started test outside Bldg 3 for IO4-12. Spare system with 1 TC, 1 T, Nortek, no LWR, no BP. Magnetic variation set to 0 degrees.'),
(@con_inst_id,'2012-02-01 18:20:00','IO4-12 Test complete'),
(@con_inst_id,'2012-07-18 00:00:00','Shipped for IO4-12, Feb 7, 2012, spare system, but not deployed.'),
(@con_inst_id,'2012-12-18 00:00:00','Retasked for IO7-12, spare system.'),
(@con_inst_id,'2013-01-10 00:00:00','IO7-12-SN spare system, not deployed. Will be shipped back from India.'),
(@con_inst_id,'2013-04-10 00:00:00','Back from IO7-12-SN.'),
(@con_inst_id,'2013-05-30 00:00:00','Updated firmware to version 1.12, 130306.'),
(@con_inst_id,'2013-08-09 19:00:00','Started testing outside for PI3-13-RB, PT003, 20N-38W'),
(@con_inst_id,'2013-08-19 18:00:00','Stopped PI3-13 test to upgrade firmware to v1.12, 130816'),
(@con_inst_id,'2013-08-19 21:30:00','Re-started PI3-13 testing outside.'),
(@con_inst_id,'2013-08-26 23:05:00','Disconnected Inductive all inductive sensors and SSTC microcat.'),
(@con_inst_id,'2013-08-30 19:20:00','Stopped PI3-13 testing.'),
(@con_inst_id,'2013-11-20 00:00:00','FAILED on PT003, works (calling in), but all sensors reading 1E+35. Pat thinks its something power related.'),
(@con_inst_id,'2015-01-06 00:00:00','Recovered on PI3-14-EN. PT003 Buoy found with tower missing. Faceplate trashed, with corroded bulkhead connectors. Antenna housing dragged across deck during recovery, plus RF antenna broken.'),
(@con_inst_id,'2017-05-15 00:00:00','System re-purposed for TFLEX topsection testing. SIM card taken out and used in FLEX box for firmware testing.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0007.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0007' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-11-21 00:00:00','Pat updated firmware to v1.11, 111121, which fixes wind, Aquadopp, and Iridium problems.'),
(@con_inst_id,'2011-11-21 23:50:00','Started wind test outside next to compass stand, sensors mounted on a TFLEX tower. ATLAS system is running next to it.'),
(@con_inst_id,'2011-11-22 00:00:00','Rain gauge set upright to collect rain.'),
(@con_inst_id,'2012-01-03 22:01:00','Successfully sent Rudics dialout command XO to turn-on the RF modem'),
(@con_inst_id,'2012-01-03 23:13:00','Stopped TEST, took out of LOG mode via RF modem. Loaded NEW cal file with 16.5deg Magnetic Variation.'),
(@con_inst_id,'2012-01-03 23:15:00','Re-started LOG mode with new cal file (and 16.5deg magnetic variation).'),
(@con_inst_id,'2012-04-09 16:30:00','STOPPED TEST, reset with com cable, dumped data, removed baro & reloaded cal file taking out baro. Moved tower, swapped positions with ATLAS tower. Re-aligned compass heading to north, reading 359.9degs.'),
(@con_inst_id,'2012-04-09 17:15:00','Re-started LOG mode (minus baro sensor), kept 16.5deg magnetic variation, compass aligned to north, 359.9degs.'),
(@con_inst_id,'2012-04-23 16:40:00','STOPPED LOG mode. Mike Strick stopped logging to re-calibrate the Gill wind\'s Sparton compass. There\'s a 6 degree error(?) between the TFLEX and ATLAS winds that cannot be explained.'),
(@con_inst_id,'2012-04-23 17:13:00','Re-started LOG mode with re-calibrated Gill wind Sparton compass (done by Mike Strick).'),
(@con_inst_id,'2012-07-11 00:00:00','Patrick reset while I was at sea on KEO, Time/Date??? Maybe on July 11th, sometime after 1900 GMT, For training with Linda Stratton.'),
(@con_inst_id,'2012-08-04 01:00:00','TEST STOPPED when the test battery pack Logic voltage dropped below 4.5 volts. This test battery pack was a used, medium-sized pack, that lasted for continuous testing since November of 2011.'),
(@con_inst_id,'2012-08-23 16:45:00','TEST re-started (by Mike Strick & Linda Stratton) using new test battery pack. For wind test Atlas comparison outside next to compass stand.'),
(@con_inst_id,'2013-01-13 01:00:00','DATA Stopped when Logic Voltage on the test battery pack went below 5 volts.'),
(@con_inst_id,'2013-01-22 00:00:00','NO DATA written to 2GB flash RAM card during wind test outside PMEL.'),
(@con_inst_id,'2013-01-23 00:00:00','Installed and successfully formated a new 128MB Flash RAM memory card. This card tested okay, with data written to it.'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-19 23:30:00','Tried to start testing for IO3, but had an inductive communications problem with the microcats. No microcat data when using the \"TESTIND\" command. A firmware error is causing all microcats to be addressed at #09 only.'),
(@con_inst_id,'2013-02-20 00:30:00','Started test for IO3-13 without inductive sensors (due to firmware problems)'),
(@con_inst_id,'2013-02-25 17:50:00','Stopped test without inductive sensors.'),
(@con_inst_id,'2013-02-25 18:10:00','Updated firmware to v1.12, 130225, fixing microcat address #09 problem.'),
(@con_inst_id,'2013-02-25 23:30:00','Started testing for IO3-13 with full set of sensors, all calibrated.'),
(@con_inst_id,'2013-03-18 17:45:00','Stopped outside TEST for IO3-13. Data Flash RAM write problem (again!) Data \"File size\" increased on a daily basis, but then when system taken out of LOG mode, File size went to 0.0 Kbytes. Plus, even though the system was taken of LOG mode with 2 Ctrl C\'s while powered in LOG mode, data \"File end date\" was wrong.'),
(@con_inst_id,'2015-03-25 00:00:00','This system was used by Ryan Wells to generate the FLEX complete wiring diagram. For some reason R2 was missing on the Serial board, so installed R2 1 Ohm, 1% resistor.'),
(@con_inst_id,'2015-03-25 00:00:00','TFLEX007 had a data write problem during outside testing, so replaced CPU board and replaced Flash RAM card.'),
(@con_inst_id,'2015-03-25 00:00:00','Installed Firmware in new CPU board, ver 1.12, 150313. Formated new 2GB Flash RAM card.'),
(@con_inst_id,'2015-03-25 00:00:00','Updated CPU R4 to 887 Ohms, removed solder bridge on CPU JP24.'),
(@con_inst_id,'2015-04-13 00:00:00','Installed R44 267K & R45 1.87M resistors on CPU board to enable xmit battery voltage monitor telemetry'),
(@con_inst_id,'2013-04-15 00:00:00','Finished current drain 2 day test with all sensors in the doghouse, 14.60mA Ave. Dumped data. Data written to Compact Flash OKAY.'),
(@con_inst_id,'2015-07-15 00:00:00','Air shipped to IO1-15, not deployed, wrong buoy, so re-tasked to IO4-15.'),
(@con_inst_id,'2018-03-02 00:00:00','Back from India Air shipment, November 2018. Rec RT-006, 12S81E, recovered 2016-11-26. No failures indicated during deployment in System Status on TFLEX data page.'),
(@con_inst_id,'2018-03-02 00:00:00','Tried to start benchtop current drain testing. Everything working, but Iridium. Iridium XMIT command registers, but then sends Platform ID 6 times and times out, does not send data. But this system had Iridium tranmsit problems during the deployment.'),
(@con_inst_id,'2018-03-05 00:00:00','Updated Rain gauge shield grounding to power ground, Rain Pin1-to-Pin6, including installing new stainless bulkhead connector. Also installed new Ground bulkhead connector, connecting pin1 & pin2 together. Fixed crazy pin 22 on Iridium white wire line to solder pin on connector board, wiring it directly to J9 microfit connector. Plus cut out common power wire between compass and wind connectors on connector board.'),
(@con_inst_id,'2018-03-05 00:00:00','Updated firmware to version 2.10, 170530, plus updated Iridium first transmit time to 00:41.'),
(@con_inst_id,'2018-03-12 00:00:00','Ran a benchtop current drain test for 6 days with a 14.27mA average.'),
(@con_inst_id,'2018-03-13 00:00:00','Tried to test the XMIT Iridium test outside on internal pack, but got error \"No coms with modem\". Found that there was no power to Iridium modem. Took off Connector board and found that all 4 diodes were NOT soldered on one side. Soldered all diodes and fixed problem.'),
(@con_inst_id,'2018-05-03 00:00:00','Installed SS metal circuit board standoffs on bottom stack.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0008.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0008' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-03-01 00:00:00','Built NEW. Initially the CPU board would not program (firmware) while plugged into Serial Board. Found U36 installed backwards by stuffers. Dirk removed & replaced U36. Plugged in CPU board with repaired Serial board, was able to load firmware version 1.11, 111121.'),
(@con_inst_id,'2012-03-05 00:00:00','Tested all sensor inputs successfully, except inductive modem, which will not work with IMM version 1.14. NEEDS IMM v1.12. Also installed new sim card into Iridium modem.'),
(@con_inst_id,'2012-03-06 00:00:00','Installed new IMM with v1.12 firmware. Inductive circuit tested good after INITIMM command sent.'),
(@con_inst_id,'2012-03-07 00:00:00','XMIT & GPS tests good outside in Dog house.'),
(@con_inst_id,'2012-03-08 00:00:00','Did 3 day current drain test, 17mA ave recorded (with RF modem powered OFF).'),
(@con_inst_id,'2012-03-19 00:00:00','Started current drain test with all sensors connected.'),
(@con_inst_id,'2012-03-29 00:00:00','Ended current drain test with all sensors. Average current drain = 22.15mA.'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-05 00:00:00','NEW in lab, needs testing for LW & SW in log mode.'),
(@con_inst_id,'2015-03-27 00:00:00','Replaced MET board, U1, U2, & U40 wrong brand, not TI chips? Plus swapped MET bd to fix LW & SW issue, no data in LOG mode.'),
(@con_inst_id,'2015-03-27 00:00:00','Updated CPU R4 to 887 Ohms, removed solder bridge on CPU JP24, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-04-06 00:00:00','Did 3 day current drain test with all sensors in the doghouse, 13.86mA ave recorded (with RF modem powered OFF). Flash RAM data good. SW & LW data good.'),
(@con_inst_id,'2015-08-03 00:00:00','Shipped for PI3-15'),
(@con_inst_id,'2017-06-08 00:00:00','Updated Rain shield ground to power ground. Removed jumped wire between Pin7-Pin7 Power on Compass and wind sensor.'),
(@con_inst_id,'2017-06-08 00:00:00','Updated Iridium 1st call time to 00:42'),
(@con_inst_id,'2017-06-09 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, GPS, and Iridium XMIT. Needs current drain re-check.'),
(@con_inst_id,'2017-06-13 00:00:00','Ran current drain test, 14.77mA average over 3 days.'),
(@con_inst_id,'2017-09-14 00:00:00','Changed firmware to version 1.16, 161014, O2 version for PNE, PI4-17-RB cruise.'),
(@con_inst_id,'2017-11-17 00:00:00','PI4-17-RB Cruise delayed. Re-tasked 0008 for PI1-18-TH. Changed firmware to v2.01, 170530.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-03-01 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0009.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0009' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-03-01 00:00:00','Built NEW, bench tested okay, all sensors working, except Inductive modem, which will not work with IMM firmware v1.14. Loaded firmware v1.11, 111121. Installed new sim card into Iridium modem.'),
(@con_inst_id,'2012-03-05 00:00:00','Installed different IMM, firmware version 1.12, which fixed Inductive data. All sensor types working SBE37, SBE39, & Aquadopp.'),
(@con_inst_id,'2012-03-06 00:00:00','Tested out in Dog house, XMIT & GPS tested good, all sensor data coming through Iridium Rudics'),
(@con_inst_id,'2012-03-07 00:00:00','Did 24 hour current drain test, 20mA ave.'),
(@con_inst_id,'2012-03-16 00:00:00','Baro Failed during testing.'),
(@con_inst_id,'2012-03-29 00:00:00','Found problem with Baro. No power to Baro on MET board. Baro connected to12v Auxiliary power via Jumper JP4 pins 1&2, but Auxiliary power not working. Switched JP4 jumpers to pins 2&3, which connects main battery voltage, and Baro now working. BUT Auxiliary power circuit failed, with no 12v output. Not sure if Baro is the only channel connected to Auxiliary power.'),
(@con_inst_id,'2012-04-02 00:00:00','Removed U40 & Q14 from failed Auxiliary power circuit onTFLEX0009 MET board. Aux power failed and not needed, since Aux power is used only with Druck pressure sensor. The Druck requires a miniumum of 11v input. TFLEX does not use the Druck, so I just disabled the circuit by removing U40 & Q14.'),
(@con_inst_id,'2012-04-02 18:20:00','Start new current drain test with all sensors connected.'),
(@con_inst_id,'2012-04-05 15:40:00','Stopped test because SW&LW outputs failed. Current drain was about 23.2mA, but then went to 24.4mA after they failed. I saw this same thing on the TFLEX0008 current drain test. In both cases, resetting the power fixed it.'),
(@con_inst_id,'2012-04-05 18:05:00','Started new current drain test.'),
(@con_inst_id,'2012-04-06 18:05:00','Ended current drain test, SW&LW failed again, current drain 21.74 mA ave.'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-05 00:00:00','NEW in lab, needs testing for LW & SW in log mode.'),
(@con_inst_id,'2015-04-01 00:00:00','Removed JP24 Solder bridge on CPU Bd. Changed R4 to 887 Ohms on CPU bd. '),
(@con_inst_id,'2015-04-06 00:00:00','Installed NEW MET board with updated U1, U2, U40 TI chips.'),
(@con_inst_id,'2015-04-06 00:00:00','Updated firmware to version 1.12, 150313.'),
(@con_inst_id,'2015-04-08 00:00:00','Ran 2 day current drain test outside in doghouse with all sensors, 14.42mA ave. Flash Ram data good. SW & LW data good.'),
(@con_inst_id,'2015-10-28 00:00:00','Changed Rain Shield ground from Seawater to Chassis, power PIN 1 ground.'),
(@con_inst_id,'2017-08-07 00:00:00','LWR failed during deployment at 0-23W, PT-007. Tested TFLEX0009 LWR channel and LW/Rad Y-cable, both tested out okay with the deployed LWR sensor sn 36386. I did find a cut pigtail connector, but on the SWR/Rad Y-cable not the LWR cable. '),
(@con_inst_id,'2017-08-14 00:00:00','Ran 7 day current drain test, 17.81mA average. LWR data looked good.'),
(@con_inst_id,'2018-01-08 00:00:00','Installed v2.01, 170530 for PI4-17-RB(2018), to run extra Norteks for AOML. It was decided NOT to use v1.16 firmware for realtime Oxygen, because of firmware bug with loss of all data when 1 Nortek fails. Dan tried testing to recover from this failure with no success (so it was decided to use v2.01 instead).'),
(@con_inst_id,'2018-03-12 00:00:00','Shipped for PI4-17-RB (PNE 2018). SteveK found stand-offs sheared off and broken and circuit board stack hanging from wires, probably from rough handling during truck transport to Ft. Lauderdale.'),
(@con_inst_id,'2018-03-12 00:00:00','Steve got ERROR, \"computer to modem communications bad\" on PI4-17-RB. Steve also reported that he found corrosion on the \"connector board\" below the faceplate connectors.'),
(@con_inst_id,'2018-03-13 00:00:00','During the PI4-17-RB cruise, SteveK swapped the CPU board from TFLEX0009 into the spare TFLEX0003, since TFLEX0003 had v1.16 and he needed v2.01 (since he forgot the PE Micro firmware interface box, and could not update TFLEX0003).'),
(@con_inst_id,'2018-05-09 00:00:00','Installed new connector board. Fixed chassis stand-off mounts. Installed SS metal bottom standoffs.'),
(@con_inst_id,'2018-05-09 00:00:00','Configure CPU for TFLEX0009 (since Steve swapped TFLEX0003 CPU board on PI4-17-RB). Installed firmware version 2.01, 170530.'),
(@con_inst_id,'2018-05-09 00:00:00','Tested on bench. No power being routed to Iridium modem from Serial board. Replaced serial board. Now Iridium modem working.'),
(@con_inst_id,'2018-05-15 00:00:00','Ran bench test current drain for 5.5 days, 15.55mA average. Flash RAM data dump good.'),
(@con_inst_id,'2018-05-15 00:00:00','Successfully Tested XMIT command outside to check internal Iridium and GPS antennas');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-03-01 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0010.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0010' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-05-30 00:00:00','Installed new circuit boards, CPU, Serial, and MET. CPU not working correctly due to the wrong Oscillator installed. Part should be 32.768KHZ, not 32.0KHZ. The wrong oscillator causes the RS232 serial data to be clocked incorrectly, so the serial data out is all garbage, control characters.'),
(@con_inst_id,'2013-05-30 00:00:00','Dirk found the problem and installed the correct oscillator, 32.768KHZ. CPU working now. '),
(@con_inst_id,'2013-05-31 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-06-11 00:00:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-06-13 21:30:00','Stopped current drain test. Ave current = 13.27mA'),
(@con_inst_id,'2013-08-06 00:00:00','Accidentally plugged Radiation input into the wind, and wind into the Radiation connector in the dog house. It seems to be working okay, but it should be mentioned here to check those test sensors and to recheck current drain for TFLEX0010.'),
(@con_inst_id,'2014-05-02 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-09-14 00:00:00','Spare sent for IO1-15 & IO4-15'),
(@con_inst_id,'2017-12-21 00:00:00','Back from India air shipment'),
(@con_inst_id,'2017-12-28 00:00:00','Updated RAIN shield ground from seawater to power ground, pin1 connected to pin6. Installed new ground connector, pin1 & pin2 connected for the IM ground.'),
(@con_inst_id,'2017-12-28 00:00:00','Updated RAIN shield ground from seawater to power ground, pin1 connected to pin6. Installed new ground connector, pin1 & pin2 connected for the IM ground. CPU R4 change to 887 Ohms.'),
(@con_inst_id,'2017-12-29 00:00:00','Back from India Air shipment, December 2017. Updated Iridium 1st Xmit time to 00:44.'),
(@con_inst_id,'2018-01-02 00:00:00','Ran current drain test for 3 days, 16.22mA Average.'),
(@con_inst_id,'2018-01-02 00:00:00','Successfully tested GPS and Iridium XMIT test outside.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0011.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0011' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-03 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-03 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-06-18 19:10:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-06-20 16:19:00','Current drain test. Ave current = 16.36mA'),
(@con_inst_id,'2013-06-26 16:19:00','Current drain test. Ave current = 16.22mA'),
(@con_inst_id,'2013-06-27 16:20:00','Stopped current drain test. Ave current = 16.20mA'),
(@con_inst_id,'2014-05-05 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-03-20 00:00:00','Updated CPU R4 to 887 Ohms, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-03-30 00:00:00','Gill wind not working, no pwr on faceplate connector. Found pwr jumpers JP16 and JP20 configured incorrectly, fixed jumpers to Main Battery voltage pin 9-10 on both, which fixed wind.'),
(@con_inst_id,'2015-03-31 00:00:00','Noticed Logic battery and Iridium xmit battery voltages the same, equal to Logic voltage. Xmit battery voltage not working. Needs to be fixed.'),
(@con_inst_id,'2015-04-01 00:00:00','Fixed Iridium Modem IM battery voltage A/D by removing jumper on J4, that for some reason was jumpered in error. It may have been EDD using this system for testing.'),
(@con_inst_id,'2015-04-24 00:00:00','Ran a 2-day current drain test with all sensors out in the doghouse, 15.05mA Average.'),
(@con_inst_id,'2015-08-03 00:00:00','Shipped for PI3-15, spare'),
(@con_inst_id,'2016-09-07 00:00:00','Changed Rain shield ground from Seawater ground to power ground.'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'),
(@con_inst_id,'2018-03-23 00:00:00','Rec PT011, 12N-23W, worked okay. Had a lot of resets starting about 4 months into the deployment. O2 firmware v 1.16. Had 163 resets.'),
(@con_inst_id,'2018-08-22 00:00:00','Installed metal SS standoffs at the bottom of the circuit board stack.'),
(@con_inst_id,'2018-08-22 00:00:00','Converted firmware to 2.01, 170530, for bench current drain test.'),
(@con_inst_id,'2018-08-22 00:00:00','Changed Iridium 1st transmit time to 00:45.'),
(@con_inst_id,'2018-08-23 00:00:00','This system had 163 resets running the O2 firmware v 1.16. On day 7 of a bench test, this system had ONE RESET, and 6 hours of all Iridium data was lost, not transmittted. The GPS position also was missing. Need to let it run a little longer to make sure that this is NOT a chronic problem.'),
(@con_inst_id,'2018-09-10 00:00:00','Ran this system an additional 6 days, and it did NOT have any additonal resets, so I think its okay, and may have been an issue with just one of the Iridium 6 hour buffer transmits.'),
(@con_inst_id,'2018-09-10 00:00:00','Ran for a total of 14 days, current drain test, current drain average 14.76mA. '),
(@con_inst_id,'2018-09-10 00:00:00','Tested GPS outside okay, but XMIT did not work well. Did XMIT 5 times outside, and it worked okay only one time. Saw computer to modem coms BAD error once. Then other XMITs took a long time, and they would send all 6 of the dummy files, but then hanged and timed out, and repeated the XMIT. '),
(@con_inst_id,'2018-09-10 00:00:00','THIS SYSTEM TFLEX0011 should NOT be used, since it has intermittent Iridium problems.'),
(@con_inst_id,'2018-09-11 00:00:00','Replaced Iridium modem (recycled from TFLEX0002). Replaced Serial board with new board. Replaced GPS & Iridium antennas and antenna cables. Tested XMIT multiple times inside on rooftop antenna and outside with its internal antennas. XMIT worked great! Registering and successfully transmitting dummy files quickly. It did this multiple times, so I think this system is fixed and ready to go. It will run on the bench again for a couple of days for a current drain check again just to be sure.'),
(@con_inst_id,'2018-09-17 00:00:00','Ran another current drain test on the bench for 6 days, after Iridium repairs above, current drain 16.66mA average, NO RESETS.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0012.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0012' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-04 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-04 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-06-27 17:00:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-07-01 17:40:00','Stopped current drain test. Ave current = 16.17mA. Had two 6 hour Iridium buffers missing, that did not transmit.'),
(@con_inst_id,'2014-02-10 00:00:00','Removed solder bridge shorting of JP24 on back of CPU board. This removes the battery power inputs to A/D circuit on J12 from powering the CPU board.'),
(@con_inst_id,'2014-02-11 22:45:00','Started Lake test in Buoy, testing firmware version 1.12, 140211, full MET sensor suite, plus 5 subsurface sensors: SSTC, TC, Aquadopp, T, and TP.'),
(@con_inst_id,'2014-02-24 00:30:00','Connected Monitoring computer to capture test date in a log file'),
(@con_inst_id,'2014-02-25 00:00:00','Rain Gauge Failed on TEST buoy in boat basin? Std Dev of Rain Rate went from near zero to 100-200 counts.'),
(@con_inst_id,'2014-04-14 21:51:00','Swapped Failed Rain 764 with NEW replacement Rain 1642 on TEST buoy in Boat Basin'),
(@con_inst_id,'2014-05-06 00:00:00','Successfully updated cal file with Rain 1642 via Iridium command'),
(@con_inst_id,'2014-05-12 00:00:00','2nd Rain gauge, sn1642 failed on TFLEX0012 TEST, data reading 1E+35.'),
(@con_inst_id,'2014-07-28 21:23:00','Swapped Rain gauge (3rd one) Installed sn 1262, swapped out 1642 where data read 1E+35 continuously.'),
(@con_inst_id,'2014-07-28 00:00:00','Rain gauges, 674 & 1642 both bench tested okay (post-swap), so the failure must be with the Rain channel on the TFLEX circuit board (MET board?)'),
(@con_inst_id,'2014-08-22 00:00:00','ENDED Buoy test in boat basin, XMIT battery voltage low, no more Iridium call ins.'),
(@con_inst_id,'2015-06-01 00:00:00','FAILED on IO1-15a, NO COMS. I had case sitting on deck during IO1 cruise, it might have rolled and knocked something off circuit board???'),
(@con_inst_id,'2016-08-15 00:00:00','Swapped in NEW CPU board (OLD CPU BOARD draws high current, around 27mA). This fixed coms, but current drain still high, reading 38mA, instead of 8-12mA, terminal mode, quiesent current. Needs further testing.'),
(@con_inst_id,'2017-01-10 00:00:00','Ryan wells fixed this system while I was on cruise travel for IO5-16(Jan 2017). His comment tag says that he swapped the CPU and MET boards. He also did a current drain test, resulting in 15.8mA average.'),
(@con_inst_id,'2017-02-15 00:00:00','Changed the Rain shield ground wiring from seawater ground to Pin 1 power ground. Also cut off the power jumper between the wind and compass connectors on the connector board (since its not needed).');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0013.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0013' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-04 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-04 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-07-01 18:00:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-07-02 17:15:00','Ave current drain = 15.2mA'),
(@con_inst_id,'2013-07-03 19:40:00','Ave current drain = 15.48mA'),
(@con_inst_id,'2013-07-08 17:45:00','Stopped current drain test. Ave current = 15.37mA'),
(@con_inst_id,'2014-05-05 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-03-20 00:00:00','Updated CPU R4 to 887 Ohms, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-08-15 00:00:00','Used for Gill All-in-one sensor TEST at Grassy Knoll'),
(@con_inst_id,'2015-10-28 00:00:00','Changed Rain Shield ground from Seawater to Chassis, power PIN 1 ground.'),
(@con_inst_id,'2017-08-07 00:00:00','Did post deploy (Rec PI2-17-TH, PT-006, 0-23W) current drain test, 15.38mA average over 4 days.'),
(@con_inst_id,'2017-09-14 00:00:00','Changed firmware to version 1.16, 161014, O2 version for PNE, PI4-17-RB cruise.'),
(@con_inst_id,'2017-09-14 00:00:00','Unfortunately, I mixed up the serial and met ribbon cables and plugged them into the wrong boards. Iridium Xmit now has problems, sometimes it works, sometimes says bad Iridium coms. When it works it is slow and hangs at times. May have to swap the Iridium modem, or serial board. F*&$k!'),
(@con_inst_id,'2017-11-06 00:00:00','Upgraded to firmware version 2.01, 170530. Tested on bench again, iridium coms and XMIT working okay now??? Will run current drain/bench test with roof-top antennas'),
(@con_inst_id,'2017-11-13 00:00:00','Completed one week of testing. This system working okay now. No problems with Iridium or call into RUDICS.'),
(@con_inst_id,'2017-11-13 00:00:00','Almost 7 days, current drain average was 15.41mA.'),
(@con_inst_id,'2017-11-13 00:00:00','Tested internal Iridium antenna & GPS, with XMIT outside, which successfully registered and sent dummy files.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0014.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0014' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-04 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-04 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-07-08 19:00:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-07-08 23:00:00','Connected different SSTC microcat immersed in saltwater to test conductivity data'),
(@con_inst_id,'2013-07-09 21:00:00','Ave current drain = 15.82mA, and Conductivity data working okay.'),
(@con_inst_id,'2013-07-10 19:00:00','Ave current drain = 15.63mA'),
(@con_inst_id,'2013-07-10 19:10:00','Noticed that Iridium data calls stopped. Last call in was on July 10th at 09:00 GMT.'),
(@con_inst_id,'2013-07-12 00:00:00','Did some testing with Pat. Used his transmitter, through a roof-mounted antenna, which worked good through the TFLEX0014 system. Then tested the TFLEX0014 tranmitter with Pat\'s Sim card to see if Sim card might be bad, but still did not work, so according to Pat its probably a bad transmitter.'),
(@con_inst_id,'2013-09-03 00:00:00','Sent Iridium transmitter back to NAL Research for check-out on RMA #NAL13-489, around July 18th. They did NOT find anything wrong with it, so it must be either the antenna cable or antenna.'),
(@con_inst_id,'2013-09-17 00:00:00','Found antenna cabe pinched at hubbell fitting. Installed new antenna and new antenna cable.'),
(@con_inst_id,'2014-05-05 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-03-20 00:00:00','Updated CPU R4 to 887 Ohms, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-04-17 00:00:00','Ran currrent drain test with all sensors in the doghouse, 18.00mA over 2 days.'),
(@con_inst_id,'2015-04-17 00:00:00','Iridium transmissions okay with new antenna and new antenna cable.'),
(@con_inst_id,'2017-10-16 00:00:00','Back from sea, Rec IO2-17-IS, 12S-67E, RT007. Ran current drain test for 4 days, 15.30mA Average.'),
(@con_inst_id,'2017-10-16 00:00:00','Changed rain ground from seawater to power ground. Had to replace Ground I/O 4pin MC connector to fix ground. Upgraded firmware to v2.10, 170530.'),
(@con_inst_id,'2017-10-16 00:00:00','Tested GPS and XMIT commands outside successfully.'),
(@con_inst_id,'2017-10-16 00:00:00','Changed O-rings.'),
(@con_inst_id,'2017-11-29 00:00:00','Put out on test for IO1-18-BJ8. This system seems to be missing Iridium transmit blocks of data outside on test more than other systems. It did this during its last deployment as well, on RT007, but it did not miss one Iridium transmit buffer while it tested on the bench, suggesting that it may have a bad Iridium transmit antenna cable or antenna. Should replace both???'),
(@con_inst_id,'2017-12-12 00:00:00','Replaced Iridium antenna cable. XMIT tested okay, 2nd time, 1st time could not register. We\'ll see how well it calls into RUDICS during its cruise testing for PNE 2018.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0015.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0015' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-04 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-04 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-07-16 21:00:00','Started current drain test with all sensors in Doghouse outside.'),
(@con_inst_id,'2013-07-17 22:00:00','Ave current drain = 18.51mA'),
(@con_inst_id,'2013-07-18 21:45:00','Ave current drain = 17.38mA'),
(@con_inst_id,'2013-07-22 23:45:00','Stopped current drain test. Ave current = 17.7mA'),
(@con_inst_id,'2013-08-14 18:20:00','Started testing outside for PI3-13-RB, spare system.'),
(@con_inst_id,'2013-08-19 18:05:00','Stopped PI3-13 test to upgrade firmware to v1.12, 130816'),
(@con_inst_id,'2013-08-19 21:36:00','Re-started PI3-13 testing outside, spare system.'),
(@con_inst_id,'2013-08-26 23:45:00','Disconnected Nortek Aquadopp from Inductive test loop.'),
(@con_inst_id,'2013-09-04 21:35:00','PI3-13 testing stopped.'),
(@con_inst_id,'2014-05-05 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-08-30 00:00:00','Deployed on IO1-15b, 4S-80.5E, RT005. Reports of problems with Iridium transmit problems, missing Iridium buffers, not sent???'),
(@con_inst_id,'2017-12-01 00:00:00','Back from India, air shipment'),
(@con_inst_id,'2018-03-12 00:00:00','Updated Rain gauge shield grounding to power ground, Rain Pin1-to-Pin6, including installing new stainless bulkhead connector. Also installed new Ground bulkhead connector, connecting pin1 & pin2 together. Plus cut out common power wire between compass and wind connectors on connector board.'),
(@con_inst_id,'2018-03-12 00:00:00','Upated firmware to version 2.10, 170530, plus updated Iridium first transmit time to 00:38.'),
(@con_inst_id,'2018-03-16 00:00:00','Ran bench current drain test 15.54mA average for 4 days, plus everything worked including Iridium transmissions had no problems, but will change out the Iridium antenna cable to hopefully solve Iridium transmit issues during the last deployment on RT005.'),
(@con_inst_id,'2018-03-16 00:00:00','Replaced Iridium antenna and Iridium antenna cable. Successfully tested GPS and Iridium XMIT outside.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0016.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0016' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2013-11-15 00:00:00','Chassis built up and wired up. Waiting for RIG boards to be stuffed.'),
(@con_inst_id,'2014-05-13 00:00:00','Verified all mods made to circuit boards. Removed solder bridge from JP24.'),
(@con_inst_id,'2014-05-14 00:00:00','Installed NEW circuit boards, RIG, MET, Serial, and CPU board. '),
(@con_inst_id,'2014-05-15 00:00:00','Installed new firware version 1.12, 140211. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card. Waiting to get SIM cards for Iridium Modem.'),
(@con_inst_id,'2014-05-29 00:00:00','NEW SIM Card installed.'),
(@con_inst_id,'2014-06-03 23:30:00','Started current drain test with all sensors in Dog house outside of Bldg 3.'),
(@con_inst_id,'2014-06-05 16:30:00','Current drain Ave = 18.7mA'),
(@con_inst_id,'2014-08-12 00:00:00','Started test outside for Current meter test, adding 10 Norteks for deployment at 4N-23S to make sure data will come through okay.'),
(@con_inst_id,'2014-08-25 18:30:00','Reset Current meter test, swapped out 5m, address 01 Nortek clock off. Also changed Iridium First call to 00:36 because Eng/Diagnostic data not received.'),
(@con_inst_id,'2014-10-01 17:30:00','Started test of actual instrumentation that will be used for PNE, 4N-23W, PI3-14-EN deployment. Used as prime system.'),
(@con_inst_id,'2015-01-22 00:00:00','IM data failed on deck for Mike Strick during PI3-14-EN buoy setup. Tested on deck okay, but IM data all went to 2E35 when buoy built up for deployment.'),
(@con_inst_id,'2015-04-14 00:00:00','Loaded test cal file with one of each inductive sensor. IM data worked okay with no problems.'),
(@con_inst_id,'2015-04-17 00:00:00','Took off CPU bd to change R4 and found salt residue on CPU board and really bad salt residue and corrosion on pins of ICs on the Serial board. Cleaned up CPU board, but Serial bd needs to be replaced.'),
(@con_inst_id,'2015-04-20 00:00:00','Replaced Serial Board. Updated firmware to version 1.12, 150313.'),
(@con_inst_id,'2015-04-22 00:00:00','Ran a 2 day current drain check with all sensors out in the doghouse, 16.68mA average.'),
(@con_inst_id,'2017-10-16 00:00:00','Back from sea, Rec IO2-17-IS, RT008, 8S-67E.'),
(@con_inst_id,'2017-10-19 00:00:00','Ran a 3 day current drain test, 13.83mA average.'),
(@con_inst_id,'2017-10-19 00:00:00','Updated firmware to version 2.10, 170530. Changed Rain shield ground from seawater to power ground. '),
(@con_inst_id,'2017-10-19 00:00:00','Tested GPS and XMIT commands outside successfully.'),
(@con_inst_id,'2017-10-19 00:00:00','Changed O-rings.'),
(@con_inst_id,'2017-12-01 00:00:00','Tried to use for PI4-17, but Iridium XMIT command did not work.'),
(@con_inst_id,'2018-03-15 00:00:00','Changed Iridium antenna cable.'),
(@con_inst_id,'2018-03-15 00:00:00','Tested GPS and XMIT commands outside successfully with new Iridium antenna cable.'),
(@con_inst_id,'2018-05-03 00:00:00','Installed SS metal circuit board standoffs on bottom stack.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2013-11-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0017.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0017' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2013-11-15 00:00:00','Chassis built up and wired up. Waiting for RIG boards to be stuffed.'),
(@con_inst_id,'2014-05-13 00:00:00','Verified all mods made to circuit boards. Removed solder bridge from JP24.'),
(@con_inst_id,'2014-05-14 00:00:00','Installed NEW circuit boards, RIG, MET, Serial, and CPU board. '),
(@con_inst_id,'2014-05-15 00:00:00','Installed new firware version 1.12, 140211. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card. Waiting to get SIM cards for Iridium Modem.'),
(@con_inst_id,'2014-05-29 23:05:00','NEW SIM card installed. Started current drain test in doghouse outside of Bldg 3.'),
(@con_inst_id,'2014-06-03 23:15:00','Current drain test finished, 14.8mA. Ave. Dumped Flash RAM data, which looked good.'),
(@con_inst_id,'2014-10-03 00:00:00','Started test for PI3-14-EN, as spare system'),
(@con_inst_id,'2015-12-01 00:00:00','Recovered on PI3-15, PT004. System worked okay.'),
(@con_inst_id,'2016-08-29 00:00:00','Changed R4 to 887 Ohms. Changed RAIN shield ground from Seawater to Power ground. Plus updated Iridium 1st call time to 10mins (00:10:00).'),
(@con_inst_id,'2016-09-01 00:00:00','Ran benchtop current drain test for 3 days, 14.22mA average.'),
(@con_inst_id,'2016-09-02 00:00:00','Noticed quite a few data points, especially LWR data, not written to Flash RAM memory, so replaced Flash Memory card.'),
(@con_inst_id,'2016-09-26 00:00:00','Upgraded firmware to version 1.12, 150313.'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'),
(@con_inst_id,'2017-05-30 00:00:00','Updated firmware to Pat\'s reconstituted version 2.01, 170530'),
(@con_inst_id,'2017-05-30 00:00:00','Updated Iridium 1st transmit (call-in) time to 00:40'),
(@con_inst_id,'2018-09-04 00:00:00','Ryan says Iridium now not working??? Needs testing???');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2013-11-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0018.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0018' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-10-22 00:00:00','Built up system 0018, all sensors worked, except Baro LWR & SWR. Swapped MET, Serial board, but LWR & SWR still not working. Could have been issue, current limiting issue with SW Rad. Finally swapped CPU board, and LWR & SWR finally fixed and functional.'),
(@con_inst_id,'2015-10-23 00:00:00','Iridium SIM card installed. All sensors tested okay. All functions tested okay, RF modem & Irdium xmit successful. Needs current drain testing.'),
(@con_inst_id,'2015-11-06 00:00:00','Ran Current drain test, 14.57mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-12-11 00:00:00','Back from India (air shipment)'),
(@con_inst_id,'2017-12-18 00:00:00','Updated Iridium 1st transmit time to 00:41. Upated firmware to version 2.01, 170530.'),
(@con_inst_id,'2017-12-28 00:00:00','Ran Current drain test for 8 days (over Xmas Holiday), 14.02mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-01-02 00:00:00','Successfully tested GPS and Iridium XMIT test outside.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-10-22 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0019.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0019' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-10-22 00:00:00','Entire system 0019 built up, Iridium SIM card installed. All sensors tested okay. All functions tested okay, RF modem & Irdium xmit successful. Needs current drain testing.'),
(@con_inst_id,'2015-10-28 00:00:00','Ran Current drain test, 14.06mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-12-11 00:00:00','Back from India air shipment.'),
(@con_inst_id,'2018-01-03 00:00:00','Updated Iridium 1st transmit time to 00:42, and updated firmware to version 2.01, 170530'),
(@con_inst_id,'2018-01-05 00:00:00','Ran Current drain test for 2 days, 13.75mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-01-05 00:00:00','Successfully tested Iridium XMIT and GPS test outside.'),
(@con_inst_id,'2018-03-01 00:00:00','Tried to use for IO2-18-RB, but IMM data bad, got \"comma error, IM line not captured.'),
(@con_inst_id,'2018-03-20 00:00:00','Replaced IMM, but inductive data still BAD, still get error \"IM line not captured\" for each sensor. Tested original IMM with Seabird test coil, wiring harness, com cable, and original IMM tested out okay.'),
(@con_inst_id,'2018-03-20 00:00:00','Replaced Serial board, but it didn\'t fix IMM data, so swapped the RIG board with the same Seabird IMM module, and this fixed the IM data. IM data now working.'),
(@con_inst_id,'2018-03-20 00:00:00','Bench tested all sensors after fix, everything working okay. Plus successfully tested GPS and Iridium XMIT outside.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-10-22 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0020.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0020' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-10-22 00:00:00','Entire system 0020 built up, Iridium SIM card installed. All sensors tested okay. All functions tested okay, RF modem & Irdium xmit successful. Needs current drain testing.'),
(@con_inst_id,'2015-10-30 00:00:00','Ran Current drain test, 14.28mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2015-12-14 00:00:00','Tested outside Bldg 3 alongside 3 other new TFLEX systems 18, 19, & 21. Seemed to miss more Iridium transmit windows with no data 6 and sometimes 12 hours of data missing. This system should be put out at the Grassy Knoll to see if its just because it\'s near the building.'),
(@con_inst_id,'2016-07-15 00:00:00','Tested on the bench connected to the roof-top Iridium antenna. TFLEX0020 registered and transmitted its files on the 1st XMIT with no problems.'),
(@con_inst_id,'2017-12-14 00:00:00','Back from Indian Air shipment, new system, never deployed.'),
(@con_inst_id,'2017-12-15 00:00:00','Upated Iridium 1st xmit time to 00:43, upgraded firmware to version 2.01, 170530.'),
(@con_inst_id,'2017-12-11 00:00:00','Back from Indian Air shipment'),
(@con_inst_id,'2017-12-15 00:00:00','Updated Iridium 1st Transmit time to 00:43, and updated firmware to version 2.01, 170530'),
(@con_inst_id,'2017-12-18 00:00:00','Ran current drain test over the weekend for 2+ days, everything worked okay, 13.55mA average. Successfully tested Xmit Iridium test and GPS outside.'),
(@con_inst_id,'2018-09-20 00:00:00','Back from IO2-18-RB, not deployed due to rough weather'),
(@con_inst_id,'2018-11-05 00:00:00','Installed metal SS standoffs on the bottom of the circuit board stack.'),
(@con_inst_id,'2018-11-09 00:00:00','Ran 3 day current drain test, everything worked okay, 12.63mA average.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-10-22 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0021.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0021' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-10-22 00:00:00','Built up system 0021, all sensors worked, except Baro BP and SWR. Found two pairs of pins on U17 in Baro circuit with solder bridges. Once removed, Baro worked and fixed, as well as SWR.'),
(@con_inst_id,'2015-10-22 00:00:00','Iridium SIM card installed. All sensors tested okay. All functions tested okay, RF modem & Irdium xmit successful. Needs current drain testing.'),
(@con_inst_id,'2015-11-02 00:00:00','Ran Current drain test, 18.5mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-09-20 00:00:00','Deployed at RT009,4S-67E. Rec IO2-17-IS, Korean ship. Found mooring with Tower torn off, all sensor cables torn off/broken. Needs repair'),
(@con_inst_id,'2018-07-18 00:00:00','I canibalized and scavenged the GPS antenna out of this system because I need one and had NO new ones on the shelf. GPS antenna was okay.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-10-22 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0022.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0022' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-11-17 00:00:00','Completed build up of NEW system sn 0022. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Still needs GPS and Iridium XMIT test. Also still needs current drain test.'),
(@con_inst_id,'2015-11-18 19:20:00','Successfully tested GPS and Iridium XMIT function outside, although it tood 4 XMIT commands for it to finally register with Iridium. XMIT test files sent okay.'),
(@con_inst_id,'2015-11-23 00:00:00','Ran Current drain test for 2 days, 15.10 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-12-14 00:00:00','Finally back from India (air shipment), changed Iridium 1st xmit time to 00:45, also updated firmware to v2.01,170530. Checked Iridium and GPS outside successfully.'),
(@con_inst_id,'2017-12-15 00:00:00','Did 1 day current drain & functional test. All sensors working, current drain 13.75mA ave.'),
(@con_inst_id,'2018-09-20 00:00:00','Back from IO2-18-RB, not deployed at 8S-81E due to bad weather.'),
(@con_inst_id,'2018-11-08 00:00:00','Installed metal SS standoffs on the bottom of the circuit board stack.'),
(@con_inst_id,'2018-11-13 00:00:00','Ran Current drain test for 4 days, 12.88 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-11-13 00:00:00','Successfully tested GPS and Iridium XMIT commands outside with internal antennas.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-11-17 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0023.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0023' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-11-17 00:00:00','Completed build up of NEW system sn 0023. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Still needs GPS and Iridium XMIT test. Also still needs current drain test.'),
(@con_inst_id,'2015-11-18 18:45:00','Successfully tested GPS and Iridium XMIT function outside. XMIT test files sent okay.'),
(@con_inst_id,'2015-11-20 00:00:00','Ran Current drain test for 2 days, 14.36mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-12-11 00:00:00','Back from India air shipment. '),
(@con_inst_id,'2017-12-18 00:00:00','Updated Iridium 1st Transmit time to 00:35. Updated firmware to v2.01, 170530.'),
(@con_inst_id,'2017-12-19 00:00:00','Did 1 day current drain & functional test. All sensors working, current drain 16.54mA ave.'),
(@con_inst_id,'2018-01-02 00:00:00','Successfully tested GPS and Iridium XMIT test outside.'),
(@con_inst_id,'2018-03-01 00:00:00','Tried to use for IO2-18-RB, testing outside, but for some reason, the subsurface sensor Iridium buffers were time-stamped with two different times, one hour apart. For example, buffers in the same 6 hour Iridium transmit window, half of which were time-stamped 0100, and the other half 0200. Not sure if this is a CPU or IMM problem.'),
(@con_inst_id,'2018-05-14 00:00:00','This Iridium buffer time mismatch may be caused by the Iridium 1st transmit time set to 00:35, which is maybe too close to update time function at 12:38.'),
(@con_inst_id,'2018-05-21 00:00:00','Rain Bench test with an Iridium 1st transmit time of 00:45. Did not see a buffer timing problem, so it looks like the problem is fixed by NOT using a 1st transmit time of 00:35. Current drain for 4.5 days was 14.15mA average.'),
(@con_inst_id,'2018-05-21 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-11-17 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0024.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0024' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-13 00:00:00','Completed build up of NEW system sn 0024. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-22 00:00:00','Setup Config by mistake, that did 6min Iridium calls and 6min GPS fixes. Data did not work and system reset 4 times. After config properly setup, then ran Current drain test for 4 days, but Mulit-meter showed error, so had to restart test. Finally got 2 day current drain average of 14.22mA. Dumped Flash RAM data,which looked okay.'),
(@con_inst_id,'2016-06-22 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2017-11-27 00:00:00','Rec IO4-17-SN, SteveK. Failed, No coms, Steve brought back Flash RAM card, he could not dump data. He also said that he found corrosion on chips on CPU board.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-13 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0025.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0025' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-09 00:00:00','Completed build up of NEW system sn 0025. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. GPS tested okay inside on roof mount antenna. XMIT did not work 1st time, but 2nd time registered and send files successfully.'),
(@con_inst_id,'2016-06-13 00:00:00','Ran Current drain test for 3.5 days, 14.45mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-06-13 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'),
(@con_inst_id,'2017-03-06 00:00:00','Deployed on PT009, 4N-23W, without Oxygen sensors, extra Norteks for AOML, with v1.12, 150313'),
(@con_inst_id,'2018-04-25 00:00:00','Back from PI4-17-RB air shipment'),
(@con_inst_id,'2018-04-30 00:00:00','Updated firmware to v2.01, 170530, for post deployment benchtop current drain testing.'),
(@con_inst_id,'2018-04-30 00:00:00','Installed SS metal bottom circuit board stack standoffs.'),
(@con_inst_id,'2018-04-30 00:00:00','Updated Iridium 1st XMIT time to 00:37'),
(@con_inst_id,'2018-05-03 00:00:00','Ran Current drain test for 3 days, 17.28mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed new face seal Oring'),
(@con_inst_id,'2018-05-21 00:00:00','Ran outside test for PI3-18, Brasil. GPS positions working, but had quite a few GPS positions missing??? It missed 8 out of 49 over almost 12 days. Opened up case and re-seated the GPS antenna connector. Also noticed many of the missing GPS fixes were at time 12:58 & 00:58. Decided to try changing the Iridium 1st transmit time to 00:42 (from 00:37).'),
(@con_inst_id,'2018-05-25 00:00:00','Just a note that during the PI3-18 testing, that all of the inductive data went to 1E+35 two times during the 2 weeks of testing. This system IM data was okay during its last deployment on PT009. So I suspect an intermittent problem with the test wires/cables?');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-09 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0026.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0026' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-10 00:00:00','Completed build up of NEW system sn 0026. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-16 00:00:00','Ran Current drain test for 3 days, 14.22 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-06-16 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'),
(@con_inst_id,'2018-06-01 00:00:00','Back from PI2-18-TH, Rec PT012, 21N-23W (by me on Thalassa repair cruise)'),
(@con_inst_id,'2018-08-15 00:00:00','Upgraded Firmware to version 2.01, 170530'),
(@con_inst_id,'2018-08-15 00:00:00','Changed Iridium 1st xmit time to 00:38'),
(@con_inst_id,'2018-08-15 00:00:00','Installed metal SS standoffs at the bottom of the circuit board stack.'),
(@con_inst_id,'2018-08-27 00:00:00','Ran Current drain test for 7 days, 12.8 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-08-27 00:00:00','Installed NEW O-rings, face and jam seal.'),
(@con_inst_id,'2018-08-27 00:00:00','Sucessfully tested GPS and XMIT iridium commands outside (with internal antennas).');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-10 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0027.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0027' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-10 00:00:00','Completed build up of NEW system sn 0027. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-24 00:00:00','Ran Current drain test for 2 days, 14.36 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-06-24 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'),
(@con_inst_id,'2018-06-01 00:00:00','This system came back from PI4-17-RB (March 2018) in the Durban air shipment. Recovered with v1.12, 150313 from 20N-38W, PT013. No major issues or problems listed in deployment \"System Status\" info.'),
(@con_inst_id,'2018-06-01 00:00:00','Installed SS circuity board Standoffs on bottom of circuit board stack. '),
(@con_inst_id,'2018-06-01 00:00:00','Upgraded firmware to v2.01, 170530 & Updated Iridium 1st transmit time to 00:39.'),
(@con_inst_id,'2018-06-06 00:00:00','Ran Current drain test for 5 days, 14.15 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-06-06 00:00:00','Installed new Jam seal and face seal Orings.'),
(@con_inst_id,'2018-06-06 00:00:00','Successfully tested GPS and Iridium XMIT functions outside on internal antennas.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-10 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0028.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0028' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-09 00:00:00','Completed build up of NEW system sn 0027. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-27 00:00:00','Ran Current drain test for 3 days, 14.65mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-06-27 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-09 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0029.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0029' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-17 00:00:00','Completed build up of NEW system sn 0029. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-20 00:00:00','Just as a note. I did the mods on the serial board shorts on U17 pins 5&7, plus I soldered RN6 next to U17.'),
(@con_inst_id,'2016-06-28 00:00:00','Ran Current drain test for 1 day. TFLEX0029 failed. Stopped logging & transmitting. Sitting at 40mA current drain.'),
(@con_inst_id,'2016-06-28 00:00:00','Ryan tried to troubleshoot, but could not find anything conclusive as the cause of the failure. He said maybe there was a connector that wasn\'t seated. TFLEX0029 will have to be run again on current drain test. '),
(@con_inst_id,'2017-01-23 00:00:00','Ryan fixed this system while I was at sea on IO5-16. He replaced the MET and Serial boards, which fixed the Iridium transmitting problem. He did a current drain test resulting in a 13.8mA average.'),
(@con_inst_id,'2017-10-12 00:00:00','SPARE back from IO2-17-IS. Did overnight current drain check, 13.76mA average.'),
(@con_inst_id,'2017-10-12 00:00:00','Upgraged firmware to version 2.01,170530'),
(@con_inst_id,'2017-10-12 00:00:00','tested GPS and XMIT Iridium outside successfully.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-17 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0030.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0030' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-27 00:00:00','Completed build up of NEW system sn 0030. Tested all sensor inputs successfully. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-28 00:00:00','RF Modem did not work. Replaced RIG board, including a new RF modem module, and RF modem fixed, working okay.'),
(@con_inst_id,'2016-06-29 00:00:00','Ran current drain test with Fluke27 handheld meter for 2 days, and got an average of 18mA. Need to run the current drain test again with the more accurate meter.'),
(@con_inst_id,'2016-07-14 00:00:00','Ran current drain test overnight on bench with more accurate meter, Fluke 8846A, and for some reason, current rain high with an overnight average of 49mA. This system needs to be checked out for problems, although all sensors are working. Ryan says its current drain is nominal most of the time, except for some periods of intermittant peaks that exceed the limit on his new power supply, 5A max?'),
(@con_inst_id,'2017-01-18 00:00:00','Ryan repaired this system while I was at sea on IO5-16. He replaced the RF Modem (again) and says it is fixed. He ran a current drain test with an average of 14.1mA.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-27 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0031.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0031' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-29 00:00:00','Completed build up of NEW system sn 0031. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-07-03 00:00:00','Ran Current drain test for 3 days, 14.46mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-07-03 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-29 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0032.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0032' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-20 00:00:00','Completed build up of NEW system sn 0032. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-30 00:00:00','Ran Current drain test for 2 days, 14.65mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-07-18 00:00:00','Installed SS metal standoffs on bottom of circuit board stack.'),
(@con_inst_id,'2018-07-18 00:00:00','Upgraded to firmware version 2.01, 170530.'),
(@con_inst_id,'2018-07-18 00:00:00','Changed Iridium 1st XMIT time to 00:44'),
(@con_inst_id,'2018-07-25 00:00:00','Current drain test after deployment at 0-23W, PT008, ran for 5 days, 14.50mA.'),
(@con_inst_id,'2018-07-31 00:00:00','Successfully tested GPS and Iridium XMIT outside'),
(@con_inst_id,'2018-07-31 00:00:00','Installed NEW O-rings, face seal & jam seal.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-20 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0033.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0033' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-30 00:00:00','Completed build up of NEW system sn 0033. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-07-06 00:00:00','Ran Current drain test for 3 days, 15.2 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-07-06 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2018-06-01 00:00:00','Back from French PIRATA, PI1-18-TH, 10S-10W, PT010. Data okay.'),
(@con_inst_id,'2018-08-13 00:00:00','Upgraded Firmware to version 2.01, 170530'),
(@con_inst_id,'2018-08-13 00:00:00','Changed Iridium 1st xmit time to 00:43'),
(@con_inst_id,'2018-08-13 00:00:00','Installed metal SS standoffs at the bottom of the circuit board stack.'),
(@con_inst_id,'2018-08-20 00:00:00','Ran Current drain test for 6 days, 13.40 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-08-20 00:00:00','Installed NEW O-rings, face and jam seal.'),
(@con_inst_id,'2018-08-20 00:00:00','Successfully tested the GPS and Iridium XMIT outside.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-30 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0034.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0034' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-30 00:00:00','Completed build up of NEW system sn 0034. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-07-08 00:00:00','Ran Current drain test for 3 days, 14.4mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-07-10 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2018-06-01 00:00:00','Back from PI1-18-TH, REC 6S-8E, PT014. Data okay.'),
(@con_inst_id,'2018-08-07 00:00:00','Upgraded Firmware to version 2.01, 170530'),
(@con_inst_id,'2018-08-07 00:00:00','Changed Iridium 1st xmit time to 00:45'),
(@con_inst_id,'2018-08-07 00:00:00','Installed metal SS standoffs at the bottom of the circuit board stack.'),
(@con_inst_id,'2018-08-14 00:00:00','Ran Current drain test for 6 days, 12.92mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-08-14 00:00:00','Installed NEW O-rings, face and jam seal.'),
(@con_inst_id,'2018-08-14 00:00:00','Successfully tested GPS and Iridium XMIT outside.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-30 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0035.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0035' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-30 00:00:00','Completed build up of NEW system sn 0035. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-07-12 00:00:00','Ran Current drain test for 4 days, 17.9mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-07-12 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2017-08-08 00:00:00','Spare back from French Pirata, PI2-17-TH. Long stand-offs holding MET board (and boards above stack, Serial, CPU) broke and French found, taped up'),
(@con_inst_id,'2017-08-21 00:00:00','Installed new standoffs for circuit board stack. Did 3 day current drain check, 13.89mA average.'),
(@con_inst_id,'2017-10-24 00:00:00','Back from Grassy Knoll, Gill wind Spartan vs. Ocean Server Test'),
(@con_inst_id,'2017-10-24 00:00:00','No Iridium xmissions from Grassy Knoll, so replaced Iridium Antenna cable, tested okay, successfully with XMIT command outside.'),
(@con_inst_id,'2017-10-24 00:00:00','Upgraded to firmare version 2.01, 170530'),
(@con_inst_id,'2017-10-24 00:00:00','Tried to use for PI4-17-RB??? But, XMIT command did NOT work.'),
(@con_inst_id,'2018-03-08 00:00:00','Bench tested with rooftop Iridium antenna, and XMIT worked okay, Registered and sent all Block 1-6 dummy files successfully.'),
(@con_inst_id,'2018-03-08 00:00:00','Tested XMIT outside successfully, registered and sent all 6 dummy files successfully on 1st XMIT command try.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-30 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0036.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0036' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-08-15 00:00:00','Completed build up of NEW system sn 0036. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-08-22 00:00:00','Ran Current drain test for 3 days, 13.98mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-08-22 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2018-07-17 00:00:00','Back from Brazil, PI3-17. Was supposed to be deployed at 15N-38W, but was NOT deployed because GPS NOT working???'),
(@con_inst_id,'2018-07-18 00:00:00','GPS bench tested okay with roof GPS antenna, but did NOT work outside on its internal antenna.'),
(@con_inst_id,'2018-07-18 00:00:00','Didn\'t have any new GPS antennas/cables left, so scavenged one from damaged TFLEX0021, and installed into TFLEX0036.'),
(@con_inst_id,'2018-07-18 00:00:00','Upgraded firmware to version 2.01, 170530.'),
(@con_inst_id,'2018-07-18 00:00:00','Successfully tested GPS and Iridium XMIT outside with internal antennas.'),
(@con_inst_id,'2018-07-18 00:00:00','Changed Iridium 1st XMIT time to 00:37'),
(@con_inst_id,'2018-07-18 00:00:00','Installed SS metal standoffs on bottom of circuit board stack.'),
(@con_inst_id,'2018-07-23 00:00:00','Ran Current drain test for 4 days, 14.17mA Average. Dumped FLASH RAM data file, which looked okay.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-08-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0037.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0037' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-08-15 00:00:00','Completed build up of NEW system sn 0037. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-08-25 00:00:00','Ran Current drain test for 3 days, 14.29mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-08-25 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2016-12-09 00:00:00','Put TFLEX0037 outside on test for PI3-17-AN (Brazil). Everything worked except the Hygroclip ATRH. The sensor was okay, so ohmed out ATRH IO pins to the MET board, which all looked okay. So, swapped in a NEW MET board, which fixed the Hygro ATRH.'),
(@con_inst_id,'2018-08-03 00:00:00','DAMAGED on PT016, 4N-38W, mooring broke free, Vandalized? Brasilians reported corrosion inside TFLEX on circuit boards? No FLASH RAM data? Brasilians could not dump data. NEED TO GIVE FLASH CARD TO Dan to dump entire card to look for any data.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-08-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0038.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0038' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-08-15 00:00:00','Completed build up of NEW system sn 0038. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-08-29 00:00:00','Ran Current drain test for 4 days, 16.73mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-08-29 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-08-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0039.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0039' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-09-15 00:00:00','Completed build up of NEW system sn 0039. Tested all sensor inputs successfully. RF modem tested okay. '),
(@con_inst_id,'2016-09-20 00:00:00','Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-09-23 00:00:00','Ran Current drain test for 3 days, 14.16 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-09-23 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-09-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0040.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0040' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-09-15 00:00:00','Completed build up of NEW system sn 0040. Tested all sensor inputs successfully. RF modem tested okay. '),
(@con_inst_id,'2016-09-22 00:00:00','Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-09-28 00:00:00','Ran Current drain test for 4.5 days, 13.98mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-09-28 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-09-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0041.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0041' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-09-15 00:00:00','Completed build up of NEW system sn 0041. Tested all sensor inputs successfully. RF modem tested okay. '),
(@con_inst_id,'2016-09-22 00:00:00','Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-10-03 00:00:00','Ran Current drain test for 4.5 days, 13.94mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2016-10-03 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2016-12-20 00:00:00','Matt Casari borrowed this system to test the new Ocean Server compass board, but applied power incorrectly to the system. Now its current drain is about 20mA high.'),
(@con_inst_id,'2017-02-23 00:00:00','Replaced CPU board. Current drain reduced, but still a bit high about 4mA high. All sensors work, so running current drain test.'),
(@con_inst_id,'2017-02-27 00:00:00','Benchtop Current drain test is a little high, but acceptable at 22.25mA after 4 days testing. Transmitted data looked okay.'),
(@con_inst_id,'2017-03-21 00:00:00','Used this system to check transmit times for Dan Dougherty, and found that SSTC data not working in LOG mode data, reading 1E+35, but SSTC data works okay in the TEST mode SSTC command in the Terminal mode. Needs to be fixed.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-09-15 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0042.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0042' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-03-24 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Waiting for SIM card to test Iridium and to perform current drain test.'),
(@con_inst_id,'2017-04-03 00:00:00','Ran bench current drain test for 3 days, 16.74mA average.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-03-24 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0043.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0043' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-03-24 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Waiting for SIM card to test Iridium and to perform current drain test.'),
(@con_inst_id,'2017-03-31 00:00:00','Ran bench current drain test for 2 days, 13.95mA average.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-03-24 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0044.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0044' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-03-24 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Waiting for SIM card to test Iridium and to perform current drain test.'),
(@con_inst_id,'2017-03-29 00:00:00','Ran Bench current drain test for 2 days, 13.85mA Average.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-03-24 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0045.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0045' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-05-22 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Also installed NEW Iridium SIM card. Needs current drain test.'),
(@con_inst_id,'2017-05-25 00:00:00','Started 1st bench current drain test, but then found IM data reading 2E+35, one day later on the 26th. Reset system, sent initimm command, fixing IM data error, IM data working okay, so restarted current drain test again.'),
(@con_inst_id,'2017-06-01 00:00:00','Ran Bench current drain test again for 5 days, 13.66mA Average, IM data worked okay.'),
(@con_inst_id,'2017-07-15 00:00:00','Ryan used this system for the Gill Wind Sparton/Ocean Server Compass test out at the Grassy Knoll. This system never called into RUDICS via Iridium. NO IRIDIUM Data buffers.'),
(@con_inst_id,'2017-08-23 00:00:00','Ryan brought this system back to the lab. I changed out the Iridium Transmit antenna cable, which fixed the problem. XMIT worked outside of bldg 3.'),
(@con_inst_id,'2017-09-13 00:00:00','Upgraded to version 2.01, 170530 for PI4-17-RB.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-05-22 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0046.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0046' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-05-24 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Also installed Iridium SIM card. Needs current drain test.'),
(@con_inst_id,'2017-06-05 00:00:00','Ran Bench current drain test for 4 days, 13.62mA Average.'),
(@con_inst_id,'2017-09-14 00:00:00','Changed firmware to version 1.16, 161014, O2 version for PNE, PI4-17-RB cruise.'),
(@con_inst_id,'2017-11-17 00:00:00','PI4-17-RB Cruise delayed. Re-tasked 0046 for PI1-18-TH. Changed firmware to v2.01, 170530.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-05-24 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0047.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0047' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-05-23 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Also installed NEW Iridium SIM card. Needs current drain test.'),
(@con_inst_id,'2017-06-09 00:00:00','Ran Bench current drain test for 3 days, 13.85mA Average.'),
(@con_inst_id,'2017-10-24 00:00:00','Back from the Grassy Knoll, Gill Wind Sparton vs. Ocean Server Compass test'),
(@con_inst_id,'2017-10-24 00:00:00','Upgraded firmware to version 2.01, 170530'),
(@con_inst_id,'2018-06-12 00:00:00','Sent to IO1-18 Indonesia. Tested okay here, but while testing on deck at sea, GPS only getting fixes sporadically, 2 of 6, 1 of 6 per day. Need to check antenna connection to RIG board. Maybe move Iridium 1st transmit time later???'),
(@con_inst_id,'2018-10-30 00:00:00','Back from Indonesia, IO1-18. NEEDS TESTING, REPAIR for GPS, GPS module on RIG board? Or NEW GPS antenna???');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-05-23 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0048.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0048' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-08-23 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-08-28 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2017-08-31 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 13.96mA Average.'),
(@con_inst_id,'2017-08-31 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2017-11-17 00:00:00','PI4-17-RB Cruise delayed. Re-tasked 0048 for PI1-18-TH spare. Changed firmware to v2.01, 170530.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-08-23 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0049.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0049' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-08-23 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-08-25 00:00:00','Successfully tested all MET sensor inputs, IM data, and GPS. RF Modem not working with 1st time install of v2.01, 170530 firmware'),
(@con_inst_id,'2017-08-25 00:00:00','RF modem working with version 1.12, 150313 firmware. Then still working when upgrading to v2.01, 170530'),
(@con_inst_id,'2017-08-28 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 13.64mA Average.'),
(@con_inst_id,'2017-08-28 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2018-10-30 00:00:00','Back from Indonesia, IO1-18, NOT deployed, needs checkout/upgrades.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-08-23 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0051.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0051' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-08-23 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-08-31 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2017-09-05 00:00:00','Ran Bench current drain test for 5 days with version 2.01, 170530 firmware, RF modem turned off, 13.72mA Average.'),
(@con_inst_id,'2017-09-05 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-08-23 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0052.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0052' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-10-19 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-10-23 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2017-10-26 00:00:00','Ran Bench current drain test for 5 days with version 2.01, 170530 firmware, RF modem turned off, 13.66mA Average.'),
(@con_inst_id,'2017-10-26 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2018-03-21 00:00:00','Sent for PI4-17-RB with v1.16 Oxygen firmware. Had Iridium transmit problems with 1.16. Tested at PMEL okay. Worked on deck for 3-4 days, then started transmitting only 3 hours of data every 6 hours, with 3 hours missing??? Checked back in the data, and found that the system starting reseting every day 4-13 times per day, which caused the Iridium data loss.'),
(@con_inst_id,'2018-05-22 00:00:00','Installed SS metal standoffs on bottom of ckt board stack.'),
(@con_inst_id,'2018-05-22 00:00:00','Changed firmware to v2.01, 170530, for bench testing Iridium xmit data problem.'),
(@con_inst_id,'2018-05-22 00:00:00','Looked back at Iridium Xmit data while testing on deck on PI4-17-RB. Tested at PMEL okay, tested on deck okay for 5 days, then on March 16th, system starting RESETING. It then had multiple RESETS everyday, until Steve decided to stop it and not use it on the cruise.'),
(@con_inst_id,'2018-06-01 00:00:00','Ran this system 0052 on the bench for 9 days, current drain 14.23mA average, with v2.01 firmware, and it is working without a problem. I think the failure at sea, the resets, and the loss of Iridium data was caused by the loss of the Nortek Aquadopp data while running v1.16, which causes the system to stop working. This system appears to be working okay with v2.01.'),
(@con_inst_id,'2018-06-01 00:00:00','Successfully tested internal antennas with XMIT and GPS outside.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-10-19 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0053.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0053' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-10-20 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-10-26 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2017-10-31 00:00:00','Ran Bench current drain test for 4 days with version 2.01, 170530 firmware, RF modem turned off, 13.62mA Average.'),
(@con_inst_id,'2017-10-31 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2017-11-29 00:00:00','Tried to use outside on test for IO1-18, but did multiple XMIT commands, and system registered, but everytime got an error message \"no connect message received\". Not sure if this is a TFLEX0053 system problem, or an Iridium problem.'),
(@con_inst_id,'2018-09-15 00:00:00','Back from IO2-18-RB, NOT USED, not deployed at 12S-67E due to bad weather on site.'),
(@con_inst_id,'2018-11-01 00:00:00','Installed metal SS standoffs on bottom of circuit board stack.'),
(@con_inst_id,'2018-11-05 00:00:00','Ran Bench current drain test for 4 days with version 2.01, 170530 firmware, RF modem turned off, 12.99mA Average.'),
(@con_inst_id,'2018-11-05 00:00:00','Successfully tested GPS and XMIT commands outside on the internal antennas.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-10-20 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0054.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0054' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-10-20 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-10-31 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2017-11-03 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 13.37mA Average.'),
(@con_inst_id,'2017-11-03 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-10-20 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0055.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0055' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-12-19 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-01-08 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2018-01-15 00:00:00','Ran Bench current drain test for 4 days with version 2.01, 170530 firmware, RF modem turned off, 13.90mA Average.'),
(@con_inst_id,'2018-01-15 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-12-19 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0056.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0056' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-12-19 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-01-10 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2018-01-10 00:00:00','Tried to run bench current drain test, but it seems like the RF modem is NOT turning OFF. Current seems about 20mA higher than other systems.'),
(@con_inst_id,'2018-05-10 00:00:00','Did some bench testing. Current drain seemed higher when first powered up, around 66mA, but then RF modem did turn off and current drain seemed reasonable.'),
(@con_inst_id,'2018-05-11 00:00:00','Installed SS metal circuit board standoffs on bottom stack.'),
(@con_inst_id,'2018-05-16 00:00:00','Ran Bench current drain test for 4.5 days with version 2.01, 170530 firmware, RF modem turned off okay, 15.71mA Average.'),
(@con_inst_id,'2018-05-16 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-12-19 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0057.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0057' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-12-19 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-01-09 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2018-01-19 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 16.61mA Average.'),
(@con_inst_id,'2018-01-19 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2018-03-08 00:00:00','Changed Iridium 1st transmit time to 00:36, since 00:35 seem to be a causing problems with some of the buffer time, with some buffers off by one hour, especially the subsurface Inductive data buffers.'),
(@con_inst_id,'2018-03-22 00:00:00','Changed Iridium 1st transmit time to 00:37, since 00:35 seem to be a causing problems with some of the buffer time, with some buffers off by one hour, especially the subsurface Inductive data buffers.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-12-19 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0058.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0058' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-06-05 00:00:00','Built NEW.'),
(@con_inst_id,'2018-06-06 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (roof antenna), waiting for Iridium SIM card.'),
(@con_inst_id,'2018-06-07 00:00:00','Got SIM cards from Weiming Tan instead of Ben Carlson. Weiming assigned SIM card to wrong RUDICS Group, the AMOS Connect standard instead of the NOAA PMEL Standard. He realized the error, and had Inmarsat support change it to the correct group. Subsequently, the SIM cards and Iridium XMITs started working.'),
(@con_inst_id,'2018-07-30 00:00:00','Ran Bench current drain test for 7 days with version 2.01, 170530 firmware, RF modem turned off, 14.17mA Average.'),
(@con_inst_id,'2018-07-30 00:00:00','Tested internal Iridium & GPS antennas by doing a GPS & XMIT outside, which were both successful.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-06-05 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0059.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0059' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-06-05 00:00:00','Built NEW.'),
(@con_inst_id,'2018-06-06 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (with rooftop antenna), waiting for SIM card.'),
(@con_inst_id,'2018-06-07 00:00:00','Got SIM cards from Weiming Tan instead of Ben Carlson. Weiming assigned SIM card to wrong RUDICS Group, the AMOS Connect standard instead of the NOAA PMEL Standard. He realized the error, and had Inmarsat support change it to the correct group. Subsequently, the SIM cards and Iridium XMITs started working.'),
(@con_inst_id,'2018-07-19 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files (After Weiming Tan found that the new Iridium SIM cards were assigned to the wrong RUDICS Group)'),
(@con_inst_id,'2018-08-01 00:00:00','Ran Bench current drain test for 7 days with version 2.01, 170530 firmware, RF modem turned off, 16.5mA Average. Ran with older HP'),
(@con_inst_id,'2018-08-01 00:00:00','Successfully tested GPS & Iridium internal antennas outside with GPS & XMIT commands.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-06-05 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0060.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0060' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-06-05 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-06-06 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (with rooftop antenna), waiting for SIM card.'),
(@con_inst_id,'2018-06-07 00:00:00','Got SIM cards from Weiming Tan instead of Ben Carlson. Weiming assigned SIM card to wrong RUDICS Group, the AMOS Connect standard instead of the NOAA PMEL Standard. He realized the error, and had Inmarsat support change it to the correct group. Subsequently, the SIM cards and Iridium XMITs started working.'),
(@con_inst_id,'2018-08-06 00:00:00','Ran Bench current drain test for 7 days with version 2.01, 170530 firmware, RF modem turned off, 14.25mA Average.'),
(@con_inst_id,'2018-08-07 00:00:00','Rain Bench current drain test again for 1 day with Gill wind sensor with NEW Ocean Server 4000T compass, had lower average, 12.94mA.'),
(@con_inst_id,'2018-08-07 00:00:00','Tested internal GPS & Iridium antenna by doing an GPS & XMIT outside, which successfully registered and sent dummy files, plus GPS got position, and Time & Date update.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-06-05 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0061.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0061' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-09-10 00:00:00','Built NEW. *USED RECYCLED SEABIRD IMM.'),
(@con_inst_id,'2018-09-11 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (with rooftop antenna), waiting for SIM card.'),
(@con_inst_id,'2018-09-12 00:00:00','Installed new Iridium SIM card.'),
(@con_inst_id,'2018-09-20 00:00:00','Ran Bench current drain test for 7 days with version 2.01, 170530 firmware, but Patrick stopped my running average when he used my multimeter, but average was around 14mA.'),
(@con_inst_id,'2018-10-25 00:00:00','Ran Bench current drain test AGAIN for 3 days with average current drain of 13.33mA. Flash RAM data dump looked good.'),
(@con_inst_id,'2018-10-25 00:00:00','Successfully tested internal GPS & Iridium antenna by doing an GPS & XMIT outside.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-09-10 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0062.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0062' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-09-10 00:00:00','Built NEW. *USED RECYCLED SEABIRD IMM.'),
(@con_inst_id,'2018-09-11 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (with rooftop antenna), waiting for SIM card.'),
(@con_inst_id,'2018-09-12 00:00:00','Installed Iridium SIM card.'),
(@con_inst_id,'2018-10-29 00:00:00','Ran Bench current drain test for 3.5 days with version 2.01, 170530 firmware, RF modem turned off, 13.84mA Average. Downloaded and checked Flash RAM data, which looked good.'),
(@con_inst_id,'2018-10-29 00:00:00','Tested internal GPS & Iridium antenna by doing an GPS & XMIT outside, which successfully registered and sent dummy files, plus GPS got position, and Time & Date update.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-09-10 00:00:00',1,'Built new');
/* History/mksql.py < ../CSV/TMBA0063.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0063' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-09-10 00:00:00','Built NEW. *USED RECYCLED SEABIRD IMM.'),
(@con_inst_id,'2018-09-11 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (with rooftop antenna), waiting for SIM card.'),
(@con_inst_id,'2018-09-12 00:00:00','Installed Iridium SIM card.'),
(@con_inst_id,'2018-11-01 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 13.23mA Average. Downloaded and checked Flash RAM data, which looked good.'),
(@con_inst_id,'2018-11-01 00:00:00','Tested internal GPS & Iridium antenna by doing an GPS & XMIT outside, which successfully registered and sent dummy files, plus GPS got position, and Time & Date update.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-09-10 00:00:00',1,'Built new');
