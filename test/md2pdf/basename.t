#!/usr/bin/env bash

testMD2Beamer() {
    reset
    ln -s $cmd md2beamer
    assertReturn "$(./md2beamer -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
    rm -f simple.tex md2beamer
}

testMD2Report() {
    reset
    ln -s $cmd md2report
    assertReturn "$(./md2report -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q report)" 0
    rm -f simple.tex md2report
}
