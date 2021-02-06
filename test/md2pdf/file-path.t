#!/usr/bin/env bash

test_filepath_source() {
    reset
    mkdir -p path/elsewhere
    mv simple.md -- path/elsewhere/file.md
    cd path
    assertReturn "$($cmd -p elsewhere/file.md)" 0
    assertReturn "$(test -s elsewhere/file.pdf)" 0
    cd .. ; rm -rf path
}
