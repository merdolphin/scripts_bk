#!/bin/sh

g_mindist_g_f -f ../c_0.xtc -s ../PDBsGROs/nd0010.tpr -n ../../index.ndx -dt 10 -nice -19 -o AB_S_atom-pair_$i.out -printresname -od AB_S_mindist_$i.xvg -on AB_S_numcont_$i.xvg -or AB_S_minidstres_$i.xvg 






