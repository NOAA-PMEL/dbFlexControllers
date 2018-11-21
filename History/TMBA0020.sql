/* History/mksql.py < ../CSV/TMBA0020.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0020' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-10-22 00:00:00','Entire system 0020 built up, Iridium SIM card installed. All sensors tested okay. All functions tested okay, RF modem & Irdium xmit successful. Needs current drain testing.'),
(@con_inst_id,'2015-10-30 00:00:00','Ran Current drain test, 14.28mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2015-12-14 00:00:00','Tested outside Bldg 3 alongside 3 other new TFLEX systems 18, 19, & 21. Seemed to miss more Iridium transmit windows with no data 6 and sometimes 12 hours of data missing. This system should be put out at the Grassy Knoll to see if its just because it\'s near the building.'),
(@con_inst_id,'2016-07-15 00:00:00','Tested on the bench connected to the roof-top Iridium antenna. TFLEX0020 registered and transmitted its files on the 1st XMIT with no problems.'),
(@con_inst_id,'2017-12-14 00:00:00','Back from Indian Air shipment, new system, never deployed.'),
(@con_inst_id,'2017-12-15 00:00:00','Upated Iridium 1st xmit time to 00:43, upgraded firmware to version 2.01, 170530.'),
(@con_inst_id,'2017-12-11 00:00:00','Back from Indian Air shipment'),
(@con_inst_id,'2017-12-15 00:00:00','Updated Iridium 1st Transmit time to 00:43, and updated firmware to version 2.01, 170530'),
(@con_inst_id,'2017-12-18 00:00:00','Ran current drain test over the weekend for 2+ days, everything worked okay, 13.55mA average. Successfully tested Xmit Iridium test and GPS outside.'),
(@con_inst_id,'2018-09-20 00:00:00','Back from IO2-18-RB, not deployed due to rough weather'),
(@con_inst_id,'2018-11-05 00:00:00','Installed metal SS standoffs on the bottom of the circuit board stack.'),
(@con_inst_id,'2018-11-09 00:00:00','Ran 3 day current drain test, everything worked okay, 12.63mA average.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-10-22 00:00:00',1,'Built new');
