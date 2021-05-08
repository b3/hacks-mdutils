#!/usr/bin/env bash

test_0001_template_class_options_via_cli() {
    reset
    mute $cmd -P "-V classoption=toto,tutu" -L simple.md
    assertReturn "$(head -1 simple.tex | grep -qF '\documentclass[t,10pt,toto,tutu]{beamer}')" 0
    rm -f simple.tex
    mute $cmd -r -P "-V classoption=toto,tutu" -L simple.md
    assertReturn "$(head -1 simple.tex | grep -qF '\documentclass[10pt,twoside,openright,toto,tutu]{report}')" 0
    rm -f simple.tex
}

test_0001_template_class_options_via_env() {
    reset
    export EXTRAS="-V classoption=toto,tutu"
    mute $cmd -L simple.md
    assertReturn "$(head -1 simple.tex | grep -qF '\documentclass[t,10pt,toto,tutu]{beamer}')" 0
    rm -f simple.tex
    mute $cmd -r -L simple.md
    assertReturn "$(head -1 simple.tex | grep -qF '\documentclass[10pt,twoside,openright,toto,tutu]{report}')" 0
    rm -f simple.tex
}

