#!/bin/sh

dt=50000
echo "19 23" > index.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num AE_hbnum_dt_$dt.xvg -dt $dt < index.txt &

echo "19 22" > index2.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num AD_hbnum_dt_$dt.xvg -dt $dt < index2.txt &

echo "19 21" > index3.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num AC_hbnum_dt_$dt.xvg -dt $dt < index3.txt &

echo "19 20" > index4.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num AB_hbnum_dt_$dt.xvg -dt $dt < index4.txt &

echo "20 21" > index5.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num BC_hbnum_dt_$dt.xvg -dt $dt < index5.txt &

echo "20 22" > index6.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num BD_hbnum_dt_$dt.xvg -dt $dt < index6.txt &

echo "20 23" > index7.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num BE_hbnum_dt_$dt.xvg -dt $dt < index7.txt &

echo "21 22" > index8.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num CD_hbnum_dt_$dt.xvg -dt $dt < index8.txt &


echo "21 23" > index.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num CE_hbnum_dt_$dt.xvg -dt $dt < index.txt

echo "22 23" > index.txt
g_hbond_g_d -f ../../md_0_1000.xtc -s ../../md_0_100.tpr -n ../../index.ndx -num DE_hbnum_dt_$dt.xvg -dt $dt < index.txt





