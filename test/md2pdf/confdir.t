#!/usr/bin/env bash

test_absolute_confdir() {
    reset
    mute $cmd simple.tex && rm simple.pdf &&
        mv etc /tmp/cte
    assertReturn "$($cmd -C /tmp/cte -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
    rm -rf simple.tex /tmp/cte
}

test_relative_confdir() {
    reset
    mute $cmd simple.tex && rm simple.pdf &&
        mkdir dir && mv etc dir/cte
    assertReturn "$($cmd -C dir/cte -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
    rm -rf simple.tex dir
}
