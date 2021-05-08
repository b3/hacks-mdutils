#!/usr/bin/env bash

test_confdir_absolute() {
    reset
    mute $cmd simple.md && rm simple.pdf &&
    mv etc /tmp/cte
    assertReturn "$($cmd -C /tmp/cte -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
    rm -rf simple.md /tmp/cte
}

test_confdir_relative() {
    reset
    mute $cmd simple.md && rm simple.pdf &&
    mkdir dir && mv etc dir/cte
    assertReturn "$($cmd -C dir/cte -L simple.md)" 0
    assertReturn "$(head -1 simple.tex | grep -q beamer)" 0
    rm -rf simple.tex dir
}
