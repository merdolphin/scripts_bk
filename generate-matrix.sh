#!/bin/bash
## This script used to generate a series of numerica matrix.
## written by lina
## last major modification on 2011/05/09

## ./generate-matrix.sh

for filename in Mo*.xpm
do
	basename $filename .xpm 
	./value-WORKINGVERSION.sh $filename
	mv numericalmatrix numericalmatrix.$filename
done

## eos
