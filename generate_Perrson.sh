#!/bin/bash


for i in {B..U}
do
for j in {B..U}
do
echo -n "=PEARSON($i 2:$i 43,$j 2:$j 43) " | sed 's/ 2/2/g;s/ 4/4/g';
done
echo 
done
 
