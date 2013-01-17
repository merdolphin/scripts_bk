#!/bin/bash

for i in 0 400000 800000 860000 920000 980000
do
	echo 1 > group.txt
	trjconv_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o protein_$i.pdb -dump $i < group.txt
done
