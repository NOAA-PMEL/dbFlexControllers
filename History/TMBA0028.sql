/* History/mksql.py < ../CSV/TMBA0028.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0028' AND `type_id` = 1; INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`) VALUES (@con_inst_id,'2016-06-09 00:00:00','Completed build up of NEW system sn 0027. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Successfully tested GPS and XMIT functions with roof-mounted antennas connected inside lab.'), (@con_inst_id,'2016-06-27 00:00:00','Ran Current drain test for 3 days, 14.65mA Average. Dumped FLASH RAM data file, which looked okay.'), (@con_inst_id,'2016-06-27 00:00:00','Need to run GPS and XMIT test with system antennas (not roof antennas).'), (@con_inst_id,'2016-10-18 00:00:00','Updated Firmware to v 1.16, 161014 for PI1-17-RB, to get German Oxygen sensor data for PI1-17-RB.'), (@con_inst_id,'2018-11-17 00:00:00','LOST at 8N-90E, RT-014, Mooring vandalized. Not found on site during IO3-18-SN.');
INSERT INTO InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`) VALUES (@con_inst_id,'2016-06-09 00:00:00',1,'Built new');