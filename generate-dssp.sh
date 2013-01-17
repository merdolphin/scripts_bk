#!/bin/bash

echo "1" > protein.txt

#for i in {0..8}
#for i in {9..14}

#for i in 16 17 18 10 20

for i in 15

do
do_dssp_t -f ../PDBsGROs/md_$i.xtc -s ../PDBsGROs/md500_$i.tpr -o ss_$i.xpm -sc scount_$i.xvg -dt 5000 -nice -10 < protein.txt &
done

rm \#*
