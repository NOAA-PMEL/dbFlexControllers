import sys
import os
import re
from argparse import ArgumentParser as AP
import csv
import tao.db

class Error(Exception):
  def __init__(self, msg):
    self.message = msg
  def __str__(self):
    return self.message
  ##

def refmt(sql):
  sql = sql.strip()
  return re.sub(r"[ \n]+", ' ', sql)

def get_arguments(args):
  argpar = AP()
  argpar.add_argument('files', nargs='+')
  argpar.add_argument('--pfx', default='')
  return argpar.parse_args(args)
  ## def get_arguments

def make_data(files):
  data = [[], []]
  for csvfile in files:
    with open(csvfile, 'r') as fob:
      csvreader = csv.reader(fob)
      for row in csvreader:
        if row[0].startswith('#'):
          continue
        if len(row) == 6:
          row[5] = row[5][:10]
          data[0].append([(((row[n] is not str()) and row[n]) or None) for n in (1,3,2,4,5)])
        elif len(row) == 10:
          if not re.match(r'[0-9 ]{19,}', row[6]):
            continue
          data[0].append([row[n].translate(None,' ') for n in (0,6,7,8)] + [None])
        elif len(row) == 3:
          data[1].append([(c or None) for c in row])
        else:
          raise Error("unknown column count in '{}'".format(csvfile))
  return data
  ## def make_data

def make_sql(pfx, data):
  sql = ['/* SIM/mksql.py */']
  dbc = tao.db.MySQL().user()
  sql.append(r"USE `{}FlexSystems`".format(pfx))
  sql.extend([
    r"""
    CREATE TEMPORARY TABLE `SIMTmp` (
      `inst_id` INT UNSIGNED NOT NULL,
      `sid` SMALLINT UNSIGNED NOT NULL,
      PRIMARY KEY (`inst_id`)
    )
    """,
    r"""
    CREATE TABLE `SIMInfo` (
      `inst_id` INT UNSIGNED NOT NULL,
      `iccid` BIGINT UNSIGNED NOT NULL UNIQUE KEY,
      `smn` BIGINT UNSIGNED NOT NULL UNIQUE KEY,
      `sdn` BIGINT UNSIGNED NOT NULL UNIQUE KEY,
      `start_dt` DATE,
      `end_dt` DATE,
      PRIMARY KEY (`inst_id`)
    ) ENGINE=MyISAM
    """])
  for r in data[0]:
    sql.append(r"INSERT INTO `Instrument` VALUES ()")
    sql.append(r"""
      INSERT INTO `SIMInfo` (`inst_id`, `iccid`, `smn`, `sdn`, `start_dt`)
      VALUES (LAST_INSERT_ID(), {}, {}, {}, {})
      """.format(*dbc.escape(r[1:])))
    sql.append(r"""
      INSERT INTO `SIMTmp` (`inst_id`, `sid`) VALUES (LAST_INSERT_ID(), {})
      """.format(dbc.escape(r[0])))
  for r in data[1]:
    sql.append(r"""
      UPDATE `SIMInfo` SET `start_dt`={}, `end_dt`={} WHERE `iccid`={}
      """.format(*dbc.escape(r[1:]+[r[0]])))
  sql.append(str())
  ##
  dbc.close()
  return sql
  ## def make_sql

def main(args):
  arg = get_arguments(args)
  arg.sqlfile = arg.files.pop()
  try:
    data = make_data(arg.files)
  except Error as err:
    return str(err)
  sql = make_sql(arg.pfx, data)
  with open(arg.sqlfile, 'w') as fob:
    fob.write(';\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
