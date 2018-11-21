/* History/mksql.py < ../CSV/TMBA0042.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0042' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2017-03-24 00:00:00','Built NEW. Successfully tested all MET sensor inputs, RF modem, IM data, and GPS. Waiting for SIM card to test Iridium and to perform current drain test.'),
(@con_inst_id,'2017-04-03 00:00:00','Ran bench current drain test for 3 days, 16.74mA average.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-03-24 00:00:00',1,'Built new');
