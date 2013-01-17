#!/bin/sh


echo "24 24" > cur_protein.txt

for i in  1  3 5 6 7 8 9 

do


g_mdmat_g_f -f ../PDBsGROs/md_$i\_a.xtc -s ../PDBsGROs/md_$i.tpr -n ../PDBsGROs/index_$i.ndx -mean dm_AB_$i.xpm  -nice 0 -b 100000 -e 500000  < cur_protein.txt &


#xpm2ps_g_f -f Act_ss_$i.xpm -o Act_ss_$i.eps
#xpm2ps_g_f -f Bct_ss_$i.xpm -o Bct_ss_$i.eps

done

rm \#* protein*.txt
