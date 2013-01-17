#!/bin/sh





g_m_g_f -f ../../traj.xtc -s ../../topol.tpr -n ../../index.ndx -od $(($i-29))\_bilayer.xvg -nice 0 -dt 5000 -b 900000 -e 1000000  < $i\_bilayer.txt &



rm *.txt
