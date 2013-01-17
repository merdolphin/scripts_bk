#!/bin/sh

for i in 0

do

g_mindist_g_f -f ../c_0.xtc -s ../PDBsGROs/nd0010.tpr -n ../../index.ndx -dt 10 -nice -19 -o Ca_AB_atom-pair_$i.out -printresname -od Ca_AB_mindist_$i.xvg -on Ca_AB_numcont_$i.xvg -or Ca_AB_minidstres_$i.xvg
 
done





