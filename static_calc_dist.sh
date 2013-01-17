#!/bin/sh

for f in *.xvg 
do 
	echo -n "$f "
 	more $f  | awk '{if($2<=1) print $2}' | wc -l ; 
done  | awk '{if($2>800) print $0}'

