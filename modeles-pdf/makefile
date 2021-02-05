all: modele-diaporama.pdf modele-rapport.pdf

images_pdf := $(addsuffix .pdf,$(basename $(wildcard img/*.svg)))

MD2PDF := ../md2pdf/md2pdf

modele-diaporama.pdf: modele-diaporama.md md2pdf-exemple-code $(images_pdf)
	$(MD2PDF) $<
	$(MAKE) clean

modele-rapport.pdf: modele-rapport.md md2pdf*.md $(images_pdf)
	$(MD2PDF) -r $<
	$(MAKE) clean

%.pdf: %.svg
	inkscape -d 2400 -o $@ -T $<

.PHONY: clean reset

clean:
	-rm -rf _minted* *~ *aux *log *vrb *out *nav *snm *toc *tex

reset: clean
	-rm -rf etc *pdf img/*pdf
