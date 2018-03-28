#!/bin/bash

# reset files
reset() {
    for f in *.orig
    do
        cp -f "$f" "${f%%.orig}"
    done
}

# remove all files
clean () {
    for f in *.orig
    do
        rm -f "$f" "${f%%.orig}"
    done
}

# create files needed for tests
init () {
	cat <<EOF > simple.md.orig
# Un titre
EOF
    echo > diapo.md.orig
    echo > report.md.orig
    reset
}

