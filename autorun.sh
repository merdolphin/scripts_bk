#!/bin/sh
while (qstat | grep 8722 | grep -q R) 
do sleep 5 
done 
grompp_g_f -f md.mdp -c npt.gro -p topol.top -o md_0.tpr 
qsub m0.sh
