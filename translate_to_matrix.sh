#!/bin/sh

for f in *.xpm

do

more $f | awk '{if(NF==7) print $0}' | grep -v axis | awk '{print $1, $6 }' | sed 's/^"/s\//g' | sed 's/ "/\//g' | sed 's/"/ \/g/g' > sed_dictionary 

more $f | awk '{if(NF==1) print $0}' | sed -f sed_dictionary | tr -d '"' | tr -d "," | sed 's/^ //g' > ${f%.*}.dat

done
