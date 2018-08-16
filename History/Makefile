SQL := build.sql
CSV := ../CSV
SN := $(shell cd $(CSV); for f in [0-9][0-9][0-9][0-9].csv; do echo "$${f:0:4}"; done)

.PHONY : sql clean

clean : 
	rm -f $(SQL) $(SN:%=%.src) *.pyc *.pyo ipython.log

sql : $(SQL)

$(SQL) : $(SN:%=%.src)
	( echo 'USE `$(PREFIX)FlexSystems`;'; cat $^ ) > $@

$(SN:%=%.src) : %.src : mksql.py $(CSV)/%.csv
	python2 $^ '$*' $@
