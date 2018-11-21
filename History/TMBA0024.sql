/* History/mksql.py < ../CSV/TMBA0024.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0024' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2016-06-13 00:00:00','Completed build up of NEW system sn 0024. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'),
(@con_inst_id,'2016-06-22 00:00:00','Setup Config by mistake, that did 6min Iridium calls and 6min GPS fixes. Data did not work and system reset 4 times. After config properly setup, then ran Current drain test for 4 days, but Mulit-meter showed error, so had to restart test. Finally got 2 day current drain average of 14.22mA. Dumped Flash RAM data,which looked okay.'),
(@con_inst_id,'2016-06-22 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'),
(@con_inst_id,'2017-11-27 00:00:00','Rec IO4-17-SN, SteveK. Failed, No coms, Steve brought back Flash RAM card, he could not dump data. He also said that he found corrosion on chips on CPU board.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2016-06-13 00:00:00',1,'Built new');
