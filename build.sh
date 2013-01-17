#!/bin/bash

j=0

for a in {1..18}
do
for b in {1..11}
do
cat Abeta.gro > new_$j.gro

sed -n '3,75p' hem_$a.gro >> new_$j.gro

sed -n '3,76p' hem_b_$b.gro  >> new_$j.gro
j=$(($j+1))

done
done
