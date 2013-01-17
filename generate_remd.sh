#!/bin/sh

echo "1
1" > index.txt 

#for i in {0..8}
#for i in {9..14}

for i in {16..20}

do

g_rms_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md500_$i.tpr -n ../PDBsGROs/index_$i.ndx -dt 100 -nice -19 -o remd_$i.xvg < index.txt &

done 
