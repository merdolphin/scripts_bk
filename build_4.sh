#!/bin/sh
m=1

for i in A_*.gro
do 
for j in B_*.gro
do
for k in C_*.gro
do
for l in D_*.gro
do

cat s100a9.gro >  ABCD_$m.gro

awk '{if(NF==6) print $0}' $i >> ABCD_$m.gro
awk '{if(NF==6) print $0}' $j >>  ABCD_$m.gro
awk '{if(NF==6) print $0}' $k >>  ABCD_$m.gro
awk '{if(NF==6) print $0}' $l >>  ABCD_$m.gro

tail -1 em_11.gro >>  ABCD_$m.gro


m=$(($m+1)) 

done
done
done
done

