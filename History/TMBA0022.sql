/* History/mksql.py < ../CSV/TMBA0022.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0022' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-11-17 00:00:00','Completed build up of NEW system sn 0022. Tested all sensor inputs successfully. RF modem tested okay. Installed new Iridium SIM card. Still needs GPS and Iridium XMIT test. Also still needs current drain test.'),
(@con_inst_id,'2015-11-18 19:20:00','Successfully tested GPS and Iridium XMIT function outside, although it tood 4 XMIT commands for it to finally register with Iridium. XMIT test files sent okay.'),
(@con_inst_id,'2015-11-23 00:00:00','Ran Current drain test for 2 days, 15.10 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-12-14 00:00:00','Finally back from India (air shipment), changed Iridium 1st xmit time to 00:45, also updated firmware to v2.01,170530. Checked Iridium and GPS outside successfully.'),
(@con_inst_id,'2017-12-15 00:00:00','Did 1 day current drain & functional test. All sensors working, current drain 13.75mA ave.'),
(@con_inst_id,'2018-09-20 00:00:00','Back from IO2-18-RB, not deployed at 8S-81E due to bad weather.'),
(@con_inst_id,'2018-11-08 00:00:00','Installed metal SS standoffs on the bottom of the circuit board stack.'),
(@con_inst_id,'2018-11-13 00:00:00','Ran Current drain test for 4 days, 12.88 mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2018-11-13 00:00:00','Successfully tested GPS and Iridium XMIT commands outside with internal antennas.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-11-17 00:00:00',1,'Built new');
