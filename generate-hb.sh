#!/bin/sh

echo "28 26" > bilayer_proAB.txt

echo "28 27" > bilayer_proCD.txt


g_hbond_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -nice 0 -dt 5000 -num hbnum_AB_bilayer.xvg  < bilayer_proAB.txt &

g_hbond_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -num hbnum_CD_bilayer.xvg  -nice 0 -dt 5000  < bilayer_proCD.txt
