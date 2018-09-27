#!/usr/bin/env bash

test_filename_start_with_dash() {
    reset
    cp simple.md -- -simple.md
    assertReturn "$($cmd -p -- -simple.md)" 0
    assertReturn "$(test -s -simple.pdf)" 0
    rm -- -simple.md -simple.pdf
}

test_empty_args() {
    reset
    assertReturn "$(mute $cmd)" 1
    assertEqual "$(stderr $cmd)" "$errmsg missing source file"
}
