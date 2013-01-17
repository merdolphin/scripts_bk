#!/bin/bash

for i in 100000 200000 300000 400000 500000 600000 700000 800000 900000 1000000
do
        let " j = $i + 100000"
echo "32 
37" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.nodt.ABC_chol_dppc.xvg -b $i -e $j  < group1.txt

echo "32 
34" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.nodt.ABC_chol.xvg -b $i -e $j  < group1.txt

echo "32 
36" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.nodt.ABC_dppc.xvg -b $i -e $j  < group1.txt

echo "32 
32" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.nodt.ABC_ABC.xvg -b $i -e $j  < group1.txt

echo "26 
27" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.nodt.A_B.xvg -b $i -e $j  < group1.txt

echo "28
27" > group1.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -num $i.nodt.C_B.xvg -b $i -e $j  < group1.txt
done

