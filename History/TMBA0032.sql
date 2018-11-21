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
