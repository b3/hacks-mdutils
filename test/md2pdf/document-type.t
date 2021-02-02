#!/usr/bin/env bash

test_md2pdf_beamer() {
    reset
    assertReturn "$($cmd -p -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
    rm -f simple.tex
}

test_md2pdf_report() {
    reset
	assertReturn "$($cmd -r -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q report)" 0
    rm -f simple.tex
}
