/* History/mksql.py < ../CSV/TMBA0015.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0015' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2012-08-31 00:00:00','Chassis built up and wired up, including RIG board, waiting for rest of circuit boards to be made.'),
(@con_inst_id,'2013-06-04 00:00:00','Installed NEW circuit boards, MET, Serial, and CPU board. '),
(@con_inst_id,'2013-06-04 00:00:00','Installed new firware version 1.12, 130306. All data inputs tested okay. RF modem tested okay. Formated new 2GB Flash Ram Card.'),
(@con_inst_id,'2013-07-16 21:00:00','Started current drain test with all sensors in Doghouse outside.'),
(@con_inst_id,'2013-07-17 22:00:00','Ave current drain = 18.51mA'),
(@con_inst_id,'2013-07-18 21:45:00','Ave current drain = 17.38mA'),
(@con_inst_id,'2013-07-22 23:45:00','Stopped current drain test. Ave current = 17.7mA'),
(@con_inst_id,'2013-08-14 18:20:00','Started testing outside for PI3-13-RB, spare system.'),
(@con_inst_id,'2013-08-19 18:05:00','Stopped PI3-13 test to upgrade firmware to v1.12, 130816'),
(@con_inst_id,'2013-08-19 21:36:00','Re-started PI3-13 testing outside, spare system.'),
(@con_inst_id,'2013-08-26 23:45:00','Disconnected Nortek Aquadopp from Inductive test loop.'),
(@con_inst_id,'2013-09-04 21:35:00','PI3-13 testing stopped.'),
(@con_inst_id,'2014-05-05 00:00:00','Installed re-worked MET board with changes to U1, U2, U40. Also removed JP24 solder bridge on CPU bd. Plus updated firmware to v1.12, 140211.'),
(@con_inst_id,'2015-08-30 00:00:00','Deployed on IO1-15b, 4S-80.5E, RT005. Reports of problems with Iridium transmit problems, missing Iridium buffers, not sent???'),
(@con_inst_id,'2017-12-01 00:00:00','Back from India, air shipment'),
(@con_inst_id,'2018-03-12 00:00:00','Updated Rain gauge shield grounding to power ground, Rain Pin1-to-Pin6, including installing new stainless bulkhead connector. Also installed new Ground bulkhead connector, connecting pin1 & pin2 together. Plus cut out common power wire between compass and wind connectors on connector board.'),
(@con_inst_id,'2018-03-12 00:00:00','Upated firmware to version 2.10, 170530, plus updated Iridium first transmit time to 00:38.'),
(@con_inst_id,'2018-03-16 00:00:00','Ran bench current drain test 15.54mA average for 4 days, plus everything worked including Iridium transmissions had no problems, but will change out the Iridium antenna cable to hopefully solve Iridium transmit issues during the last deployment on RT005.'),
(@con_inst_id,'2018-03-16 00:00:00','Replaced Iridium antenna and Iridium antenna cable. Successfully tested GPS and Iridium XMIT outside.'),
(@con_inst_id,'2018-05-07 00:00:00','Installed SS metal bottom circuit board stack standoffs.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2012-08-31 00:00:00',1,'Built new');
