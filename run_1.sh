#!/bin/bash

for i in {1..81}
    do
        cp topol.top top\_$i.top ; genbox_g -cp new\_$i.gro -cs spc216.gro -o sol\_$i.gro -p top\_$i.top

        cp topol.top top\_$i.top ; genbox_g -cp new\_$i.gro -cs spc216.gro -o sol\_$i.gro -p top\_$i.top

        grompp_g -f ions.mdp -c sol_$i.gro -p top_$i.top -o ions_$i.tpr

        echo 14 | genion_g -s ions\_$i.tpr -o sys\_$i.gro -p top\_$i.top -neutral -pname NA -nname CL -conc 0.1
        rm -rf \#*
        grompp -f minim.mdp -c sys_$i.gro -o em_$i.tpr -p top_$i.top

    done
