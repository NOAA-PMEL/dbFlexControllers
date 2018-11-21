/* History/mksql.py < ../CSV/TMBA0004.csv*/
SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '0004' AND `type_id` = 1;
INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
VALUES
(@con_inst_id,'2011-09-29 00:00:00','Built NEW, bench tested okay, all sensors working. RF modem, Iridium, and GPS tested okay. Loaded firmware v1.11, 110408.'),
(@con_inst_id,'2011-10-06 00:00:00','Ran current drain test with v1.11, 110408, problem with RF modem not turning off and powering down.'),
(@con_inst_id,'2011-11-09 00:00:00','Updated firmware to version 1.11, 111101.'),
(@con_inst_id,'2011-12-02 00:00:00','Updated firmare to version 1.11, 111121.'),
(@con_inst_id,'2011-12-06 00:10:00','Started test for IO2-12, put in LOG mode with all MET sensors except LWR & Baro. All subsurface sensors except no SBE39TPs (which are at Seabird getting calibrated).'),
(@con_inst_id,'2011-12-07 17:58:00','Stopped system, took out of LOG mode. Battery voltages not working, reading high, 20v with 10v input.'),
(@con_inst_id,'2011-12-08 00:00:00','Pat tried to troubleshoot voltage problem on CPU board, A/D CH 6, but could not fix it, so replaced CPU board. New CPU board working, battery voltage telemetry is now working.'),
(@con_inst_id,'2011-12-16 19:50:00','Started test for IO2-12, put in LOG mode with all MET sensors except LWR & Baro, plus 4 inductive sensors: TC, T, Nortek, TP. Located outside of Bldg 3 in tube test rack.'),
(@con_inst_id,'2012-01-05 22:05:00','Successfully sent Rudics dialout command XO to turn-on the RF modem'),
(@con_inst_id,'2012-01-06 19:00:00','IO-12 TEST COMPLETE, disconnected power from TFLEX0004 electronics (accidentally, instead of cntrl-C out of LOG mode)'),
(@con_inst_id,'2012-04-01 00:00:00','NOT used on IO3-12-BJ, air shipped back to Seattle.'),
(@con_inst_id,'2012-07-20 00:00:00','Updated firmware to version 1.11, 120504'),
(@con_inst_id,'2012-07-23 21:40:00','Started testing outside for PI3-12, spare system. Reconfigured with new cal file with LWR & Baro.'),
(@con_inst_id,'2012-07-27 16:00:00','Ended testing for PI3-12'),
(@con_inst_id,'2012-07-30 00:00:00','Shipped for PI3-12-RB, Spare system.'),
(@con_inst_id,'2013-02-04 00:00:00','Spare system from PI3-12-RB, not deployed. Will be shipped back after cruise.'),
(@con_inst_id,'2013-03-15 00:00:00','Spare system back at PMEL from PI3-12-RB, not deployed. '),
(@con_inst_id,'2013-03-18 19:00:00','Updated firmware to version 1.12, 130225.'),
(@con_inst_id,'2013-03-18 21:00:00','Started testing outside for PI3-13 (to replace TFLEX0007 with data Flash RAM write problem).'),
(@con_inst_id,'2013-03-19 17:00:00','Accidently knocked over TFLEX0004 electronics can while painting the Nortek heads, which disconnected & reconnected power, resetting LOG mode.'),
(@con_inst_id,'2013-03-21 16:30:00','Stopped TEST for PI3-13.'),
(@con_inst_id,'2013-07-21 00:00:00','Deployed at 8S-67E, RT004, on IO3-13-SK'),
(@con_inst_id,'2014-09-04 00:00:00','Mooring ADRIFT, RECOVERED?'),
(@con_inst_id,'2015-10-31 00:00:00','Recovered RT004, IO4-15-SN, at 7 38.10S 60 11.27E. ATRH broken, Anemometer damaged on recovery. All instruments recovered, all nylon lost. Release Lost. '),
(@con_inst_id,'2016-07-15 00:00:00','Back from India, TFLEX0004 physically undamaged. Mooring vandalized and set adrift. Needs checkout.'),
(@con_inst_id,'2017-06-13 00:00:00','Verified U1 & U2 on MET board TI ICs, removed solder bridge JP24 on CPU board, updated Rain Ground from Seawater to Power ground.'),
(@con_inst_id,'2017-06-13 00:00:00','Installed firmware v1.12, 150313 to do current drain test.'),
(@con_inst_id,'2017-06-13 00:00:00','Found corrosion on connector board pins, so replaced connector board.'),
(@con_inst_id,'2017-06-19 00:00:00','Ran current drain test for 3 days, 17.26mA Ave. See intermittent spurious command characters in always 1 of 6 Aquadopp IM data lines in the Iridium buffer: examples >/sa >/sam'),
(@con_inst_id,'2017-09-07 00:00:00','Replaced GND faceplate connector (adding pin1&2, before only pin2). Installed NEW IMM and NEW Serial board in an attempt to fix the read command characters (>/sa & >/sam) intermittantly corrupting one velocity aquadopp data string (in a 6 hour data buffer).'),
(@con_inst_id,'2017-09-11 00:00:00','Ran a new current drain test and Aquadopp data test (with new IMM & Serial bd). Ran for 4 Days, 14.03mA average.'),
(@con_inst_id,'2017-09-11 00:00:00','Upgraded to v2.01, 170530 Firmware'),
(@con_inst_id,'2018-10-30 00:00:00','Back from Indonesia, IO1-18, not deployed.');
INSERT INTO test_DAW_InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)
VALUES (@con_inst_id,'2011-09-29 00:00:00',1,'Built new');