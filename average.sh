#!/bin/bash

## Usage ./average filename
awk '
BEGIN{a=1; b=25}
{	c=1;
	while(getline){
		if(c<=25){
			c++
			sum+=$0
		}
		if(c>25){
			print sum/25
			sum=0
			c=1
		}
	}
}' $1
