#!/bin/bash

echo "31" > idx.txt

trjconv_g_f -f md_a_r.xtc -s ../../../2app4hem/confout0.gro -o md_a_r_dt_500.pdb -ur compact -pbc whole -dt 500 -nice -19 -n index.ndx <idx.txt &

trjconv_g_f -f md_a_r.xtc -s ../../../2app4hem/confout0.gro -o md_a_r_dt_50.pdb -ur compact -pbc whole -dt 50 -nice -19 -n index.ndx < idx.txt &


