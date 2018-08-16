XSL := $(wildcard ../*.xlsx)

.PHONY : sql db clean

clean : 
	rm -f *.csv *.pyc *.pyo ipython.log

sql db : mkcsv.py $(XSL)
	python2 $^

