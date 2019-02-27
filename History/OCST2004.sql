/* History/mksql.py < ../CSV/OCST2004.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2004' AND `type_id` = 1; INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`) VALUES (@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'), (@con_inst_id,'2015-09-07 13:15:46','Deployed on KE-013. JAK'), (@con_inst_id,'2016-08-18 08:59:57','Recovered on 08/01/16 from KE 013. DK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`) VALUES (@con_inst_id,'2016-08-18 08:59:57',1,'Recovered on 08/01/16 from KE 013. DK');
