/* History/mksql.py < ../CSV/OCSX0007.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0007' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 14:59:11','Deployed KE006\r\nWired for Druck, Vaisala\r\n'),
(@con_inst_id,'2008-06-24 12:00:00','AT channel A/D calibration:\r\n-3.991594E-01	2.464431E-04\r\nRH channel A/D calibration:\r\n4.527267E-04	2.686891E-04'),
(@con_inst_id,'2009-09-04 00:00:00','Recovered KE006, Flex v1.05 080721. Worked well -rk'),
(@con_inst_id,'2010-01-14 11:55:17','Post-deployment (KEO006) I/O cal for ATRH performed by Pat. AT A/D calibration A3 = -3.98868E-01, A4= 2.465779E-04, RH A/D calibration A3 = 1.672821E-04, A4 = 2.692713E-04 (kbr)'),
(@con_inst_id,'2010-02-25 10:10:48','Only has one 62 pin; use for hygroclip cal box - rk'),
(@con_inst_id,'2010-03-01 16:30:18','Modified to be hygroclip cal box, ATRH cal software installed. -rk'),
(@con_inst_id,'2011-01-13 12:37:40','Circuit boards removed to use in box 2. JAK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-01-13 12:37:40',6,'Circuit boards removed to use in box 2. JAK');