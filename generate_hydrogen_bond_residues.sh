#!/bin/bash

for i in 0A 0B 0C 0D 


do 

echo $i

more $i\_tem | awk '{if($1>=174 && $2<174){print $1,$2}}'  | sort -n | uniq -c

done
