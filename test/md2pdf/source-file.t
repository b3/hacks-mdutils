#!/usr/bin/env bash

test_source_filename_start_with_dash() {
    reset
    cp simple.md -- -simple.md
    assertReturn "$($cmd -p -- -simple.md)" 0
    assertReturn "$(test -s -simple.pdf)" 0
    rm -- -simple.md -simple.pdf
}

test_source_unreadable_source() {
    reset
    chmod 000 simple.md
    assertReturn "$(mute $cmd simple.md)" 1
    assertEqual "$(stderr $cmd simple.md)" "$errmsg simple.md: unable to read"
    chmod 644 simple.md
    rm simple.md
}

test_source_empty_source() {
    reset
    assertReturn "$(mute $cmd)" 1
    assertEqual "$(stderr $cmd)" "$errmsg missing source file"
}
