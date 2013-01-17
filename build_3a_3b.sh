#!/bin/bash

m=1;

j=4

cat s100a9_align_cut.gro > 3b_$j.gro

for i in 1 2 3

do
       
    awk '{if(NF==6) print $0}' b\_$i.gro >> 3b_$j.gro
    
done

    awk '{if(NF==6) print $0}' a_$j.gro >> 3b_$j.gro


    tail -1 s100a9_align.gro >> 3b_$j.gro

