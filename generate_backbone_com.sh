#!/bin/bash

echo "22" > idx.txt

for i in {0..108}

do

do_dssp_t -f ../cc_$i.xtc -s ../../../nd0010.tpr -n ../../index.ndx -o ss_$i.xpm -sc scount_$i.xvg -nice -19 < idx.txt &

done
