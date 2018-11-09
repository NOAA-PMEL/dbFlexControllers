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
  csvfile, sqlfile = args
  sn = csvfile[-8:-4]
  if re.match(r"TMBA",sqlfile):
    ## Handle GTMBA history files made from excel file
    with open(csvfile, 'r') as fob:
      data = []
      last_date = str()
      for N,row in enumerate(csv.reader(fob)):
        if row[2] is str(): continue
        try:
          t = get_time(row[1].strip())
          d = get_date(row[0].strip(), last_date)
        except ValueError as ve:
          return '[{}: {}] {}'.format(csvfile, N, ve)
        dst = '{} {}'.format(time.strftime('%Y-%m-%d', d), time.strftime('%H:%M:%S', t))
        data.append([dst, row[2]])
        last_date = time.strftime('%Y-%m-%d', d)
  elif re.match(r"OCS",sqlfile):
    ## Handle OCS history files from database
    with open(csvfile, 'r') as fob:
      data = []
      last_date = str()
      for N,row in enumerate(csv.reader(fob)):
        if row[1] is str(): continue
        try:
          d = time.strptime(row[0],'%Y-%m-%d %H:%M:%S')
        except ValueError as ve:
          return '[{}: {}] {}'.format(csvfile, N, ve)
        dst = '{}'.format(time.strftime('%Y-%m-%d %H:%M:%S', d))
        data.append([dst, row[1]])
        last_date = time.strftime('%Y-%m-%d', d)
  # Write the sql for this serial number
  dbc = tao.db.MySQL().user()
  sql = [
    '/* History/mksql.py */',
    r"SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '{}';".format(sn),
    r"INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)",
    r"VALUES"
  ]
  for i,row in enumerate(data):
    if i == len(data)-1:
      sql.append(r"  (@con_inst_id,{},{});".format(*dbc.escape(row)))
    else:
      sql.append(r"  (@con_inst_id,{},{}),".format(*dbc.escape(row)))
  sql.append(str())
  dbc.close()
  ##
  with open(sqlfile, 'w') as fob:
    fob.write('\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
