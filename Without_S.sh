#!/bin/bash

 a=0; 
for f in *.gro

do  sed '3,2832d' $f  | sed 's/3272/442/g' > new_$a.gro; 
a=$((a+1)) ; 
done
