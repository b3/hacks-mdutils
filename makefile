IMG-SVG := $(wildcard img/*.svg etc/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)

# POSIX shell for all for ERE
SED := sed $(shell sed v </dev/null >/dev/null 2>&1 && echo " --posix") -E

help:                           ## liste les cibles disponibles
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

%.pdf: %.svg
	inkscape -d 2400 -o $@ -T $<

##############################################################################

.PHONY: build check clean reset test pull push

build: bin/md2pdf               ## générer les scripts

images: $(IMG-PDF)              ## génère les images PDF à partir des SVG

bin/md2pdf: images              ## mets à jour les fichiers inclus de md2pdf
	shembed -u makefile-pandoc $@
	shembed -u etc/include-files.lua $@
	shembed -u etc/include-code-files.lua $@
	shembed -u etc/center-image.lua $@
	shembed -u etc/svg-image-to-pdf.lua $@
	shembed -u etc/pandoc-beamer.tex $@
	shembed -u etc/pandoc-report.tex $@
	shembed -u etc/beamerthemeulille.sty $@
	shembed -u etc/logo-univ-lille.pdf $@
	shembed -u etc/reportthemeulille.sty $@

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm -f $(shell find . -name "*~")

reset: clean                    ## supprimer les fichiers regénérables
	-rm -f $(IMG-PDF) $(IMG-PNG)
	cd test ; $(MAKE) reset

test:                           ## faire les tests
	cd test ; $(MAKE)

pull:                           ## récupérer les modifications depuis les dépôts git
	git pull boulgour master
	git pull ulille master	
	git pull github master

push: pull                      ## pousser les modifications vers les dépôts git
	git push --all boulgour
	git push --all ulille
	git push --all github
