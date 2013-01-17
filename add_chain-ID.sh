#!/bin/sh

awk '{
	if ($1 != "ATOM" )
		print $0
	else
	printf("ATOM  %5d%4s%5s C%4d    %8.3f%8.3f%8.3f%6.2f%6.2f%12s \n",$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)

}' $1
