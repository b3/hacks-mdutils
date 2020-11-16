.PHONY: tests md2pdf pandoc-filters clean reset

tests: md2pdf pandoc-filters

md2pdf:
	test/test-md2pdf -f -v

pandoc-filters:
	cd $@ ; $(MAKE)

reset:
	cd pandoc-filters ; $(MAKE) reset
