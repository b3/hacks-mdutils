all: modele-presentation.pdf modele-rapport.pdf

images_pdf := $(addsuffix .pdf,$(basename $(wildcard img/*.svg)))

modele-presentation.pdf: modele-presentation.md md2pdf-exemple-code $(images_pdf)
	../bin/md2pdf $<
	$(MAKE) clean

modele-rapport.pdf: modele-rapport.md md2pdf*.md $(images_pdf)
	../bin/md2pdf -r $<
	$(MAKE) clean

%.pdf: %.svg
	inkscape -d 2400 -o $@ -T $<

.PHONY: clean reset

clean:
	-rm -rf _minted* *~ *aux *log *vrb *out *nav *snm *toc *tex

reset: clean
	-rm -rf etc *pdf img/*pdf
