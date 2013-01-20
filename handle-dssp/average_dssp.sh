#!/bin/bash


awk '
BEGIN{sumB=0;sumA=0}
{	c=1;
	while(getline){
		if(c<=2500){
			c++
			sumB+=$1
            sumA+=$2
		}
		if(c>2500){
			printf("%.2f %.2f\n", sumB/2500,sumA/2500)
			sumA=0
            sumB=0
			c=1
            
		}
	}
}' $1
