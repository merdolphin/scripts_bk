#!/bin/sh






for i in {30..197}

do

echo "$i 28" > $i\_bilayer.txt

g_dist_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -o $(($i-29))_bilayer.xvg -nice 0 -dt 5000 -b 900000 -e 1000000  < $i\_bilayer.txt &

done

rm *.txt
