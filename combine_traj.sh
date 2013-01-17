#!/bin/bash

b=1

e=8

while [ $e -lt 208 ]

do

for i in `seq $b $e`

do

trjcat_g_f -f md001\_$i\_sot.xtc  md002\_$i\_sot.xtc  md003\_$i\_sot.xtc  md004\_$i\_sot.xtc   md005\_$i\_sot.xtc md006\_$i\_sot.xtc md007\_$i\_sot.xtc  md008\_$i\_sot.xtc  md009\_$i\_sot.xtc   md010\_$i\_sot.xtc   md011\_$i\_sot.xtc  md012\_$i\_sot.xtc  md013\_$i\_sot.xtc   md014\_$i\_sot.xtc  md015\_$i\_sot.xtc  md016\_$i\_sot.xtc  md017\_$i\_sot.xtc  -cat -o md\_$i.xtc -nice 0 &


#while ($((ps au | grep sleep | wc -l)) > 9)
#do
#sleep 2
#done  
done

wait

b=$(($b+8))
e=$(($b+8))

done
