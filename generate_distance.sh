#!/bin/bash

echo "20
21" > idx.txt



for i in {0..107}

do


#g_dist_g_f -f ../continous_traj/cc\_$i.xtc -s ../continous_traj/nd0010.tpr -n ../continous_traj/index.ndx -nice -10 -o dist_$i.xvg < idx.txt

g_dist_g_f -f ../PDBsGROs/last10_$i.xtc -s ../continous_traj/nd0010.tpr -n ../continous_traj/index.ndx -nice -10 -o dist_$i.xvg < idx.txt

done 
