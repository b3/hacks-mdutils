#!/usr/bin/env bash

test_some_known_options() {
    assertReturn "$($cmd -h)" 0
    assertReturn "$($cmd --help)" 0
    assertReturn "$($cmd -V)" 0
}

test_unknown_options() {
    assertNotReturn "$(stderr $cmd -x)" 0
    assertEqual "$(stderr $cmd -x)" "$errmsg -x: unknown option"
}
