#!/usr/bin/env bash

test_template_theme_via_cli() {
    reset
    mute $cmd -t toto -L simple.md
    assertReturn "$(grep -Fq '\usetheme{toto}' simple.tex)" 0
    rm -f simple.tex
}

test_template_theme_via_env() {
    reset
    export THEME=toto
    mute $cmd -L simple.md
    assertReturn "$(grep -Fq '\usetheme{toto}' simple.tex)" 0
    export THEME=
    rm -f simple.tex
}

test_template_themeoptions_via_cli() {
    reset
    mute $cmd -t toto -P "-V themeoptions=titi=titi" -L simple.md
    assertReturn "$(grep -Fq '\usetheme[titi=titi]{toto}' simple.tex)" 0
    rm -f simple.tex
}

test_template_themeoptions_via_env() {
    reset
    export THEME=toto
    export THEMEOPTIONS=titi=titi
    mute $cmd -L simple.md
    assertReturn "$(grep -Fq '\usetheme[titi=titi]{toto}' simple.tex)" 0
    export THEME=
    export THEMEOPTIONS=
    rm -f simple.tex
}

test_template_themeoptions_multiple_via_env() {
    reset
    export THEME=toto
    export THEMEOPTIONS=titi=titi,tata=tata
    mute $cmd -L simple.md
    assertReturn "$(grep -Fq '\usetheme[titi=titi,tata=tata]{toto}' simple.tex)" 0
    export THEME=
    export THEMEOPTIONS=
    rm -f simple.tex
}
