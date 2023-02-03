IMG-SVG := $(wildcard md2pdf/etc/*.svg modeles-pdf/img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))

# POSIX shell for all for ERE
SED := sed $(shell sed v </dev/null >/dev/null 2>&1 && echo " --posix") -E

help:                           ## liste les cibles disponibles
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

%.pdf: %.svg
	inkscape -d 2400 -o $@ -T $<

##############################################################################

.PHONY: build check clean reset test pull push

build: md2pdf/md2pdf            ## générer les scripts et modeles-pdf
	cd modeles-pdf ; $(MAKE)

images: $(IMG-PDF)              ## génère les images PDF à partir des SVG

md2pdf/md2pdf: images           ## mets à jour les fichiers inclus de md2pdf
	shembed -u md2pdf/makefile-pandoc $@
	shembed -u md2pdf/etc/include-files.lua $@
	shembed -u md2pdf/etc/include-code-files.lua $@
	shembed -u md2pdf/etc/center.lua $@
	shembed -u md2pdf/etc/svg-image-to-pdf.lua $@
	shembed -u md2pdf/etc/pandoc-beamer.tex $@
	shembed -u md2pdf/etc/pandoc-report.tex $@
	shembed -u md2pdf/etc/beamerthemeulille.sty $@
	shembed -u md2pdf/etc/logo-univ-lille.pdf $@
	shembed -u md2pdf/etc/reportthemeulille.sty $@
	shembed -u md2pdf/etc/beamerthemesif.sty $@
	shembed -u md2pdf/etc/logo-sif-2022-horizontal.pdf $@
	shembed -u md2pdf/etc/logo-sif-2022-horizontal.pdf $@
	shembed -u md2pdf/etc/reportthemesif.sty $@
	shembed -u modeles-pdf/modele-diaporama.md $@
	shembed -u modeles-pdf/modele-rapport.md $@
	shembed -u modeles-pdf/md2pdf-exemple-code $@
	shembed -u modeles-pdf/md2pdf-fonctionnement.md $@
	shembed -u modeles-pdf/md2pdf-reference.md $@
	shembed -u modeles-pdf/img/logo-beamer.pdf $@
	shembed -u modeles-pdf/img/logo-cgir.pdf $@
	shembed -u modeles-pdf/img/logo-da2i.pdf $@
	shembed -u modeles-pdf/img/logo-markdown.pdf $@
	shembed -u modeles-pdf/img/tex-friendly-zone.pdf $@
	shembed -u modeles-pdf/img/gnu.pdf $@
	shembed -u modeles-pdf/img/tux.pdf $@

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm -f $(shell find . -name "*~")

reset: clean                    ## supprimer les fichiers regénérables
	-rm -f $(IMG-PDF) $(IMG-PNG)
	cd test ; $(MAKE) reset
	cd modeles-pdf ; $(MAKE) reset

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
