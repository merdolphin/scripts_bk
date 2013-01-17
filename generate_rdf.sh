#!/bin/bash

echo "27
31" > A.txt

echo "28
32" > B.txt

echo "29
33" > C.txt

echo "30
34" > D.txt

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

echo "31
31" > BCD.txt
echo "32
32" > ACD.txt
echo "33
33" > ABD.txt
echo "34
34" > ABC.txt


#for i in AB AC AD BC BD CD

#for i in A B C D

for i in BCD ACD ABD ABC

do

g_rdf_g_f -f ../md_a_r.xtc -s ../../md_0.tpr -n index.ndx -o rdf_$i.xvg -nice -19 -bin 0.08 < $i.txt  &

#g_mindist_g_f -f ../md_a_r.xtc -s ../../md_0.tpr -n index.ndx -od mind_$i.xvg -on numcount_$i.xvg -o atm-pair_$i.out -dt 100 -nice -19 < $i.txt &

done


