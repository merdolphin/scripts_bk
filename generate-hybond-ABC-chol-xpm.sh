#!/bin/bash

#echo "26 
#34" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num A_chol.xvg -hbm A_chol.xpm -hbn A_chol.hbond.ndx -dt 20000 < group.txt

#echo "27 
#34" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num B_chol.xvg -hbm B_chol.xpm -hbn B_chol.hbond.ndx -dt 20000 < group.txt

#echo "28 
#34" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num C_chol.xvg -hbm C_chol.xpm -hbn C_chol.hbond.ndx -dt 20000 < group.txt

echo "26 
27" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num A_B.xvg -hbm A_B.xpm -hbn A_B.hbond.ndx -dt 20000 < group.txt

echo "28 
27" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num B_C.xvg -hbm B_C.xpm -hbn B_C.hbond.ndx -dt 20000 < group.txt

