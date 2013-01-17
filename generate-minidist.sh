#!/bin/sh

echo "20
21" > index.txt

#echo "proA \n proB " > AB.txt

for i in 1 3 5 6 7 8 9


do
g_mindist_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/nd0010.tpr -n ../PDBsGROs/index.ndx -dt 1000 -nice -9 -o atom-pair_$i.out -printresname -od mindist_$i.xvg -on A_B_numcont_$i.xvg -or A_B_minidstres_$i.xvg < index.txt &

#g_mindist_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md_$i.tpr -n ../PDBsGROs/index_$i.ndx -o A_B_atom-pair_$i.out -dt 1000 -printresname -od A_B_mindist_$i.xvg -on A_B_numcont_$i.xvg -or A_B_mindistres_$i.xvg < AB.txt

done

rm index.txt AB.txt \#* 
