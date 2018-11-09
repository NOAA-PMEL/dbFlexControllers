import sys
import re
import csv
import time
import tao.db
from tao.util import unwrap as uw

def refmt(sql):
  sql = sql.strip()
  return re.sub(r"[ \n]+", ' ', sql)

def makeData(csvfiles):
  """This function requires all csv inventory files and returns lists of dicts 
  of FLEX controllers and Iridium SIMs for the GTMBA/OCS SQL Inventory tables."""
  hdr = []
  con = []
  sim = []
  fcp = []
  for csvfile in csvfiles:
    if re.match(r".+Inventory",csvfile):
      # Controllers Inventory
      print('Reading Controller Inventory file...')
      with open(csvfile, 'r') as fob:
        raw = fob.read()
        fob.seek(0,0)
        csvreader = csv.reader(fob)
        if re.match(r"X\d{4}",raw):
          print('Processing OCS Controller Inventory File...')
          for i,row in enumerate(csvreader):
            if re.match(r"X\d{4}",row[0]):
              con.append({
                'serial': row[0][1:],
                'type':2,
                'dt': row[1],
                'platform':None,
                'rf':row[0][1:],
                'firm':'1.12,150313',
                'call':int(row[0][-2:]) if row[0] else None,
                'card':None,
                'proj':2,
                'irproj':None
              })
            elif re.match(r"\d{4}",row[0]):
              con.append({
                'serial': row[0],
                'type':1,
                'dt': row[1],
                'platform':None,
                'rf':row[0],
                'firm':'1.12,150313',
                'call':int(row[0][-2:]) if row[0] else None,
                'card':None,
                'proj':2,
                'irproj':None
              })
            elif row[1] not in [n['serial'] for n in con]:
              raise Exception('OCS Inventory file issues, missing a serial #'+row[1])
        elif re.match(r"\d{4}",raw):
          print('Processing GTMBA Controller Inventory File...')
          for row in csvreader:
            if row[1]: # Skipping anything w/out a platform ID
              ## Capture the date
              if row[10]: dt, tech = [n.strip() for n in row[10].split(',')]
              try:
                dt = time.strftime('%Y-%m-%d', time.strptime(dt, '%B %Y'))
              except ValueError:
                try:
                  dt = time.strftime('%Y-%m-%d', time.strptime(dt, '%b %Y'))
                except ValueError:
                  if dt.startswith('Sep'):
                    dt = '{}-09-01'.format(dt.split()[1])
              ## Write out
              con.append({
                'serial':row[0],
                'type':1,
                'dt': dt,
                'platform':row[1],
                'rf':row[2],
                'firm':row[4].replace(' ',''),
                'call':int(row[8][3:]) if row[8] else None,
                'card':row[11],
                'proj':1,
                'irproj':'FLEX'
              })
        else:
          raise Exception('Unable to process inventory file: '+csvfile)
    elif re.match(r".+Iridium",csvfile):
      # Iridium Inventory
      print('Reading Iridium SIM file...')
      with open(csvfile, 'r') as fob:
        raw = fob.read()
        fob.seek(0,0)
        csvreader = csv.reader(fob)
        if re.match(r"\d{4},\D+",raw):
          print('Processing OCS Iridium Inventory...')
          for row in csvreader:
            if re.match(r"\d{4}",row[0]) and re.match(r"\d+",row[6]):
              t = 2 if re.match(r"00\d\d",row[0]) else 1
              sim.append({
                'serial':row[0],
                'type':t,
                'icc':row[6].replace(' ',''),
                'voice':row[7].replace(' ',''),
                'data':row[8].replace(' ',''),
                'proj':2,
                'dt': next((d['dt'] for d in con if d['serial'] == row[0] and d['type'] == t),None)
              })
        elif re.match(r"\d{4},1\d{3}",raw):
          print('Processing GTMBA Iridium Inventory...')
          for row in csvreader:
            sim.append({
              'serial':row[0],
              'type':1,
              'icc':row[3],
              'voice':row[2],
              'data':row[4],
              'proj':1,
              'dt':row[5]
            })
        else:
          raise Exception('Iridium file issue: '+csvfile)
    elif re.match(r".+Faceplates",csvfile):
      # OCS FlexBox Faceplates inventory
      print('Processing OCS Faceplates...')
      with open(csvfile,'r') as fob:
        csvreader = csv.reader(fob)
        for row in csvreader:
          fcp.append({
            'sn':row[1],
            'status': 2 if re.match(r"Do\sNot\sDeploy",row[2]) else 1
          })
  
  return con, sim, fcp
  ## def makeData

def makeSQL(ls):
  """Function for parsing the given list into SQL insert statements"""
  sql = []
  opt = []
  ## check for what list this is
  if set(('icc', 'data')).issubset(ls[0]) and 'platform' not in ls[0]:
    # SIMs
    print('Writing SIMs SQL...')
    for d in ls:
      ## make the insert strings
      ins = uw(r"""
        INSERT INTO `Instrument` VALUES (NULL);
        SET @sim_inst_id = LAST_INSERT_ID();
        SELECT `inst_id` INTO @con_inst_id 
        FROM `ControllersInfo` 
        WHERE `serial` = '{serial}' AND `type` = {type};
        INSERT INTO `SIMInfo` (`inst_id`,`iccid`,`data_num`,`voice_num`,`dt`)
        VALUES (@sim_inst_id,'{icc}','{data}','{voice}','{dt}');
        INSERT INTO `SIMConfig` (`inst_id`,`dt`,`proj_id`,`active`,`system_id`)
        VALUES (@sim_inst_id,'{dt}','{proj}',1,@con_inst_id);
        UPDATE `FlexConfig` 
        SET `sim_id` = @sim_inst_id WHERE `inst_id` = @con_inst_id;
      """.format(**d))
      ## add to the sql list
      sql.append(ins)
  elif set(('call', 'card')).issubset(ls[0]) and 'icc' not in ls[0]:
    # Controllers
    print('Writing Controllers SQL...')
    firms = [None]
    ## Avoid None or Null in Options
    for d in ls:
      if not d['firm'] in firms:
        firms.append(d['firm'])
        opt.append(uw(r"""
          INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
          VALUES (NULL,'firm','{}');
          """.format(d['firm'])))
      ## make the insert strings
      ins = uw(r"""
        INSERT INTO `Instrument` VALUES (NULL);
        SET @con_inst_id = LAST_INSERT_ID();
        SELECT `id` INTO @firm_id FROM `ControllersOptions` WHERE `txt` LIKE '%{firm}%';
        SELECT `id` INTO @card_id FROM `ControllersOptions` WHERE `txt` LIKE '%{card}%';
        INSERT INTO `ControllersInfo` (`inst_id`,`sn`,`dt`,`type_id`)
        VALUES (@con_inst_id,'{serial}','{dt}',{type});
        INSERT INTO `FlexConfig` (`inst_id`,`dt`,`proj_id`,`iridium_proj`,`platform_id`,`rf_id`,`firmware`,`first_call`,`flash_card`)
        VALUES (@con_inst_id,'{dt}',{proj},'{irproj}','{platform}','{rf}',@firm_id,{call},@card_id);
      """.format(**d))
      ## add to the sql list
      sql.append(ins)
  elif set(('sn','status')).issubset(ls[0]) and 'serial' not in ls[0]:
    # Faceplates
    print('Writing Faceplates SQL...')
    for d in ls:
      ins = uw(r"""
        INSERT INTO `Instrument` VALUES (NULL);
        SET @fcp_inst_id = LAST_INSERT_ID();
        INSERT INTO `FlexFaceplatesInfo` (`inst_id`,`sn`,`status_id`)
        VALUES (@fcp_inst_id,'{sn}',{status});
      """.format(**d))
      sql.append(ins)
  else:
    raise Exception("makeSQL couldn't process the {} list!".format(ls))
  
  if opt:
    return opt+sql
  else:
    return sql
  ## def makeSQL

def makeTables(pfx,drop=True):
  """Generates the SQL strings for building the Controllers and support tables"""
  db = [r"USE `{}FlexSystems`;".format(pfx)]
  if drop:
    dropThese = [uw(r"""
      DROP TABLE IF EXISTS `ControllersInfo`;
      DROP TABLE IF EXISTS `ControllersOptions`;
      DROP TABLE IF EXISTS `FlexConfig`;
      DROP TABLE IF EXISTS `FlexFaceplatesInfo`;
      DROP TABLE IF EXISTS `FlexFixes`;
      DROP TABLE IF EXISTS `SIMInfo`;
      DROP TABLE IF EXISTS `SIMConfig`;
      """)]
  else:
    dropThese = []
  
  tables = [
    uw(r"""
    CREATE TABLE `ControllersInfo` (
      `inst_id` int(10) unsigned NOT NULL,
      `sn` varchar(12) NOT NULL DEFAULT '',
      `dt` datetime NOT NULL,
      `prop` varchar(12) DEFAULT NULL,
      `type_id` int(10) unsigned NOT NULL,
      PRIMARY KEY (`inst_id`),
      UNIQUE KEY `type` (`type_id`,`inst_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `ControllersOptions` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `key` enum('ctype','call','card','fixes','firm','active') NOT NULL DEFAULT 'ctype',
      `txt` varchar(20) NOT NULL,
      PRIMARY KEY (`key`,`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `FlexConfig` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `inst_id` int(10) unsigned NOT NULL,
      `dt` datetime NOT NULL,
      `proj_id` int(10) unsigned NOT NULL,
      `iridium_proj` varchar(12) DEFAULT NULL,
      `platform_id` varchar(12) DEFAULT NULL,
      `rf_id` varchar(12) DEFAULT NULL,
      `firmware` int(10) DEFAULT NULL,
      `sim_id` int(10) unsigned DEFAULT NULL,
      `first_call` int(10) DEFAULT NULL,
      `flash_card` int(10) unsigned DEFAULT NULL,
      `fcplt_id` int(10) unsigned DEFAULT NULL,
      PRIMARY KEY (`inst_id`,`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `FlexFaceplatesInfo` (
      `inst_id` int(10) unsigned NOT NULL,
      `sn` varchar(12) NOT NULL,
      `status_id` int(10) unsigned NOT NULL,
      PRIMARY KEY (`inst_id`),
      UNIQUE KEY `sn` (`sn`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `FlexFixes` (
      `inst_id` int(10) unsigned NOT NULL,
      `met_ic` int(10) NOT NULL DEFAULT '1',
      `solder_cpu_jp24` int(10) NOT NULL DEFAULT '1',
      `cpu_r4_887` int(10) NOT NULL DEFAULT '1',
      `rain_gnd` int(10) NOT NULL DEFAULT '1',
      `ss_standoff` int(10) NOT NULL DEFAULT '1',
      PRIMARY KEY (`inst_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `SIMInfo` (
      `inst_id` int(10) unsigned NOT NULL,
      `iccid` int(11) unsigned NOT NULL,
      `data_num` bigint(12) unsigned NOT NULL,
      `voice_num` bigint(12) unsigned NOT NULL,
      `dt` datetime NOT NULL,
      PRIMARY KEY (`inst_id`),
      UNIQUE KEY `iccid` (`iccid`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `SIMConfig` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `inst_id` int(10) unsigned NOT NULL,
      `dt` datetime NOT NULL,
      `proj_id` int(10) unsigned NOT NULL,
      `active` int(10) unsigned NOT NULL,
      `system_id` int(10) DEFAULT NULL,
      PRIMARY KEY (`inst_id`,`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """)
  ]
  callTimes = [['call','00:{:02}'.format(x)] for x in range(1,60)]
  options = [uw(r"""
    INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
    VALUES
    	(1,'ctype','TFLEX'),
    	(2,'ctype','FLEX Box'),
    	(1,'fixes','No'),
    	(2,'fixes','Yes'),
    	(1,'card','2GB'),
    	(2,'card','128MB'),
      (1,'active','Active'),
      (2,'active','Inactive');
    """)]
  for r in callTimes:
    options.append(uw(r"""
    INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
    VALUES (NULL,'{0}','{1}');
    """.format(*r)))
  
  ## Compile all lists
  sql = db+dropThese+tables+options
  return sql
  ## def makeTables

def main(args):
  ## File args
  ocsinv, taoinv, ocssim, taosim, ocsfcp, pfx, sqlfile = args
  ## Parse csvs for data
  con,sim,fcp = makeData([taoinv,ocsinv,taosim,ocssim,ocsfcp])
  ## Controllers SQL
  conSQL = makeSQL(con)
  ## SIMs SQL
  simSQL = makeSQL(sim)
  ## Faceplates SQL
  fcpSQL = makeSQL(fcp)
  with open(sqlfile, 'w') as fob:
    print('Writing {} file...'.format(sqlfile))
    sql = ['/* DATA/mksql.py */']
    ## Tables SQL
    sql.extend(makeTables(pfx))
    ## Add Controllers,SIMs,Faceplates
    sql.extend(conSQL+simSQL+fcpSQL)
    ## Write to sqlfile
    fob.write('\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
