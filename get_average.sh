#!/bin/bash

for i in {1..168}

do
echo -n -e "$i\t"
tail -n 21 $i\_bilayer.xvg   | awk '{print $2}' | awk '{a=1; while (getline) a+=$1 ; print(a/21)}' 

done
