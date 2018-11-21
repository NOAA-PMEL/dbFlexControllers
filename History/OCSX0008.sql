/* History/mksql.py < ../CSV/OCSX0008.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0008' AND `type_id` = 2;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2008-12-02 15:04:08','Currently in lake testing\nWired for Druck, Vaisala\n512MB\nCPU board 4002\nserial board 1002\nmet board 1002\nRIG board 2002'),
(@con_inst_id,'2010-02-24 15:07:08','box modified with GPS card and NAL modem pulled from IRID tube 0002. So now has GPS board LeadTek LR9548S P7110000655 and NAL A3LA-D modem IMEI 300124010602070 with no SIM when pulled from tube '),
(@con_inst_id,'2010-02-25 10:01:43','SIM installed: 8988 1694 1400 0461 424 Data phone number: 881693403876 Voice phone number: 881641403889'),
(@con_inst_id,'2010-02-25 10:13:59','Will go to KE1-10-MI repair cruise. Test in parking lot. -rk'),
(@con_inst_id,'2010-03-10 14:06:21','in shipment to KEO repair cruise on the Mirai, ATRH cals done 3/9/10 AT A3= -3.912534E-01	A4=2.414813E-04; 	RH	A3= 1.192501E-04	A4= 2.686542E-04'),
(@con_inst_id,'2010-09-17 14:05:20','Sent to KEO as spare. JAK'),
(@con_inst_id,'2010-10-06 08:43:48','Not deployed. In return shipment from KEO. JAK'),
(@con_inst_id,'2011-07-08 14:12:38','Firmware updated to version 1.11 110708. JAK'),
(@con_inst_id,'2011-07-20 14:11:17','Current drain tested 7/18 & 19. Max = 1.15A, Avg. = 0.078A, Min = 0.052A JAK'),
(@con_inst_id,'2011-11-29 14:55:08','Deployed at KE009 11/14/11. JAK'),
(@con_inst_id,'2012-07-05 09:12:29','Rec. KE009. JAK'),
(@con_inst_id,'2014-03-06 13:52:26','I/O cal completed - JAK'),
(@con_inst_id,'2014-06-28 00:00:00','Deployed at KE012. FW v1.12 140211. JAK'),
(@con_inst_id,'2015-09-07 11:25:53','Recovered from KE-012. Not all data downloaded in the field. Re-check and replace memory card before redeployment. JAK'),
(@con_inst_id,'2017-07-27 15:56:22','Deployed KE015 KE1-17-BF - Pb');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2017-07-27 15:56:22',7,'Deployed KE015 KE1-17-BF - Pb');
