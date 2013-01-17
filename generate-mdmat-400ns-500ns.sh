#!/bin/sh

bt=200000
et=300000

echo "103" > cur_proteinA.txt
echo "104" > cur_proteinB.txt
echo "24" > cur_protein.txt

for i in  1 2 3 4 5 6 7 8 9 10

do

g_mdmat_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md_$i.tpr -n ../PDBsGROs/index_$i.ndx -mean ${bt}dm_A_$i.xpm  -b ${bt} -e ${et}  -nice 1 < cur_proteinA.txt &

g_mdmat_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md_$i.tpr -n ../PDBsGROs/index_$i.ndx -mean ${bt}dm_B_$i.xpm  -b ${bt} -e ${et} -nice 1 < cur_proteinB.txt &

g_mdmat_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md_$i.tpr -n ../PDBsGROs/index_$i.ndx -mean ${bt}dm_AB_$i.xpm  -b ${bt} -e ${et} -nice 1 < cur_protein.txt &


#xpm2ps_g_f -f Act_ss_$i.xpm -o Act_ss_$i.eps
#xpm2ps_g_f -f Bct_ss_$i.xpm -o Bct_ss_$i.eps

done

rm \#* protein*.txt
