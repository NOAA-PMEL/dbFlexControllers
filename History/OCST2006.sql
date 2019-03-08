/* History/mksql.py < ../CSV/OCST2006.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2006' AND `type_id` = 1; INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`) VALUES (@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'), (@con_inst_id,'2016-08-18 08:43:05','Deployed at KE 014 on 07/31/16. DK'), (@con_inst_id,'2017-07-27 14:58:07','Recovered KEO14A KE1-17-BF - Pb');
INSERT INTO InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`) VALUES (@con_inst_id,'2017-07-27 14:58:07',1,'Recovered KEO14A KE1-17-BF - Pb');
