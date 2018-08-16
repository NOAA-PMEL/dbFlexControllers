import sys
import re
from string import Template

def refmt(sql):
  sql = sql.strip()
  return re.sub(r"[ \n]+", ' ', sql)

def main(args):
  pfx, sqlfile = args
  sql = ['/* DB/mksql.py */']
  if pfx is not str():
    ## create FlexSystems database for testing
    sql.extend([
      r"DROP DATABASE IF EXISTS ${prefix}FlexSystems",
      r"CREATE DATABASE ${prefix}FlexSystems",
      r"USE `${prefix}FlexSystems`",
      r"""
      CREATE TABLE `Instrument` (
        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        PRIMARY KEY  (`id`)
      ) ENGINE=MyISAM DEFAULT CHARSET=utf8
      """,
      r"""
      CREATE TABLE `InstrumentHist` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `inst_id` int(11) NOT NULL,
        `dt` datetime NOT NULL,
        `txt` text NOT NULL,
        PRIMARY KEY (`inst_id`,`id`)
      ) ENGINE=MyISAM DEFAULT CHARSET=utf8
      """,
      r"""
      CREATE TABLE FlexOptions (
        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        `key` ENUM('atrh', 'baro') NOT NULL,
        `txt` VARCHAR(20) NOT NULL,
        PRIMARY KEY (`id`,`key`)
      ) ENGINE=MyISAM DEFAULT CHARSET=utf8
      """,
      r"""
      INSERT INTO `FlexOptions` (`key`, `txt`) 
      VALUES ('atrh', 'Rotronics Hygroclip'), ('atrh', 'Rotronics MP100'),
      ('baro', 'Paros Met-1'), ('baro', 'Druck RPT350')
      """])
    ## create InstrumentLocation database for testing
    sql.extend([
      r"DROP DATABASE IF EXISTS ${prefix}InstrumentLocation",
      r"CREATE DATABASE ${prefix}InstrumentLocation",
      r"USE `${prefix}InstrumentLocation`",
      r"""
      CREATE TABLE `Label` (
        `id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
        `txt` VARCHAR(16) NOT NULL,
        PRIMARY KEY  (`id`)
      ) ENGINE=MyISAM DEFAULT CHARSET=utf8
      """,
      r"""
      INSERT INTO `Label` (`txt`) VALUES ('PMEL'), ('CALIBRATION'), ('INBOUND'), 
        ('OUTBOUND'), ('LOST'), ('RETIRED'), ('DEPLOYED')
      """,
      r"""
      CREATE TABLE `History` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `inst_id` INT(10) UNSIGNED NOT NULL,
        `dt` DATETIME NOT NULL,
        `label_id` TINYINT(3) UNSIGNED NOT NULL,
        `txt` VARCHAR(32) NOT NULL DEFAULT '',
        PRIMARY KEY  (`inst_id`,`id`)
      ) ENGINE=MyISAM DEFAULT CHARSET=utf8
      """])
    sql.append(str())
    ##
    with open(sqlfile, 'w') as fob:
      fob.write(Template(';\n'.join([refmt(s) for s in sql])).substitute(prefix=pfx))
  ## def main

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))
