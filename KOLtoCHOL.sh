#!/bin/sh

sed -f dict_KOLtoCHOL < conf15000.gro > bilayer.gro 

cat bilayer.gro | grep CHOL | sed -e 's/^\(\s*\w\+\s\+[^0-9[:blank:]]\+\)\([[:digit:]]\+\)/\1 \2/'| sort -n -k 1,1 -k 3,3 | sed -e 's/^\(\s*\w\+\s\+[^0-9[:blank:]]\+\)\s\([[:digit:]]\+\)/\1\2/' > cholesterol.sorted

