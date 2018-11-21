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
