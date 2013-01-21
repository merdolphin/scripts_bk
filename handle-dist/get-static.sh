#!/bin/bash

for i in {1..42}
do


	more dist_traj*_ri$i\_* |  awk '{if(NF==5 && $2<=0.5){print $2}}' | wc -l 
	more dist_traj*_ri$(($i+42))\_* |  awk '{if(NF==5 && $2<=0.5){print $2}}' | wc -l
done
