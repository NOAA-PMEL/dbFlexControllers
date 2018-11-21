/* History/mksql.py < ../CSV/OCSX0005.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0005' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2009-01-23 14:05:27','Wired for ParoS, Vaisala\r\n128 MB\r\nCPU board 4003\r\nserial board 1003\r\nmet board 1003\r\nRIG board 2003'),
(@con_inst_id,'2009-01-23 14:06:20','In lab, PA003 spare\r\n01.06 08/12/08 firmware'),
(@con_inst_id,'2009-02-23 16:33:35','testing in parking lot for PA003\n1.07 2009-09-20 firmware'),
(@con_inst_id,'2009-05-30 14:29:54','Shipping to PA003 (PA2-09-TU) as spare. 1.07 090420 firmware.'),
(@con_inst_id,'2009-05-29 00:00:00','Showed intermittent noise on LWR and Rain channels when testing near bldg 3 (shed and buoy). No problems up at grassy knoll van. -rk'),
(@con_inst_id,'2009-05-22 12:00:00','New I/O cals. AT: A3 -4.020891E-01 A4 2.435749E-04\r\nRH: A3 -1.949958E-05 A4 2.700646E-04'),
(@con_inst_id,'2010-04-14 11:34:54','New I/O cals AT (a1) 2.434973E-04 (A0) -4.019696E-01 RH (A1) 2.698898E-04 (A0) 3.844729E-05\r\n\r\n'),
(@con_inst_id,'2010-05-12 19:05:09','since I was doing the I/O on Flexbox 4, I decided to redo the I/O cal on this box - 0005.\r\nAT	A3 = -4.022514E-01	A4 = 2.435749E-04	 RH	A3 = 3.844729E-05	A4 = 2.698898E-04 ---KBR'),
(@con_inst_id,'2010-05-24 11:27:43','Installed SIM card - 89881 69514 00062 6007 -dm'),
(@con_inst_id,'2010-06-22 16:11:43','Returned as unused spare from PA1-10-TU - DEM'),
(@con_inst_id,'2010-11-16 11:32:01','No longer has SIM card 89881 69514 00062 6007'),
(@con_inst_id,'2011-04-29 12:45:03','SIM card 8988 1692 1400 0612 251 JAK'),
(@con_inst_id,'2011-06-11 09:03:18','Deployed at PA005. JAK'),
(@con_inst_id,'2012-06-04 13:13:05','Rec. PA005. JAK'),
(@con_inst_id,'2014-03-06 13:52:15','I/O cal completed - JAK'),
(@con_inst_id,'2014-06-18 00:00:00','Deployed at PA008. JAK'),
(@con_inst_id,'2015-07-01 14:36:51','Recovered from PA008 6/16/15. JAK');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2015-07-01 14:36:51',1,'Recovered from PA008 6/16/15. JAK');