#!/usr/bin/env bash

testSomeKnownOptions() {
	assertReturn "$($cmd -h)" 0
	assertReturn "$($cmd --help)" 0
}

testUnknownOptions() {
	assertNotReturn "$(stderr $cmd -x)" 0
	assertEqual "$(stderr $cmd -x)" "$errmsg unknown option: -x"
}
