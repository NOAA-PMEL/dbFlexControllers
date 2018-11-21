/* History/mksql.py < ../CSV/TMBA0047.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0047' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-05-23 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Also installed NEW Iridium SIM card. Needs current drain test.'),
(@con_inst_id,'2017-06-09 00:00:00','Ran Bench current drain test for 3 days, 13.85mA Average.'),
(@con_inst_id,'2017-10-24 00:00:00','Back from the Grassy Knoll, Gill Wind Sparton vs. Ocean Server Compass test'),
(@con_inst_id,'2017-10-24 00:00:00','Upgraded firmware to version 2.01, 170530'),
(@con_inst_id,'2018-06-12 00:00:00','Sent to IO1-18 Indonesia. Tested okay here, but while testing on deck at sea, GPS only getting fixes sporadically, 2 of 6, 1 of 6 per day. Need to check antenna connection to RIG board. Maybe move Iridium 1st transmit time later???'),
(@con_inst_id,'2018-10-30 00:00:00','Back from Indonesia, IO1-18. NEEDS TESTING, REPAIR for GPS, GPS module on RIG board? Or NEW GPS antenna???');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-05-23 00:00:00',1,'Built new');
