/* History/mksql.py < ../CSV/TMBA0048.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0048' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-08-23 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2017-08-28 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2017-08-31 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 13.96mA Average.'),
(@con_inst_id,'2017-08-31 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2017-11-17 00:00:00','PI4-17-RB Cruise delayed. Re-tasked 0048 for PI1-18-TH spare. Changed firmware to v2.01, 170530.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-08-23 00:00:00',1,'Built new');