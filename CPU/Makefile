SQL := build.sql
DATA := TMBASTATUS.csv OCS.csv
CSV := ../CSV

.PHONY : sql clean

clean : 
	rm -f $(SQL) *.pyc *.pyo ipython.log

sql : $(SQL)

$(SQL) : mksql.py $(DATA:%=$(CSV)/%)
	python2 $^ '$(PREFIX)' $@
