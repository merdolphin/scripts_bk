#!/bin/sh


for i in 1 $(seq 9)
do
sed '/447  O2  ALA B  42/a\
TER     447  O2  ALA B  42' < md_$i$i.pdb > md_$i$i$i.pdb 

sed '/857  O2  ALA C  84/a\
TER     857  O2  ALA C  84' < md_$i$i$i.pdb > md_TER_$i.pdb


for i in 100
do
sed '/447  O2  ALA B  42/a\
TER     447  O2  ALA B  42' < md_$i.pdb > md_10.pdb 

sed '/857  O2  ALA C  84/a\
TER     857  O2  ALA C  84' < md_10.pdb > md_TER_10.pdb
done

done

for j in $(seq 3);
do
echo $j
done
