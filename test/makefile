TESTS := pandoc-filters md2pdf

.PHONY: tests reset $(TESTS)

tests: $(TESTS)

md2pdf:
	cd $@ ; $(MAKE)

pandoc-filters:
	cd $@ ; $(MAKE)

reset:
	for d in $(TESTS) ; do ( cd $$d ; $(MAKE) reset ) ; done

# TODO: ajouter le support du test de conversion Beamer
#./test-md2pdf -f -v

