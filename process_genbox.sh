#!/bin/bash

for i in {1..1296}

do 

cp topol.top top_$i.top  

genbox_g_f -cs spc216.gro -cp em_$i.gro -o solv_$i.gro -p top_$i.top

rm \#*

done

#for i in {1..1296}

#do

#mdrun_g_f -v -deffnm em_$i & 

#done
