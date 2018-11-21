## order of these does matter
SUBS := DB DATA History
PFX := test_DAW_

.PHONY : sql db clean CSV $(SUBS)

clean : TARGET = clean
clean : $(SUBS) CSV
	rm -f *.pyc *.pyo ipython.log build.sql

db : sql build.sql
	mysql < $(lastword $^)

build.sql : sql
	cat $(SUBS:%=%/build.sql) > $@

sql : TARGET = sql
sql : CSV $(SUBS)

$(SUBS) : 
	$(MAKE) -C $@ PREFIX=$(PFX) $(TARGET)

CSV : 
	[ "$(TARGET)" = "clean" ] || for f in *.xlsx; do mv "$$f" $$(echo "$$f" | tr ' ' '_'); done
	$(MAKE) -C $@ $(TARGET)
