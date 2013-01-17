#!/bin/bash

echo "20
21" > AB.txt

echo "22
23" > idx.txt

g_mindist_g_f -f ../c_0.xtc -s ../nd0010.tpr -n ../../PDBsGROs/index.ndx -od AB_S_mindist.xvg -on AB_S_numcont.xvg -o AB_S_atm-pair.out -or AB_S_mindistres.xvg -nice -11 -dt 100 < idx.txt


g_mindist_g_f -f ../c_0.xtc -s ../nd0010.tpr -n ../../PDBsGROs/index.ndx -od A_B_mindist.xvg -on A_B_numcont.xvg -o A_B_atm-pair.out -or A_B_mindistres.xvg -nice -11 -dt 10 < AB.txt
