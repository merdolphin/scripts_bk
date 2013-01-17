#!/bin/bash

for i in {1..1296}

do 

grompp_g_f -f minim.mdp -c ABCD_$i.gro -o em_$i.tpr

rm \#*

done

#for i in {1..1296}

#do

#mdrun_g_f -v -deffnm em_$i & 

#done
