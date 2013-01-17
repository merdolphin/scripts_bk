#!/bin/bash

TRANSLATEFILENAME=confout.pdb
INDEXFILENAME=dummy.atomID

DATA=$(cat dummy.atomID)

for data in $DATA
do
	echo $data
done
awk '{
	if(NF==10&& $4!="SOL")
	printf("s\/%d\/%d%s\/g\n",$2,$5,$4)
	I}' $TRANSLATEFILENAME > dict_sedscript

awk '{
	while(getline > 0){
	grep $0 'dict_sedscript'
	sed -f dict_sedscript < $0 
	print $0 
	}
	}' dummy.atomID
#sed -f dict_sedscript <dummy.atomID > newdata
