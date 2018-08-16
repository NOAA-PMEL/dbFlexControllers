import sys
import re
import csv
import time
import tao.db

def get_time(ts):
  if ts is str(): ts = '00:00'
  try:
    tm = time.strptime(ts, '%H:%M')
  except ValueError:
    tm = time.strptime(ts, '%H:%M:%S')
  return tm
  ## def get_time

def get_date(ds, ld):
  if ds is str(): ds = ld
  dt = time.strptime(ds, '%Y-%m-%d')
  return dt
  ## def get_date

def refmt(sql):
  sql = sql.strip()
  return re.sub(r"[ \n]+", ' ', sql)
  ## def refmt

def main(args):
  csvfile, sn, sqlfile = args
  N = 0
  with open(csvfile, 'r') as fob:
    data = []
    last_date = str()
    for row in csv.reader(fob):
      N += 1
      if row[2] is str(): continue
      try:
        t = get_time(row[1].strip())
        d = get_date(row[0].strip(), last_date)
      except ValueError as ve:
        return '[{}: {}] {}'.format(csvfile, N, ve)
      dst = '{} {}'.format(time.strftime('%Y-%m-%d', d), time.strftime('%H:%M:%S', t))
      data.append([dst, row[2]])
      last_date = time.strftime('%Y-%m-%d', d)
  ##
  dbc = tao.db.MySQL().user()
  sql = ['/* History/mksql.py */']
  for row in data:
    sql.append(r"""
      INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)
      SELECT `inst_id`, {}, {} FROM FlexInfo WHERE sn={}
      """.format(*dbc.escape(row + [sn])))
  sql.append(str())
  ##
  dbc.close()
  with open(sqlfile, 'w') as fob:
    fob.write(';\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
