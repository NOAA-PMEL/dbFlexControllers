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
