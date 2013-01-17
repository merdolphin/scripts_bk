#!/bin/sh

awk '{
	while( getline > 0)
		if(NF!=10)
			print $0	
		else if($2<=403)
			print $0
		else if($2>403 && $2<=806){
			$5=$5+42
			printf("ATOM  %5d%4s%5s%6d    %8.3f%8.3f%8.3f%6.2f%6.2f \n",$2,$3,$4,$5,$6,$7,$8,$9,$10)}
		else {
			$5=$5+84
			printf("ATOM  %5d%4s%5s%6d    %8.3f%8.3f%8.3f%6.2f%6.2f \n",$2,$3,$4,$5,$6,$7,$8,$9,$10)}
}' $1
