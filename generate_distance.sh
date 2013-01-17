#!/bin/bash

echo "22
23" > index.txt

echo "22
24" > AB_linker1.txt

echo "22
25" > AB_linker2.txt


g_dist_g_f -f ../../PDBsGROs/md_0.xtc -s ../../PDBsGROs/nd0010.tpr -n ../../PDBsGROs/index.ndx -o dist_AB_linker1.xvg -dt 500 -nice -19  < AB_linker1.txt

g_dist_g_f -f ../../PDBsGROs/md_0.xtc -s ../../PDBsGROs/nd0010.tpr -n ../../PDBsGROs/index.ndx -o dist_AB_linker2.xvg -dt 500 -nice -19  < AB_linker2.txt

#g_dist_g_f -f ../../PDBsGROs/md_0.xtc -s ../../PDBsGROs/nd0010.tpr -n ../../PDBsGROs/index.ndx -o dist_AB_s100a9.xvg -dt 500 -nice -19  < index.txt

rm index.txt AB_*.txt
