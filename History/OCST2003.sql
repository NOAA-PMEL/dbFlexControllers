/* History/mksql.py < ../CSV/OCST2003.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2003' AND `type_id` = 1; INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`) VALUES (@con_inst_id,'2014-06-15 00:00:00','New TFlex system. JAK'), (@con_inst_id,'2015-07-01 14:31:35','Deployed at PA009 6/15/16. JAK'), (@con_inst_id,'2016-08-18 08:37:51','Recovered from PA 009 on 07/05/16. DK');
INSERT INTO InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`) VALUES (@con_inst_id,'2016-08-18 08:37:51',1,'Recovered from PA 009 on 07/05/16. DK');
