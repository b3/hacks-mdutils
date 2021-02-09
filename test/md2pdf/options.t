#!/usr/bin/env bash

test_options_some_known_ones() {
    assertReturn "$($cmd -h)" 0
    assertReturn "$($cmd --help)" 0
    assertReturn "$($cmd -V)" 0
}

test_options_unknown_one() {
    assertNotReturn "$(stderr $cmd -x)" 0
    assertEqual "$(stderr $cmd -x)" "$errmsg -x: unknown option"
}
