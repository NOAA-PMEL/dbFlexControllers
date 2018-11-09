SQL := build.sql
CSV := ../CSV
FL := $(shell cd $(CSV); for f in *[0-9][0-9][0-9][0-9].csv; do echo $${f:0:8}; done)

.PHONY : sql clean

clean : 
	rm -f $(SQL) $(FL:%=%.sql) *.pyc *.pyo ipython.log

sql : $(SQL)

$(SQL) : $(FL:%=%.sql)
	( echo 'USE `$(PREFIX)FlexSystems`;'; cat $^ ) > $@

$(FL:%=%.sql) : %.sql : mksql.py $(CSV)/%.csv
	python2 $^ $@
