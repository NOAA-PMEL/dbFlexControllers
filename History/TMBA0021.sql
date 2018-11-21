/* History/mksql.py < ../CSV/TMBA0021.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0021' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2015-10-22 00:00:00','Built up system 0021, all sensors worked, except Baro BP and SWR. Found two pairs of pins on U17 in Baro circuit with solder bridges. Once removed, Baro worked and fixed, as well as SWR.'),
(@con_inst_id,'2015-10-22 00:00:00','Iridium SIM card installed. All sensors tested okay. All functions tested okay, RF modem & Irdium xmit successful. Needs current drain testing.'),
(@con_inst_id,'2015-11-02 00:00:00','Ran Current drain test, 18.5mA Average. Dumped FLASH RAM data file, which looked okay.'),
(@con_inst_id,'2017-09-20 00:00:00','Deployed at RT009,4S-67E. Rec IO2-17-IS, Korean ship. Found mooring with Tower torn off, all sensor cables torn off/broken. Needs repair'),
(@con_inst_id,'2018-07-18 00:00:00','I canibalized and scavenged the GPS antenna out of this system because I need one and had NO new ones on the shelf. GPS antenna was okay.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-10-22 00:00:00',1,'Built new');
