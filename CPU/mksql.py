import sys
import re
import csv
import time
import tao.db

def refmt(sql):
  sql = sql.strip()
  return re.sub(r"[ \n]+", ' ', sql)

def make_data(csvfile):
  hdr = []
  info = []
  conf = []
  with open(csvfile, 'r') as fob:
    csvreader = csv.reader(fob)
    for row in csvreader:
      if row[0].startswith('#'):
        hdr = row
        continue
      ## Build Date
      if row[10]: dt, tech = [n.strip() for n in row[10].split(',')]
      try:
        dt = time.strftime('%Y-%m-%d', time.strptime(dt, '%B %Y'))
      except ValueError:
        try:
          dt = time.strftime('%Y-%m-%d', time.strptime(dt, '%b %Y'))
        except ValueError:
          if dt.startswith('Sep'):
            dt = '{}-09-01'.format(dt.split()[1])
      ## Firmware
      fw = [n.strip() for n in row[5].split(',')]
      if len(fw) == 2:
        row[5:6] = fw
      else:
        row[5:6] = [None, None]
      for n in (5, 6):
        if row[n] is str(): row[n] = None
      ## Flash Card
      if row[13].endswith('MB'):
        row[13] = int(row[13].rstrip('MB'))
      elif row[13].endswith('GB'):
        row[13] = int(row[13].rstrip('GB')) * 1000
      else:
        row[13] = None
      ## Dan's 1st call times
      if row[10] is str(): row[10] = None
      ##
      info.append([row[1], row[2], dt, tech])
      conf.append([row[n] for n in (2,3,5,6,10,13)])
  ##
  
  return info, conf
  ## def make_data

def make_ocs_data(ocsfile):
  info = []
  with open(ocsfile, 'r') as fob:
    csvreader = csv.reader(fob)
    for row in csvreader:
      if row[0].startswith('2'):
        info.append([None, row[0], '2014-03-15', 'Jennifer Keene'])
  return info
  ## def make_ocs_data

def make_info_sql(pfx, info):
  dbc = tao.db.MySQL().user()
  sql = [
    r"USE `{}FlexSystems`".format(pfx),
    r"""
    CREATE TABLE `FlexInfo` (
      `inst_id` INT UNSIGNED NOT NULL,
      `sn` SMALLINT UNSIGNED NOT NULL UNIQUE KEY,
      `dt` DATE NOT NULL,
      `prop` VARCHAR(20) DEFAULT NULL,
      `tech` VARCHAR(16),
      PRIMARY KEY (`inst_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8
    """]
  ##
  for r in info:
    sql.extend([
      r"INSERT INTO `Instrument` VALUES ()",
      r"""
      INSERT INTO `FlexInfo` (`inst_id`, `sn`, `dt`, `tech`)
      VALUES (LAST_INSERT_ID(), {}, {}, {}, {})
      """.format(*dbc.escape(r)),
      r"""
      INSERT INTO `{}InstrumentLocation`.`History` (inst_id, dt, label_id, txt) 
      VALUES (LAST_INSERT_ID(), {}, 1, 'System built')
      """.format(pfx, dbc.escape(r[2]))])
  ##
  dbc.close()
  return sql
  ## def make_info_sql

def make_conf_sql(pfx, conf):
  dbc = tao.db.MySQL().user()
  sql = [
    r"USE `{}FlexSystems`".format(pfx),
    r"""
    CREATE TABLE `FlexConfig` (
      `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
      `inst_id` INT UNSIGNED NOT NULL,
      `dt` DATETIME NOT NULL,
      `sim_id` INT UNSIGNED,
      `rf_id` TINYINT UNSIGNED,
      `fw_ver` DECIMAL(4,2),
      `fw_rev` MEDIUMINT,
      `call_time` TIME,
      `flash_mb` SMALLINT UNSIGNED,
      `baro_type` TINYINT UNSIGNED NOT NULL DEFAULT 1,
      `atrh_type` TINYINT UNSIGNED NOT NULL DEFAULT 1,
      PRIMARY KEY (`inst_id`,`id`)
    ) ENGINE=MyISAM
    """]
  ## create a record for every defined CPU
  for r in conf:
    sql.append(r"""
      INSERT INTO `FlexConfig` (`inst_id`, `sim_id`, `rf_id`, `fw_ver`, `fw_rev`, `call_time`, `flash_mb`)
      SELECT `FlexInfo`.`inst_id`, NULL, {}, {}, {}, {}, {} FROM `FlexInfo` 
      WHERE `FlexInfo`.`sid`={}
      """.format(*dbc.escape(r[1:] + [r[0]])))
  ## update existing record with any initial SIM assignments
  for r in conf:
    sql.append(r"""
      UPDATE `FlexConfig`, `FlexInfo`, `SIMTmp` SET `sim_id`=`SIMTmp`.`inst_id` 
      WHERE `FlexInfo`.`sid`=`SIMTmp`.`sid` 
      AND `FlexConfig`.`inst_id`=`FlexInfo`.`inst_id` 
      AND `FlexInfo`.`sid`={}
      """.format(*dbc.escape(r[:1])))
  ##
  dbc.close()
  return sql
  ## def make_conf_sql

def make_empty_conf(info):
  return [[r[1], None, None, None, None, None] for r in info]
  ## def make_empty_conf

def main(args):
  taofile, ocsfile, pfx, sqlfile = args
  info, conf = make_data(taofile)
  ## search old Flex instrument database
  conf.extend(make_empty_conf(db_info))
  ## 
  ocs_info = make_ocs_data(ocsfile)
  info.extend(ocs_info)
  conf.extend(make_empty_conf(ocs_info))
  
  with open(sqlfile, 'w') as fob:
    sql = ['/* CPU/mksql.py */']
    sql.extend(make_info_sql(pfx, info))
    sql.extend(make_conf_sql(pfx, conf))
    sql.append(str())
    fob.write(';\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
