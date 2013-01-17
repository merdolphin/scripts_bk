#!/bin/sh
m=1
for i in A_*.gro
do 
for j in B_*.gro
do
cat S100a9.gro >  AB_$m.gro

awk '{if(NF==6) print $0}' $i >> AB_$m.gro
awk '{if(NF==6) print $0}' $j >>  AB_$m.gro

tail -1 em_11.gro >>  AB_$m.gro


m=$(($m+1)) 

done
done

