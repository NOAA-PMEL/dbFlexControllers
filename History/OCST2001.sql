/* History/mksql.py < ../CSV/OCST2001.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '2001' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2014-06-18 00:00:00','New TFlex system. Deployed at PA008. JAK'),
(@con_inst_id,'2015-07-01 14:38:07','Recovered from PA008 6/16/15. Evidence of water intrusion. Salt crystals below RF antenna. JAK'),
(@con_inst_id,'2017-06-30 14:21:25','Deployed PA011A 6/14/17 - PB');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-06-30 14:21:25',7,'Deployed PA011A 6/14/17 - PB');
