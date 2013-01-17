#!/bin/bash

rm all_replica_index.xvg all_replica_temp.xvg

for i in 5 6 10 11 12 14 16 20 22 23 24 26 27 29 30 31 32 33 36 38 40 43 45 46 52 61 65 67 70

do
demux.pl md0$i\_0.log 

cat replica_index.xvg >> all_replica_index.xvg 
cat replica_temp.xvg >> all_replica_temp.xvg

done

./replica_index.pl all_replica_index.xvg >  new_replica_index.xvg

./replica_index.pl all_replica_temp.xvg > new_replica_temp.xvg

#rm all_rep*

