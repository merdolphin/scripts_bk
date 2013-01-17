#!/bin/bash

## written by lina
## last major modification on 2011/05/09

## ./value.sh 

awk '{
	if(NF==7)
	print $0
	}' $1 > dict 


##cat ../try.xpm > xpmfile
awk '{
	split($1,a,"\"")
	split($6,b,"\"")
	printf("s\/%c\/%1.4f\/g\n",a[2],b[2])
	}' dict > dict_sedscript

# 	print a[2], b[2]

#declare -a translate
#while read -r line
#do
#	translate+=("$line")

#	echo ${Unix[0]}
#	echo ${#translate[@]}
#done < dict
#for ((i=0; i < ${#Unix[100]}; i++))
#do
 #   echo "${Unix[i]}"
#done

#tail -n 81 xpmfile > processedmatrix

awk '{
	if(NF==1)
	print $0
	}' $1 > processedmatrix

awk '{
	split($1,a,"\"")
	print a[2]
	}' processedmatrix > matrixdata

cat matrixdata | sed 's/[a-Z]/& /g' > matrix

sed -f dict_sedscript <matrix > numericalmatrix


## eos
