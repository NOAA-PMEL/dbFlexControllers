/* History/mksql.py < ../CSV/TMBA0011.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0011' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-03 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-03 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-06-18 19:10:00','Started current drain test with all sensors in Doghouse outside'),
(@con_inst_id,'2013-06-20 16:19:00','Current drain test. Ave current = 16.36mA'),
(@con_inst_id,'2013-06-26 16:19:00','Current drain test. Ave current = 16.22mA'),
(@con_inst_id,'2013-06-27 16:20:00','Stopped current drain test. Ave current = 16.20mA'),
(@con_inst_id,'2014-05-05 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-03-20 00:00:00','Updated CPU R4 to 887 Ohms, and updated firmware to ver 1.12, 150313.'),
(@con_inst_id,'2015-03-30 00:00:00','Gill wind not working, no pwr on faceplate connector. Found pwr jumpers JP16 and JP20 configured incorrectly, fixed jumpers to Main Battery voltage pin 9-10 on both, which fixed wind.'),
(@con_inst_id,'2015-03-31 00:00:00','Noticed Logic battery and Iridium xmit battery voltages the same, equal to Logic voltage. Xmit battery voltage not working. Needs to be fixed.'),
(@con_inst_id,'2015-04-01 00:00:00','Fixed Iridium Modem IM battery voltage A/D by removing jumper on J4, that for some reason was jumpered in error. It may have been EDD using this system for testing.'),
(@con_inst_id,'2015-04-24 00:00:00','Ran a 2-day current drain test with all sensors out in the doghouse, 15.05mA Average.'),
(@con_inst_id,'2015-08-03 00:00:00','Shipped for PI3-15, spare'),
(@con_inst_id,'2016-09-07 00:00:00','Changed Rain shield ground from Seawater ground to power ground.'),
(@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'),
(@con_inst_id,'2018-03-23 00:00:00','Rec PT011, 12N-23W, worked okay. Had a lot of resets starting about 4 months into the deployment. O2 firmware v 1.16. Had 163 resets.'),
(@con_inst_id,'2018-08-22 00:00:00','Installed metal SS standoffs at the bottom of the circuit board stack.'),
(@con_inst_id,'2018-08-22 00:00:00','Converted firmware to 2.01, 170530, for bench current drain test.'),
(@con_inst_id,'2018-08-22 00:00:00','Changed Iridium 1st transmit time to 00:45.'),
(@con_inst_id,'2018-08-23 00:00:00','This system had 163 resets running the O2 firmware v 1.16. On day 7 of a bench test, this system had ONE RESET, and 6 hours of all Iridium data was lost, not transmittted. The GPS position also was missing. Need to let it run a little longer to make sure that this is NOT a chronic problem.'),
(@con_inst_id,'2018-09-10 00:00:00','Ran this system an additional 6 days, and it did NOT have any additonal resets, so I think its okay, and may have been an issue with just one of the Iridium 6 hour buffer transmits.'),
(@con_inst_id,'2018-09-10 00:00:00','Ran for a total of 14 days, current drain test, current drain average 14.76mA. '),
(@con_inst_id,'2018-09-10 00:00:00','Tested GPS outside okay, but XMIT did not work well. Did XMIT 5 times outside, and it worked okay only one time. Saw computer to modem coms BAD error once. Then other XMITs took a long time, and they would send all 6 of the dummy files, but then hanged and timed out, and repeated the XMIT. '),
(@con_inst_id,'2018-09-10 00:00:00','THIS SYSTEM TFLEX0011 should NOT be used, since it has intermittent Iridium problems.'),
(@con_inst_id,'2018-09-11 00:00:00','Replaced Iridium modem (recycled from TFLEX0002). Replaced Serial board with new board. Replaced GPS & Iridium antennas and antenna cables. Tested XMIT multiple times inside on rooftop antenna and outside with its internal antennas. XMIT worked great! Registering and successfully transmitting dummy files quickly. It did this multiple times, so I think this system is fixed and ready to go. It will run on the bench again for a couple of days for a current drain check again just to be sure.'),
(@con_inst_id,'2018-09-17 00:00:00','Ran another current drain test on the bench for 6 days, after Iridium repairs above, current drain 16.66mA average, NO RESETS.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
