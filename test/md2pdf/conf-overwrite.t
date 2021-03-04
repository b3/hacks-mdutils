#!/usr/bin/env bash

test_conf_replace_off() {
    reset
    test -d etc && rm -rf etc
    mkdir etc
    printf "" > etc/makefile-pandoc
    mute $cmd simple.md
    assertEqual "$(stat -c %s etc/makefile-pandoc)" "0"
    rm -rf etc
}

test_conf_replace_on() {
    reset
    test -d etc && rm -rf etc
    mkdir etc
    printf "" > etc/makefile-pandoc
    mute $cmd -O simple.md
    assertNotEqual "$(stat -c %s etc/makefile-pandoc)" "0"
    rm -rf etc
}
