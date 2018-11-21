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
