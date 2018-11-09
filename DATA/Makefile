SQL := build.sql
DATA := $(shell cd $(CSV); for f in *Inventory.csv *Iridium.csv *Faceplates.csv; do echo $$f; done)
CSV := ../CSV

.PHONY : sql clean

clean : 
	rm -f $(SQL) *.pyc *.pyo ipython.log

sql : $(SQL)

$(SQL) : mksql.py $(DATA:%=$(CSV)/%)
	python2 $^ '$(PREFIX)' $@
