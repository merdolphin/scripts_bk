#!/bin/sh

echo "1" > idx.txt

for i in {0..107}

do

do_dssp_t -f ../PDBsGROs/last10_$i.xtc -s ../../../md024_0.gro -sc scount_$i.xvg -o ss_$i.xpm  -nice -19  < idx.txt &

done
