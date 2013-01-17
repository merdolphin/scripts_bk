#!/bin/bash

echo "1"> idx.txt

trjconv_g_f -f cc_0.xtc -s ../../nd0010.tpr -o bb_0.pdb -nice -18 -dt 50 -pbc nojump -ur compact < idx.txt 


