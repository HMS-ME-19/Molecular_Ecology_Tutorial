#!/bin/bash
#USAGE: bash CvsD.sh .no.header
FQ="${@:1}"
for i in $FQ; do
    BASE=$( basename $i .no.header )
    echo "${BASE}" >> Base.names
    grep Cladocopium ${BASE}.no.header > temp
    grep -v Durisdinium temp > temp2
    grep -c Cladocopium temp2 >> Cladocopium.matches
    echo "grep -c Cladocopium ${BASE}.no.header"
    grep Durisdinium ${BASE}.no.header > temp3
    grep -v Cladocopium temp3 > temp4
    grep -c Durisdinium temp4 >> Durisdinium.matches
done
