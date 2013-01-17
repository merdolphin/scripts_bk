#!/bin/bash

#echo "32 
#37" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num ABC_chol_dppc.xvg -dt 20000 < group.txt

#echo "32 
#34" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num ABC_chol.xvg -dt 20000 < group.txt

#echo "32 
#36" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num ABC_dppc.xvg -dt 20000 < group.txt

#echo "32 
#32" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num ABC_ABC.xvg -dt 20000 < group.txt

#echo "26 
#27" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num A_B.xvg -dt 20000 < group.txt

#echo "28
#27" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num A_B.xvg -dt 20000 < group.txt

#for i in  100000 200000 300000 400000 500000 600000 700000 800000 900000 1000000
#do
#	let " j = $i + 100000"
#echo "32 
#37" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.ABC_chol_dppc.xvg -b $i -e $j -dt 5000 < group.txt

#echo "32 
#34" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.ABC_chol.xvg -b $i -e $j -dt 5000 < group.txt

#echo "32 
#36" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.ABC_dppc.xvg -b $i -e $j -dt 5000 < group.txt

#echo "32 
#32" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.ABC_ABC.xvg -b $i -e $j -dt 5000 < group.txt

#echo "26 
#27" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.A_B.xvg -b $i -e $j -dt 5000 < group.txt

#echo "28
#27" > group.txt
#g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.B_C.xvg -b $i -e $j -dt 5000 < group.txt
#done


echo "29 
37" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num BA_chol_dppc.xvg -hbm BA_chol_dppc.xpm -dt 20000 < group.txt

echo "31 
37" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num BC_chol_dppc.xvg -hbm BC_chol_dppc.xpm -dt 20000 < group.txt

echo "29 
34" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num BA_chol.xvg -hbm BA_chol.xpm -dt 20000 < group.txt

echo "31 
34" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num BC_chol.xvg -hbm BC_chol.xpm -dt 20000 < group.txt

echo "29 
36" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num BA_dppc.xvg -hbm BA_dppc.xpm -dt 20000 < group.txt

echo "31 
36" > group.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num BC_dppc.xvg -hbm BC_dppc.xpm -dt 20000 < group.txt

echo "26 
27" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num A_B.xvg -hbm B_A.xpm -dt 20000 < group1.txt

echo "28
27" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num B_C.xvg -hbm B_C.xpm -dt 20000 < group1.txt






