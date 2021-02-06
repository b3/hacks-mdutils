#!/usr/bin/env bash

test_produce_demo_files_here() {
    reset
    mkdir demos
    cd demos
    assertReturn "$($cmd -d)" 0
    assertReturn "$(test -r modele-diaporama.md)" 0
    assertReturn "$(test -r modele-rapport.md)" 0
    assertReturn "$(test -r img/gnu.pdf)" 0
    assertReturn "$($cmd -p modele-diaporama.md)" 0
    assertReturn "$(test -r modele-diaporama.pdf)" 0
    assertReturn "$($cmd -r modele-rapport.md)" 0
    assertReturn "$(test -r modele-rapport.pdf)" 0
    cd .. ; rm -rf demos
}

test_produce_demo_files_there() {
    reset
    assertReturn "$($cmd -d demos)" 0
    assertReturn "$(test -r demos/modele-diaporama.md)" 0
    assertReturn "$(test -r demos/modele-rapport.md)" 0
    assertReturn "$(test -r demos/img/gnu.pdf)" 0
    cd demos
    assertReturn "$($cmd -p modele-diaporama.md)" 0
    assertReturn "$(test -r modele-diaporama.pdf)" 0
    assertReturn "$($cmd -r modele-rapport.md)" 0
    assertReturn "$(test -r modele-rapport.pdf)" 0
    cd .. ; rm -rf demos
}

