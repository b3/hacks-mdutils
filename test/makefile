TESTS := pandoc-filters md2pdf

.PHONY: tests reset $(TESTS)

tests: $(TESTS)

md2pdf:
	cd $@ ; $(MAKE)

pandoc-filters:
	cd $@ ; $(MAKE)

reset:
	for d in $(TESTS) ; do ( cd $$d ; $(MAKE) reset ) ; done

