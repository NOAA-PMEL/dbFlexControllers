/* History/mksql.py < ../CSV/TMBA0010.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0010' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-05-30 00:00:00','Installed new circuit boards, CPU, Serial, and MET. CPU not working correctly due to the wrong Oscillator installed. Part should be 32.768KHZ, not 32.0KHZ. The wrong oscillator causes the RS232 serial data to be clocked incorrectly, so the serial data out is all garbage, control characters.'),
(@con_inst_id,'2013-05-30 00:00:00','Dirk found the problem and installed the correct oscillator, 32.768KHZ. CPU working now. '),
(@con_inst_id,'2013-05-31 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-06-11 00:00:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-06-13 21:30:00','Stopped current drain test. Ave current = 13.27mA'),
(@con_inst_id,'2013-08-06 00:00:00','Accidentally plugged Radiation input into the wind, and wind into the Radiation connector in the dog house. It seems to be working okay, but it should be mentioned here to check those test sensors and to recheck current drain for TFLEX0010.'),
(@con_inst_id,'2014-05-02 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-09-14 00:00:00','Spare sent for IO1-15 & IO4-15'),
(@con_inst_id,'2017-12-21 00:00:00','Back from India air shipment'),
(@con_inst_id,'2017-12-28 00:00:00','Updated RAIN shield ground from seawater to power ground, pin1 connected to pin6. Installed new ground connector, pin1 & pin2 connected for the IM ground.'),
(@con_inst_id,'2017-12-28 00:00:00','Updated RAIN shield ground from seawater to power ground, pin1 connected to pin6. Installed new ground connector, pin1 & pin2 connected for the IM ground. CPU R4 change to 887 Ohms.'),
(@con_inst_id,'2017-12-29 00:00:00','Back from India Air shipment, December 2017. Updated Iridium 1st Xmit time to 00:44.'),
(@con_inst_id,'2018-01-02 00:00:00','Ran current drain test for 3 days, 16.22mA Average.'),
(@con_inst_id,'2018-01-02 00:00:00','Successfully tested GPS and Iridium XMIT test outside.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
