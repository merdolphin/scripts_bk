#!/bin/sh

#echo "20
#21" > index.txt

echo "22" > index.txt

#echo "proA \n proB " > AB.txt

#for i in 1 3 5 6 7 8 9
for i in 0

do
g_mdmat_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/nd0010.tpr -n ../PDBsGROs/index.ndx -nice -9 -mean AB_mdmat.xpm < index.txt &

#g_mindist_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md_$i.tpr -n ../PDBsGROs/index_$i.ndx -o A_B_atom-pair_$i.out -dt 1000 -printresname -od A_B_mindist_$i.xvg -on A_B_numcont_$i.xvg -or A_B_mindistres_$i.xvg < AB.txt

done

rm index.txt AB.txt \#* 
