#!/bin/bash


while (qstat | grep -q em) 
do

for f in em_*.gro 
do 

	rm ${f%%.*}.{edr,log,trr,tpr,o1*}; 

done

sleep 100

done
