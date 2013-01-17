#!/bin/sh

#for i in proA proB proC proD

for i in {198..207}

do

echo $i $i | g_rms_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -o $i\_rmsd.xvg -nice 0 -dt 5000 &

done
