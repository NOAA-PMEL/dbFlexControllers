SQL := build.sql
DATA := IridiumInfo.csv OCS.csv Stratos.csv
CSV := ../CSV

.PHONY : sql clean

clean : 
	rm -f $(SQL) *.pyc *.pyo ipython.log

sql : $(SQL)

$(SQL) : mksql.py $(DATA:%=$(CSV)/%)
	python2 $^ $@ --pfx '$(PREFIX)'
