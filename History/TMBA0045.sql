/* History/mksql.py < ../CSV/TMBA0045.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0045' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-05-22 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Also installed NEW Iridium SIM card. Needs current drain test.'),
(@con_inst_id,'2017-05-25 00:00:00','Started 1st bench current drain test, but then found IM data reading 2E+35, one day later on the 26th. Reset system, sent initimm command, fixing IM data error, IM data working okay, so restarted current drain test again.'),
(@con_inst_id,'2017-06-01 00:00:00','Ran Bench current drain test again for 5 days, 13.66mA Average, IM data worked okay.'),
(@con_inst_id,'2017-07-15 00:00:00','Ryan used this system for the Gill Wind Sparton/Ocean Server Compass test out at the Grassy Knoll. This system never called into RUDICS via Iridium. NO IRIDIUM Data buffers.'),
(@con_inst_id,'2017-08-23 00:00:00','Ryan brought this system back to the lab. I changed out the Iridium Transmit antenna cable, which fixed the problem. XMIT worked outside of bldg 3.'),
(@con_inst_id,'2017-09-13 00:00:00','Upgraded to version 2.01, 170530 for PI4-17-RB.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-05-22 00:00:00',1,'Built new');
