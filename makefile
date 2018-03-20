IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)

# FreeBSD & GNU sed do not use the same option for ERE
SED=sed$(shell { sed v </dev/null >/dev/null 2>&1 && echo " -r" ; } || echo " -E" ) 

all: help

help:                           ## liste les cibles disponibles
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

img/%.pdf: img/%.svg
	inkscape -z -d 2400 -A $@ -T $<

%.pdf: %.md $(IMG-PDF) $(IMG-PNG)
	bin/md2beamer $^ img

images: $(IMG-PDF)              ## génère les images PDF à partir des SVG

##############################################################################

.PHONY: build check clean dist dist-clean modeles

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm -f $(shell find . -name "*~")

dist-clean: clean               ## supprimer les fichiers regénérables
	-rm -f $(IMG-PDF) $(IMG-PNG)
