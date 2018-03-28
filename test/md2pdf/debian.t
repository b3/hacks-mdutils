#!/usr/bin/env bash

test_list_debian_package() {
    assertReturn "$($cmd -l)" 0
    assertEqual "$($cmd -l)" "pandoc
tar
coreutils
texlive-latex-base
texlive-latex-recommended"
}
