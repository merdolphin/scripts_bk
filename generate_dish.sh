#!/bin/sh

echo -e "25 \n 1" > index.txt

echo -e "25 \n 98" > Fe_His6.txt
echo -e "25 \n 99" > Fe_His13.txt
echo -e "25 \n 100" > Fe_His14.txt

for i in {0..8}

do
#g_dist_g_f -f ../PDBsGROs/md_0.xtc -s ../PDBsGROs/md500_0.tpr -n ../PDBsGROs/index_0.ndx -dist 3.5 -nice -13 < index.txt > dist_$i.log

g_dist_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md500_$i.tpr -n ../PDBsGROs/index_$i.ndx -o dist_Fe_His6_$i.xvg  -nice -13 -dt 100 < Fe_His6.txt

g_dist_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md500_$i.tpr -n ../PDBsGROs/index_$i.ndx -o dist_Fe_His13_$i.xvg  -nice -13 -dt 100 < Fe_His13.txt

g_dist_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md500_$i.tpr -n ../PDBsGROs/index_$i.ndx -o dist_Fe_His14_$i.xvg  -nice -13 -dt 100 < Fe_His14.txt

done
