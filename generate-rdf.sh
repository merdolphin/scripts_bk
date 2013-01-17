#!/bin/sh

echo "28 26" > bilayer_proAB.txt

echo "28 27" > bilayer_proCD.txt


g_rdf_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -o proAB_membraneSurf.xvg -nice 0 -dt 5000 -surf mol -bin 0.05 < bilayer_proAB.txt &

g_rdf_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -o proCD_membraneSurf.xvg -nice 0 -dt 5000 -surf mol -bin 0.05 < bilayer_proCD.txt
