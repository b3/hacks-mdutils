#!/usr/bin/env bash

test_latex_file_beamer() {
    reset
    assertReturn "$($cmd -p -L simple.md)" 0
    assertReturn "$(test -s simple.tex)" 0
    rm simple.tex
}

test_latex_file_report() {
    reset
    assertReturn "$($cmd -r -L simple.md)" 0
    assertReturn "$(test -s simple.tex)" 0
    rm simple.tex
}
