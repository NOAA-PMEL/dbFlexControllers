SQL := build.sql

.PHONY : sql clean

clean : 
	rm -f $(SQL) *.pyc *.pyo ipython.log

sql : $(SQL)

$(SQL) : mksql.py
	python $^ '$(PREFIX)' $@
