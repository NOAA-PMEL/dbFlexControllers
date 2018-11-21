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
