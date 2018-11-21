/* History/mksql.py < ../CSV/TMBA0056.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0056' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-12-19 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-01-10 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS.'),
(@con_inst_id,'2018-01-10 00:00:00','Tried to run bench current drain test, but it seems like the RF modem is NOT turning OFF. Current seems about 20mA higher than other systems.'),
(@con_inst_id,'2018-05-10 00:00:00','Did some bench testing. Current drain seemed higher when first powered up, around 66mA, but then RF modem did turn off and current drain seemed reasonable.'),
(@con_inst_id,'2018-05-11 00:00:00','Installed SS metal circuit board standoffs on bottom stack.'),
(@con_inst_id,'2018-05-16 00:00:00','Ran Bench current drain test for 4.5 days with version 2.01, 170530 firmware, RF modem turned off okay, 15.71mA Average.'),
(@con_inst_id,'2018-05-16 00:00:00','Tested internal Iridium antenna by doing an XMIT outside, which successfully registered and sent dummy files.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-12-19 00:00:00',1,'Built new');
