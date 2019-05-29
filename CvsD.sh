#!/bin/bash
#USAGE: bash CvsD.sh *.no.header
FQ="${@:1}"
for i in $FQ; do
    BASE=$( basename $i .no.header )
    echo "${BASE}" >> Base.names
    grep -c Cladocopium ${BASE}.no.header >> Cladocopium.matches
    echo "grep -c Cladocopium ${BASE}.no.header"
    grep -c Durisdinium ${BASE}.no.header >> Durisdinium.matches
done

