#!/bin/bash

m=6;



cat s100a9_align_cut.gro > 2a_2b_$m.gro

for i in 3 4

do
       
    awk '{if(NF==6) print $0}' a\_$i.gro >> 2a_2b_$m.gro
    
done


for j in 1 2

do 
    awk '{if(NF==6) print $0}' b_$j.gro >> 2a_2b_$m.gro

done

    tail -1 s100a9_align.gro >> 2a_2b_$m.gro

