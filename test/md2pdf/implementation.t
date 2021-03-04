#!/usr/bin/env bash

test_implementation_opt() {
	# _opt should only be true for options
    reset
    cp simple.md -- nouveaux-trucs.md
    assertReturn "$($cmd -p nouveaux-trucs.md)" 0
    rm nouveaux-trucs.*
}
