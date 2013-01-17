#!/bin/bash

echo "22" > idx.txt

for i in {9..20}

do

do_dssp -f ../cc_$i.xtc -s ../../../md024_0.gro -n ../../index.ndx -o ss_$i.xpm -sc scount_$i.xvg -nice -19 < idx.txt &

done
