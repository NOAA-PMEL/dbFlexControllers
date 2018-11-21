/* History/mksql.py < ../CSV/TMBA0057.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0057' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-12-19 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-01-09 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2018-01-19 00:00:00','Ran Bench current drain test for 3 days with version 2.01, 170530 firmware, RF modem turned off, 16.61mA Average.'),
(@con_inst_id,'2018-01-19 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.'),
(@con_inst_id,'2018-03-08 00:00:00','Changed Iridium 1st transmit time to 00:36, since 00:35 seem to be a causing problems with some of the buffer time, with some buffers off by one hour, especially the subsurface Inductive data buffers.'),
(@con_inst_id,'2018-03-22 00:00:00','Changed Iridium 1st transmit time to 00:37, since 00:35 seem to be a causing problems with some of the buffer time, with some buffers off by one hour, especially the subsurface Inductive data buffers.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-12-19 00:00:00',1,'Built new');
