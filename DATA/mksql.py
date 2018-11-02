import sys
import re
import csv
import time
import tao.db
from tao.util import unwrap as uw

def refmt(sql):
  sql = sql.strip()
  return re.sub(r"[ \n]+", ' ', sql)

def makeControllerData(csvfile):
  """
  This function requires a csv inventory file and returns a list of dicts of 
  FLEX controllers for the GTMBA/OCS SQL Inventory tables.
  """
  hdr = []
  info = []
  conf = []
  with open(csvfile, 'r') as fob:
    raw = fob.read()
    fob.seek(0,0)
    csvreader = csv.reader(fob)
    if re.match(r"X\d{4}",raw):
      print('Processing OCS Controller Inventory File...')
      for row in csvreader:
        if re.match(r"X\d{4}",row[0]):
          info.append({'serial': row[0][1:],'dt': row[1],'type': 2})
          conf.append({
            'serial':row[0][1:],
            'type':2 if re.match(r"X\d{4}",row[0]) else 1,
            'platform':None,
            'rf':row[0][1:],
            'firm':'1.12',
            'call':':'+row[0][-2:],
            'card':None,
            'proj':2
          })
        elif re.match(r"\d{4}",row[0]):
          info.append({'serial': row[0],'dt': row[1],'type': 1})
          conf.append({
            'serial':row[0],
            'type':2 if re.match(r"00\d\d",row[0]) else 1,
            'platform':None,
            'rf':row[0],
            'firm':None,
            'call':':'+row[0][-2:],
            'card':None,
            'proj':2
          })
        elif row[1] not in [n['serial'] for n in info]:
          raise Exception('OCS Inventory file issues, missing a serial #')
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
          info.append({'serial':row[0],'type':1,'dt': dt})
          conf.append({
            'serial':row[0],
            'type':1,
            'platform':row[1],
            'rf':row[2],
            'firm':row[4],
            'call':row[8][2:],
            'card':row[11],
            'proj':1
          })
    else:
      raise Exception('Unable to process inventory file')
  
  return info, conf
  ## def makeControllerData

def makeSIMData(csvfile):
  """
  This function parses the Iridium CSV files for the relevant information and 
  returns data lists formatted for the SQL database.
  """
  info = []
  conf = []
  with open(csvfile, 'r') as fob:
    raw = fob.read()
    fob.seek(0,0)
    csvreader = csv.reader(fob)
    if re.match(r"\d{4},\D+",raw):
      print('Processing OCS Iridium Inventory...')
      for row in csvreader:
        if re.match(r"\d{4}",row[0]) and re.match(r"\d+",row[6]):
          info.append({
            'serial':row[0],
            'type':2 if re.match(r"00\d\d",row[0]) else 1,
            'icc':row[6].replace(' ',''),
            'voice':row[7].replace(' ',''),
            'data':row[8].replace(' ','')
          })
    elif re.match(r"\d{4},1\d{3}",raw):
      print('Processing GTMBA Iridium Inventory...')
      for row in csvreader:
        info.append({
          'serial':row[0],
          'type':1,
          'icc':row[3],
          'voice':row[2],
          'data':row[4]
        })
        conf.append({'serial':row[0],'type':1,'dt':row[5]})
      
  return info, conf
  ## def makeSIMSData

def makeSQL(pfx, conf): #TODO: rewrite
  dbc = tao.db.MySQL().user()
  sql = []
  
  return sql
  ## def makeSQL

def make_tables(pfx,drop=True):
  dbc = tao.db.MySQL().user()
  db = [r"USE `{}FlexSystems`".format(pfx)]
  if drop:
    dropThese = [uw(r"""
      DROP TABLE IF EXISTS `ControllersInfo`;
      DROP TABLE IF EXISTS `ControllersOptions`;
      DROP TABLE IF EXISTS `FlexConfig`;
      DROP TABLE IF EXISTS `FlexFaceplates`;
      DROP TABLE IF EXISTS `FlexFixes`;
      DROP TABLE IF EXISTS `SIMInfo`;
      DROP TABLE IF EXISTS `SIMConfig`;
      """)]
  else:
    dropThese = []
  
  tables = [
    uw(r"""
    CREATE TABLE `ControllersInfo` (
      `inst_id` tinyint(10) unsigned NOT NULL,
      `sn` varchar(12) NOT NULL DEFAULT '',
      `dt` datetime NOT NULL,
      `prop` varchar(12) DEFAULT NULL,
      `type_id` tinyint(10) unsigned NOT NULL,
      PRIMARY KEY (`inst_id`),
      UNIQUE KEY `type` (`type_id`,`inst_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `ControllersOptions` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `key` enum('ct_type','call','card','fixes') NOT NULL,
      `txt` varchar(20) NOT NULL,
      PRIMARY KEY (`key`,`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `FlexConfig` (
      `id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
      `inst_id` tinyint(10) unsigned NOT NULL,
      `dt` datetime NOT NULL,
      `proj_id` tinyint(10) unsigned NOT NULL,
      `iridium_proj` varchar(12) DEFAULT NULL,
      `platform_id` varchar(12) DEFAULT NULL,
      `rf_id` varchar(12) DEFAULT NULL,
      `firmware` tinyint(10) DEFAULT NULL,
      `sim_id` tinyint(10) unsigned DEFAULT NULL,
      `first_call` tinyint(10) DEFAULT NULL,
      `flash_card` tinyint(10) unsigned DEFAULT NULL,
      `fcplt_id` tinyint(10) unsigned DEFAULT NULL,
      PRIMARY KEY (`inst_id`,`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `FlexFaceplatesInfo` (
      `inst_id` tinyint(10) unsigned NOT NULL,
      `sn` varchar(12) NOT NULL,
      `status_id` tinyint(10) unsigned NOT NULL,
      PRIMARY KEY (`inst_id`),
      UNIQUE KEY `sn` (`sn`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `FlexFixes` (
      `inst_id` tinyint(10) unsigned NOT NULL,
      `met_ic` tinyint(10) NOT NULL DEFAULT '1',
      `solder_cpu_jp24` tinyint(10) NOT NULL DEFAULT '1',
      `cpu_r4_887` tinyint(10) NOT NULL DEFAULT '1',
      `rain_gnd` tinyint(10) NOT NULL DEFAULT '1',
      `ss_standoff` tinyint(10) NOT NULL DEFAULT '1',
      PRIMARY KEY (`inst_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """),
    uw(r"""
    CREATE TABLE `SIMInfo` (
      `inst_id` tinyint(10) unsigned NOT NULL,
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
      `id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
      `inst_id` tinyint(10) unsigned NOT NULL,
      `dt` datetime NOT NULL,
      `active` tinyint(10) unsigned NOT NULL,
      `system_id` tinyint(10) DEFAULT NULL,
      PRIMARY KEY (`inst_id`,`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
    """)
  ]
  callTimes = [['call','00:{:02}'.format(x)] for x in range(1,60)]
  options = [uw(r"""
    INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
    VALUES
    	(1,'ct_type','TFLEX'),
    	(2,'ct_type','FLEX Box'),
    	(1,'fixes','No'),
    	(2,'fixes','Yes'),
    	(1,'card','2GB'),
    	(2,'card','128MB');
    """)]
  for r in callTimes:
    options.append(uw(r"""
    INSERT INTO `ControllersOptions` (`id`, `key`, `txt`)
    VALUES (NULL,'{0}','{1}')
    """.format(*r)))
  sql = db.extend(dropThese+tables+options)
  dbc.close()
  return sql
  ## def make_tables

def main(args):
  ## File args
  taofile, ocsfile, pfx, sqlfile = args
  ##
  
  ## Info table
  info = make_info_data(taofile)
  info.append(make_info_data(ocsfile))
  ## 
  ocs_info = make_ocs_data(ocsfile)
  info.extend(ocs_info)
  # conf.extend(make_empty_conf(ocs_info))
  
  with open(sqlfile, 'w') as fob:
    sql = ['/* DATA/mksql.py */']
    sql.extend(make_info_sql(pfx, info))
    # sql.extend(make_conf_sql(pfx, conf))
    sql.append(str())
    fob.write(';\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
