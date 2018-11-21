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
  csvfile, sqlfile, pfx = args
  sn = csvfile[-8:-4]
  tp = 1 if csvfile[-9] == 'A' or csvfile[-9] == 'T' else 2
  if re.match(r"TMBA",sqlfile):
    ## Handle GTMBA history files made from excel file
    with open(csvfile, 'r') as fob:
      data = []
      loc = []
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
        if N == 0:
          loc.extend([dst,1,'Built new'])
        last_date = time.strftime('%Y-%m-%d', d)
  elif re.match(r"OCS",sqlfile):
    ## Handle OCS history files from database
    with open(csvfile, 'r') as fob:
      read = csv.reader(fob)
      flen = sum(1 for r in read)
      fob.seek(0,0)
      data = []
      loc = []
      last_date = str()
      for N,row in enumerate(read):
        if row[1] is str(): continue
        try:
          d = time.strptime(row[0],'%Y-%m-%d %H:%M:%S')
        except ValueError as ve:
          return '[{}: {}] {}'.format(csvfile, N, ve)
        dst = '{}'.format(time.strftime('%Y-%m-%d %H:%M:%S', d))
        data.append([dst, row[1]])
        last_date = time.strftime('%Y-%m-%d', d)
        if N == flen - 1:
          loc.extend([dst, 1 if re.match(r"Recovered",row[1]) else 7 if re.match(r"Deployed",row[1]) else 6,row[1]])
  # Write the sql for this serial number
  dbc = tao.db.MySQL().user()
  sql = [
    '/* History/mksql.py < {}*/'.format(csvfile),
    r"SELECT `inst_id` INTO @con_inst_id FROM `ControllersInfo` WHERE `sn` = '{}' AND `type_id` = {};".format(sn,tp),
    r"INSERT INTO `InstrumentHist` (`inst_id`, `dt`, `txt`)",
    r"VALUES"
  ]
  for N,li in enumerate(data):
    if N == len(data)-1:
      sql.append(r"  (@con_inst_id,{},{});".format(*dbc.escape(li)))
    else:
      sql.append(r"  (@con_inst_id,{},{}),".format(*dbc.escape(li)))
  sql.extend([
    r"INSERT INTO {}InstrumentLocation.History (`inst_id`,`dt`,`label_id`,`txt`)".format(pfx),
    r"VALUES (@con_inst_id,{},{},{});".format(*dbc.escape(loc))
  ])
  sql.append(str())
  dbc.close()
  ##
  with open(sqlfile, 'w') as fob:
    fob.write('\n'.join([refmt(s) for s in sql]))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
