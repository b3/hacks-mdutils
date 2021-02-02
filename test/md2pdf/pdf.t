#!/usr/bin/env bash

test_pdf_file_beamer() {
    reset
    assertReturn "$($cmd -p simple.md)" 0
    assertReturn "$(test -s simple.pdf)" 0
    rm simple.pdf
}

test_pdf_file_report() {
    reset
    assertReturn "$($cmd -r simple.md)" 0
    assertReturn "$(test -s simple.pdf)" 0
    rm simple.pdf
}
