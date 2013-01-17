#!/bin/bash

echo "27
28" > index.txt

echo "27
29" > A_Ca1.txt

echo "27
30" > A_Ca2.txt 

echo "27
31" > A_Ca3.txt

echo "27
32" > A_Ca4.txt


echo "28
29" > B_Ca1.txt

echo "28
30" > B_Ca2.txt

echo "28
31" > B_Ca3.txt

echo "28
32" > B_Ca4.txt

echo "33
29" > AB_Ca1.txt

echo "33
30" > AB_Ca2.txt

echo "33
31" > AB_Ca3.txt

echo "33
32" > AB_Ca4.txt

#g_mindist_g_f -f ../c_0.xtc -s ../PDBsGROs/nd0010.tpr -n ../../index.ndx -od CHC_S_minidist.xvg -nice -19

#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o CHC_CHC_dist.xvg < index.txt

#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o A_Ca1_dist.xvg < A_Ca1.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o A_Ca2_dist.xvg < A_Ca2.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o A_Ca3_dist.xvg < A_Ca3.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o A_Ca4_dist.xvg < A_Ca4.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o B_Ca1_dist.xvg < B_Ca1.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o B_Ca2_dist.xvg < B_Ca2.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o B_Ca3_dist.xvg < B_Ca3.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o B_Ca4_dist.xvg < B_Ca4.txt &


#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o AB_Ca1_dist.xvg < AB_Ca1.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o AB_Ca2_dist.xvg < AB_Ca2.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o AB_Ca3_dist.xvg < AB_Ca3.txt &
#
#g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o AB_Ca4_dist.xvg < AB_Ca4.txt &
#


rm *.txt &
