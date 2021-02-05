.PHONY: expected clean reset
DIFF ?= diff

all: $(addsuffix .tex,$(basename $(wildcard t-*.md)))
	@for t in $^ ; do diff -u expected/$$t $$t ; done

expected/t-%.tex: t-%.md 
	pandoc -L ../../md2pdf/etc/$*.lua -o $@ $<

t-%.tex: t-%.md
	pandoc -L ../../md2pdf/etc/$*.lua -o $@ $<

expected: $(addprefix expected/,$(addsuffix .tex,$(basename $(wildcard t-*.md))))

clean:
	-rm *~ expected/*~

reset: clean
	-rm *.tex
