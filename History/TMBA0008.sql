/* History/mksql.py < ../CSV/TMBA0008.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0008' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-03-01 00:00:00','Built NEW. Initially the CPU board would not program (firmware) while plugged into Serial Board. Found U36 installed backwards by stuffers. Dirk removed & replaced U36. Plugged in CPU board with repaired Serial board, was able to load firmware version 1.11, 111121.'),
(@con_inst_id,'2012-03-05 00:00:00','Tested all sensor inputs successfully, except inductive modem, which will not work with IMM version 1.14. NEEDS IMM v1.12. Also installed new sim card into Iridium modem.'),
(@con_inst_id,'2012-03-06 00:00:00','Installed new IMM with v1.12 firmware. Inductive circuit tested good after INITIMM command sent.'),
(@con_inst_id,'2012-03-07 00:00:00','XMIT & GPS tests good outside in Dog house.'),
(@con_inst_id,'2012-03-08 00:00:00','Did 3 day current drain test, 17mA ave recorded (with RF modem powered OFF).'),
(@con_inst_id,'2012-03-19 00:00:00','Started current drain test with all sensors connected.'),
(@con_inst_id,'2012-03-29 00:00:00','Ended current drain test with all sensors. Average current drain = 22.15mA.'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-05 00:00:00','NEW in lab, needs testing for LW & SW in log mode.'),
(@con_inst_id,'2015-03-27 00:00:00','Replaced MET board, U1, U2, & U40 wrong brand, not TI chips? Plus swapped MET bd to fix LW & SW issue, no data in LOG mode.'),
(@con_inst_id,'2015-03-27 00:00:00','Updated CPU R4 to 887 Ohms, removed solder bridge on CPU JP24, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-04-06 00:00:00','Did 3 day current drain test with all sensors in the doghouse, 13.86mA ave recorded (with RF modem powered OFF). Flash RAM data good. SW & LW data good.'),
(@con_inst_id,'2015-08-03 00:00:00','Shipped for PI3-15'),
(@con_inst_id,'2017-06-08 00:00:00','Updated Rain shield ground to power ground. Removed jumped wire between Pin7-Pin7 Power on Compass and wind sensor.'),
(@con_inst_id,'2017-06-08 00:00:00','Updated Iridium 1st call time to 00:42'),
(@con_inst_id,'2017-06-09 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, GPS, and Iridium XMIT. Needs current drain re-check.'),
(@con_inst_id,'2017-06-13 00:00:00','Ran current drain test, 14.77mA average over 3 days.'),
(@con_inst_id,'2017-09-14 00:00:00','Changed firmware to version 1.16, 161014, O2 version for PNE, PI4-17-RB cruise.'),
(@con_inst_id,'2017-11-17 00:00:00','PI4-17-RB Cruise delayed. Re-tasked 0008 for PI1-18-TH. Changed firmware to v2.01, 170530.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-03-01 00:00:00',1,'Built new');
