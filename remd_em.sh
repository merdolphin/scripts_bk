#!/bin/sh

j=0
a=1


for i in {0..64}

do

grompp_g_f -f minim.mdp -c confout$i.gro -o em_$i.tpr


mdrun_g_f -deffnm em_$i &


rm \#md*
 
done

