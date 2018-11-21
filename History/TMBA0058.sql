/* History/mksql.py < ../CSV/TMBA0058.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0058' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-06-05 00:00:00','Built NEW.'),
(@con_inst_id,'2018-06-06 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (roof antenna), waiting for Iridium SIM card.'),
(@con_inst_id,'2018-06-07 00:00:00','Got SIM cards from Weiming Tan instead of Ben Carlson. Weiming assigned SIM card to wrong RUDICS Group, the AMOS Connect standard instead of the NOAA PMEL Standard. He realized the error, and had Inmarsat support change it to the correct group. Subsequently, the SIM cards and Iridium XMITs started working.'),
(@con_inst_id,'2018-07-30 00:00:00','Ran Bench current drain test for 7 days with version 2.01, 170530 firmware, RF modem turned off, 14.17mA Average.'),
(@con_inst_id,'2018-07-30 00:00:00','Tested internal Iridium & GPS antennas by doing a GPS & XMIT outside, which were both successful.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-06-05 00:00:00',1,'Built new');
