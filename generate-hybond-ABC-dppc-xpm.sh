#!/bin/bash

echo "26 
36" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num A_dppc.xvg -hbm A_dppc.xpm -hbn A_dppc.hbond.ndx -dt 20000 < group1.txt

echo "27 
36" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num B_dppc.xvg -hbm B_dppc.xpm -hbn B_dppc.hbond.ndx -dt 20000 < group1.txt

echo "28 
36" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num C_dppc.xvg -hbm C_dppc.xpm -hbn C_dppc.hbond.ndx -dt 20000 < group1.txt


