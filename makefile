IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)

# FreeBSD & GNU sed do not use the same option for ERE
SED=sed$(shell { sed v </dev/null >/dev/null 2>&1 && echo " -r" ; } || echo " -E" ) 

.RECIPEPREFIX := > 

help:                           ## liste les cibles disponibles
> @eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

img/%.pdf: img/%.svg
> inkscape -z -d 2400 -A $@ -T $<

images: $(IMG-PDF)              ## génère les images PDF à partir des SVG

##############################################################################

.PHONY: check clean dist dist-clean test pull push

check:                          ## vérifier la présence des outils nécessaires
> @which pdflatex
> @which inkscape

clean:                          ## supprimer les fichiers inutiles
> -rm -f $(shell find . -name "*~")

dist-clean: clean               ## supprimer les fichiers regénérables
> -rm -f $(IMG-PDF) $(IMG-PNG)

test:                           ## faire les tests
> test/test-md2pdf -f -v

pull:                           ## récupérer les modifications depuis les dépôts git
> git pull boulgour master
> git pull github master

push: pull                      ## pousser les modifications vers les dépôts git
> git push --all boulgour
> git push --all github
