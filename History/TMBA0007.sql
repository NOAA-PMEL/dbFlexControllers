/* History/mksql.py < ../CSV/TMBA0007.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0007' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-11-21 00:00:00','Pat updated firmware to v1.11, 111121, which fixes wind, Aquadopp, and Iridium problems.'),
(@con_inst_id,'2011-11-21 23:50:00','Started wind test outside next to compass stand, sensors mounted on a TFLEX tower. ATLAS system is running next to it.'),
(@con_inst_id,'2011-11-22 00:00:00','Rain gauge set upright to collect rain.'),
(@con_inst_id,'2012-01-03 22:01:00','Successfully sent Rudics dialout command XO to turn-on the RF modem'),
(@con_inst_id,'2012-01-03 23:13:00','Stopped TEST, took out of LOG mode via RF modem. Loaded NEW cal file with 16.5deg Magnetic Variation.'),
(@con_inst_id,'2012-01-03 23:15:00','Re-started LOG mode with new cal file (and 16.5deg magnetic variation).'),
(@con_inst_id,'2012-04-09 16:30:00','STOPPED TEST, reset with com cable, dumped data, removed baro & reloaded cal file taking out baro. Moved tower, swapped positions with ATLAS tower. Re-aligned compass heading to north, reading 359.9degs.'),
(@con_inst_id,'2012-04-09 17:15:00','Re-started LOG mode (minus baro sensor), kept 16.5deg magnetic variation, compass aligned to north, 359.9degs.'),
(@con_inst_id,'2012-04-23 16:40:00','STOPPED LOG mode. Mike Strick stopped logging to re-calibrate the Gill wind\'s Sparton compass. There\'s a 6 degree error(?) between the TFLEX and ATLAS winds that cannot be explained.'),
(@con_inst_id,'2012-04-23 17:13:00','Re-started LOG mode with re-calibrated Gill wind Sparton compass (done by Mike Strick).'),
(@con_inst_id,'2012-07-11 00:00:00','Patrick reset while I was at sea on KEO, Time/Date??? Maybe on July 11th, sometime after 1900 GMT, For training with Linda Stratton.'),
(@con_inst_id,'2012-08-04 01:00:00','TEST STOPPED when the test battery pack Logic voltage dropped below 4.5 volts. This test battery pack was a used, medium-sized pack, that lasted for continuous testing since November of 2011.'),
(@con_inst_id,'2012-08-23 16:45:00','TEST re-started (by Mike Strick & Linda Stratton) using new test battery pack. For wind test Atlas comparison outside next to compass stand.'),
(@con_inst_id,'2013-01-13 01:00:00','DATA Stopped when Logic Voltage on the test battery pack went below 5 volts.'),
(@con_inst_id,'2013-01-22 00:00:00','NO DATA written to 2GB flash RAM card during wind test outside PMEL.'),
(@con_inst_id,'2013-01-23 00:00:00','Installed and successfully formated a new 128MB Flash RAM memory card. This card tested okay, with data written to it.'),
(@con_inst_id,'2013-02-04 00:00:00','Updated firmware to version 1.12, 130201'),
(@con_inst_id,'2013-02-19 23:30:00','Tried to start testing for IO3, but had an inductive communications problem with the microcats. No microcat data when using the \"TESTIND\" command. A firmware error is causing all microcats to be addressed at #09 only.'),
(@con_inst_id,'2013-02-20 00:30:00','Started test for IO3-13 without inductive sensors (due to firmware problems)'),
(@con_inst_id,'2013-02-25 17:50:00','Stopped test without inductive sensors.'),
(@con_inst_id,'2013-02-25 18:10:00','Updated firmware to v1.12, 130225, fixing microcat address #09 problem.'),
(@con_inst_id,'2013-02-25 23:30:00','Started testing for IO3-13 with full set of sensors, all calibrated.'),
(@con_inst_id,'2013-03-18 17:45:00','Stopped outside TEST for IO3-13. Data Flash RAM write problem (again!) Data \"File size\" increased on a daily basis, but then when system taken out of LOG mode, File size went to 0.0 Kbytes. Plus, even though the system was taken of LOG mode with 2 Ctrl C\'s while powered in LOG mode, data \"File end date\" was wrong.'),
(@con_inst_id,'2015-03-25 00:00:00','This system was used by Ryan Wells to generate the FLEX complete wiring diagram. For some reason R2 was missing on the Serial board, so installed R2 1 Ohm, 1% resistor.'),
(@con_inst_id,'2015-03-25 00:00:00','TFLEX007 had a data write problem during outside testing, so replaced CPU board and replaced Flash RAM card.'),
(@con_inst_id,'2015-03-25 00:00:00','Installed Firmware in new CPU board, ver 1.12, 150313. Formated new 2GB Flash RAM card.'),
(@con_inst_id,'2015-03-25 00:00:00','Updated CPU R4 to 887 Ohms, removed solder bridge on CPU JP24.'),
(@con_inst_id,'2015-04-13 00:00:00','Installed R44 267K & R45 1.87M resistors on CPU board to enable xmit battery voltage monitor telemetry'),
(@con_inst_id,'2013-04-15 00:00:00','Finished current drain 2 day test with all sensors in the doghouse, 14.60mA Ave. Dumped data. Data written to Compact Flash OKAY.'),
(@con_inst_id,'2015-07-15 00:00:00','Air shipped to IO1-15, not deployed, wrong buoy, so re-tasked to IO4-15.'),
(@con_inst_id,'2018-03-02 00:00:00','Back from India Air shipment, November 2018. Rec RT-006, 12S81E, recovered 2016-11-26. No failures indicated during deployment in System Status on TFLEX data page.'),
(@con_inst_id,'2018-03-02 00:00:00','Tried to start benchtop current drain testing. Everything working, but Iridium. Iridium XMIT command registers, but then sends Platform ID 6 times and times out, does not send data. But this system had Iridium tranmsit problems during the deployment.'),
(@con_inst_id,'2018-03-05 00:00:00','Updated Rain gauge shield grounding to power ground, Rain Pin1-to-Pin6, including installing new stainless bulkhead connector. Also installed new Ground bulkhead connector, connecting pin1 & pin2 together. Fixed crazy pin 22 on Iridium white wire line to solder pin on connector board, wiring it directly to J9 microfit connector. Plus cut out common power wire between compass and wind connectors on connector board.'),
(@con_inst_id,'2018-03-05 00:00:00','Updated firmware to version 2.10, 170530, plus updated Iridium first transmit time to 00:41.'),
(@con_inst_id,'2018-03-12 00:00:00','Ran a benchtop current drain test for 6 days with a 14.27mA average.'),
(@con_inst_id,'2018-03-13 00:00:00','Tried to test the XMIT Iridium test outside on internal pack, but got error \"No coms with modem\". Found that there was no power to Iridium modem. Took off Connector board and found that all 4 diodes were NOT soldered on one side. Soldered all diodes and fixed problem.'),
(@con_inst_id,'2018-05-03 00:00:00','Installed SS metal circuit board standoffs on bottom stack.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');