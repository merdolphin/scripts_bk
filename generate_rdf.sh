#!/bin/sh


echo "25
1" > index.txt

for i in {3..8}

do

g_rdf_g_f -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md500_$i.tpr -n ../PDBsGROs/index_$i.ndx -o -nice -11 -dt 100 Fe_protein_$i.xvg < index.txt &

done
