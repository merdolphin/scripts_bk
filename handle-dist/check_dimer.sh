#!/bin/bash
## written by lina on Mon Jan 21 23:37:56 SGT 2013
## I don't like this world very much, just let others do. -- L. N.
## I am very disappointed. -- L. N. 


for i in `seq -w 1 1 16`

do

	for j in {1..4}
	do
		for k in {1..4}
		do
		if [ $j -lt $k ]; then
		
		if [ `more dist_traj$i\_heme$j\_heme\_$k.xvg  | awk '{if(NF==5 && $2<0.5){print $2}}' | wc -l` -gt 5 ]; then
		echo traj$i\_heme$j\_heme\_$k
		fi
		fi
		done
	done
done
