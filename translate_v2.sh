#!/bin/sh

for f in *.xpm
do

awk '{if(NF==7) print $1, $6}' $f | tr -d '"' | sed 's/[a-Z]/s\/&\//g' | tr -d ' ' | sed 's/^.*$/& \/g/g' > dict.txt

tail -1 $f | tr -d '"' > lastline.txt

sed -f dict.txt lastline.txt | sed 's/.\(.*\)/\1/' | sed -e 's/[ ]*//' | sort -n -k2 -n -k3 -n -k4 -n -k5 -n -k6 -n -k7 -n -k8 -n -k9 -n -k10 -n -k11 -n -k12 -n -k13 -n -k14 -n -k15 -n -k16 -n -k17 -n -k18 -n -k19 -n -k20 -n -k21 -n -k22 -n -k23 -n -k24 -n -k25 -n -k26 -n -k27 -n -k28 -n -k29 -n -k30 -n -k31 -n -k32 -n -k33 -n -k34 -n -k35 -n -k36 -n -k37 -n -k38 -n -k39 -n -k40 -n -k41 -n -k42 | sed 's/[ ]*//' >> a.out

#echo ${f##*.}
#echo ${f%.*}

done
