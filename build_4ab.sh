#!/bin/sh

m=1

for j in a b 

do

cat s100a9_align_cut.gro >  4$j\_$m.gro

for i in 1 2 3 4

do

awk '{if(NF==6) print $0}' $j\_$i.gro >> 4$j\_$m.gro
#awk '{if(NF==6) print $0}' $j >>  AB_$m.gro

#m=$(($m+1)) 

done

tail -1 s100a9_align.gro >> 4$j\_$m.gro

done
