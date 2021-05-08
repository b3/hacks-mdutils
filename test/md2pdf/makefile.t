#!/usr/bin/env bash

test_makefile() {
    reset
    mute $cmd simple.md && rm simple.pdf
	mute make -f etc/makefile-pandoc FILE=simple.tex
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
	rm -f simple.tex
}
