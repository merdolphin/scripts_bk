#!/bin/sh

echo "27
28" > AB.txt
echo "27
29" > AC.txt
echo "27
30" > AD.txt
echo "28
29" > BC.txt
echo "28
30" > BD.txt
echo "29
30" > CD.txt

g_dist_g_f -f ../md_a.xtc -s ../../md_0.tpr -n ../../index.ndx  -nice 19 -o dist_AB.xvg < AB.txt &

g_dist_g_f -f ../md_a.xtc -s ../../md_0.tpr -n ../../index.ndx  -nice 19 -o dist_AC.xvg < AC.txt &

g_dist_g_f -f ../md_a.xtc -s ../../md_0.tpr -n ../../index.ndx  -nice 19 -o dist_AD.xvg < AD.txt &

g_dist_g_f -f ../md_a.xtc -s ../../md_0.tpr -n ../../index.ndx  -nice 19 -o dist_BC.xvg < BC.txt &

g_dist_g_f -f ../md_a.xtc -s ../../md_0.tpr -n ../../index.ndx  -nice 19 -o dist_BD.xvg < BD.txt &

g_dist_g_f -f ../md_a.xtc -s ../../md_0.tpr -n ../../index.ndx  -nice 19 -o dist_CD.xvg < CD.txt &

