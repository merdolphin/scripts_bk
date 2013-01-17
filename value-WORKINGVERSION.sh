#!/bin/bash
## This script used to translate the .xpm file into numerical matrix.
## written by lina
## last major modification on 2011/05/09

## ./value.sh filename

awk '{
	if(NF==7)
	print $0
	}' $1 > dict 

awk '{
	if(NF==1)
	print $0
	}' $1 > processedmatrix


awk '{
	split($1,a,"\"")
	split($6,b,"\"")
	printf("s\/%c\/%1.4f\/g\n",a[2],b[2])
	}' dict > dict_sedscript

awk '{
	split($1,a,"\"")
	print a[2]
	}' processedmatrix > matrixdata

cat matrixdata | sed 's/[a-Z]/& /g' > matrix

sed -f dict_sedscript <matrix > numericalmatrix

rm dict  processedmatrix dict_sedscript matrixdata matrix
## eos
