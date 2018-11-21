/* History/mksql.py < ../CSV/TMBA0006.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0006' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-02 00:00:00','Updated firmware to version 1.11, 111121'),
(@con_inst_id,'2012-01-26 19:40:00','Started test outside Bldg 3 for IO4-12. Spare system with 1 TC, 1 T, Nortek, no LWR, no BP. Magnetic variation set to 0 degrees.'),
(@con_inst_id,'2012-02-01 18:20:00','IO4-12 Test complete'),
(@con_inst_id,'2012-07-18 00:00:00','Shipped for IO4-12, Feb 7, 2012, spare system, but not deployed.'),
(@con_inst_id,'2012-12-18 00:00:00','Retasked for IO7-12, spare system.'),
(@con_inst_id,'2013-01-10 00:00:00','IO7-12-SN spare system, not deployed. Will be shipped back from India.'),
(@con_inst_id,'2013-04-10 00:00:00','Back from IO7-12-SN.'),
(@con_inst_id,'2013-05-30 00:00:00','Updated firmware to version 1.12, 130306.'),
(@con_inst_id,'2013-08-09 19:00:00','Started testing outside for PI3-13-RB, PT003, 20N-38W'),
(@con_inst_id,'2013-08-19 18:00:00','Stopped PI3-13 test to upgrade firmware to v1.12, 130816'),
(@con_inst_id,'2013-08-19 21:30:00','Re-started PI3-13 testing outside.'),
(@con_inst_id,'2013-08-26 23:05:00','Disconnected Inductive all inductive sensors and SSTC microcat.'),
(@con_inst_id,'2013-08-30 19:20:00','Stopped PI3-13 testing.'),
(@con_inst_id,'2013-11-20 00:00:00','FAILED on PT003, works (calling in), but all sensors reading 1E+35. Pat thinks its something power related.'),
(@con_inst_id,'2015-01-06 00:00:00','Recovered on PI3-14-EN. PT003 Buoy found with tower missing. Faceplate trashed, with corroded bulkhead connectors. Antenna housing dragged across deck during recovery, plus RF antenna broken.'),
(@con_inst_id,'2017-05-15 00:00:00','System re-purposed for TFLEX topsection testing. SIM card taken out and used in FLEX box for firmware testing.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');