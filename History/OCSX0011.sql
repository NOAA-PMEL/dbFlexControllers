/* History/mksql.py < ../CSV/OCSX0011.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0011' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 15:00:38','Previously known as \"KEO\", deployed KE005\nWired for Druck, SWR/LWR\n128MB\nCPU board 4005\nserial board 1005\nmet board 1005\nRIG board 2005'),
(@con_inst_id,'2007-06-01 12:00:00','AT channel A/D cal:\r\n-0.39877 .00024402\r\nRH channel A/D cal:\r\n-0.0015392 0.00026992\r\ndate VERY approximate');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2007-06-01 12:00:00',6,'AT channel A/D cal:\r\n-0.39877 .00024402\r\nRH channel A/D cal:\r\n-0.0015392 0.00026992\r\ndate VERY approximate');
