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
