/* History/mksql.py < ../CSV/TMBA0060.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0060' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2018-06-05 00:00:00','Built NEW. Installed NEW Iridium SIM Card.'),
(@con_inst_id,'2018-06-06 00:00:00','Successfully tested all MET sensor inputs, RF modem, IM data, and GPS (with rooftop antenna), waiting for SIM card.'),
(@con_inst_id,'2018-06-07 00:00:00','Got SIM cards from Weiming Tan instead of Ben Carlson. Weiming assigned SIM card to wrong RUDICS Group, the AMOS Connect standard instead of the NOAA PMEL Standard. He realized the error, and had Inmarsat support change it to the correct group. Subsequently, the SIM cards and Iridium XMITs started working.'),
(@con_inst_id,'2018-08-06 00:00:00','Ran Bench current drain test for 7 days with version 2.01, 170530 firmware, RF modem turned off, 14.25mA Average.'),
(@con_inst_id,'2018-08-07 00:00:00','Rain Bench current drain test again for 1 day with Gill wind sensor with NEW Ocean Server 4000T compass, had lower average, 12.94mA.'),
(@con_inst_id,'2018-08-07 00:00:00','Tested internal GPS & Iridium antenna by doing an GPS & XMIT outside, which successfully registered and sent dummy files, plus GPS got position, and Time & Date update.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2018-06-05 00:00:00',1,'Built new');
