#!/bin/sh

echo "22" > index.txt

echo "20
26" > A_S.txt

echo "21
26" > B_S.txt

#g_hbond_g_f -f ../c_0.xtc -n ../../index.ndx -s ../../nd0010.tpr -hbn AB_S_hbndx.ndx -nice -19 -g AB_S_hbond.log


g_hbond_g_f -f ../c_0.xtc -n ../../index.ndx -s ../../nd0010.tpr -hbn A_S_hbndx.ndx -nice -19 -g A_S_hbond.log < A_S.txt & 

g_hbond_g_f -f ../c_0.xtc -n ../../index.ndx -s ../../nd0010.tpr -hbn B_S_hbndx.ndx -nice -19 -g B_S_hbond.log < B_S.txt 

rm index.txt
