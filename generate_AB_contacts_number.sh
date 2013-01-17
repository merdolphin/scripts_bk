#!/bin/sh

echo "20
21" > AB.txt

g_hbond_g_f -f ../c_0.xtc -n ../../index.ndx -s ../../nd0010.tpr -num A_B_hbnum_dt_10.xvg -g A_B_hbond.log -nice -19 -dt 10 < AB.txt

rm AB.txt
