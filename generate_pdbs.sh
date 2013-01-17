#!/bin/bash

echo "1"> idx.txt

for i in {0..108}

do

trjconv_g_f -f cc_$i.xtc -s ../../nd0010.tpr -o dd_$i.pdb -nice -18 -dt 500 < idx.txt &

done 
