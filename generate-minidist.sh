#!/bin/sh

echo "20
21" > index.txt

echo "22
23" > AB_S.txt


echo "22
24" > AB_linker1.txt

echo "22
25" > AB_linker2.txt



#echo "proA \n proB " > AB.txt

#for i in 1 3 5 6 7 8 9
for i in 0

do
g_mindist_g_f -f ../../PDBsGROs/md_$i.xtc -s ../../PDBsGROs/nd0010.tpr -n ../../PDBsGROs/index.ndx -dt 500 -nice -19 -o AB_linker1_atom-pair_$i.out -printresname -od AB_linker1_mindist_$i.xvg -on AB_linker1_numcont_$i.xvg -or AB_linker1_minidstres_$i.xvg < AB_linker1.txt 

g_mindist_g_f -f ../../PDBsGROs/md_$i.xtc -s ../../PDBsGROs/nd0010.tpr -n ../../PDBsGROs/index.ndx -dt 500 -nice -19 -o AB_linker2_atom-pair_$i.out -printresname -od AB_linker2_mindist_$i.xvg -on AB_linker2_numcont_$i.xvg -or AB_linker2_minidstres_$i.xvg < AB_linker2.txt

#g_mindist_g_f -f ../../PDBsGROs/md_$i.xtc -s ../../PDBsGROs/md_$i.tpr -n ../../PDBsGROs/index_$i.ndx -o A_B_atom-pair_$i.out -dt 1000 -printresname -od A_B_mindist_$i.xvg -on A_B_numcont_$i.xvg -or A_B_mindistres_$i.xvg < AB.txt

done

rm index.txt AB.txt \#* 
