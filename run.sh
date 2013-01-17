#!/bin/bash

#echo "15" > sol.txt

#for i in {1..82}
for i in {0..82}
do

#cp topol.top top_$i.top

rm \#*
#genbox_g_f -cs spc216.gro -cp 2app4hem_$i.gro -p topol.top -o solv_$i.gro

#grompp_g_f -f ions.mdp -c new_$i.gro -p top_$i.top -o ions_$i.tpr


#genion_g_f -s ions_$i.tpr -o sys_$i.gro -pname NA -nname CL -neutral -conc 0.1 -p top_$i.top < sol.txt

grompp_g_f -f minim.mdp -c sys_$i.gro -o em_$i.tpr -p topol.top

done
