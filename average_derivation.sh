#!/bin/bash

awk '
BEGIN{	i=0
	a=0
	b=0
	abs=0
     }
{	while(getline < "average")
	aver[i++] = $0
} 
{
	while(getline){
		
		a++
		if(a<25){
			if ($0>=aver[b]){
				abs+=$0-$aver[b]
			}
			if ($0<$i){
				abs+=$aver[b]-$0
			}
		
		}

		if(a>25){
			print abs/25, aver[b]
			abs=0
			a=1
			b+=1
		}
	}

}' $1
 
