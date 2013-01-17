#!/bin/bash

for i in {30..40}

do

rm $i.txt

for j in {0..107}

do

more $i/A_B_distance/different_temp/dist_$j.xvg | awk '{if ($2<=0.4) print $2}' | wc -l >> $i.txt

done

done

paste 30.txt 31.txt 32.txt 33.txt 34.txt 35.txt 36.txt 37.txt 38.txt 39.txt 40.txt 

rm $i.txt
