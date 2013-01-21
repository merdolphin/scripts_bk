#!/bin/bash


#for k in {31..114}

for k in {26..29}
do
	for j in {26..29}
	do
	
	if [ $k -lt $j ]; then

		echo "$k
$j" > idx$k\_$j.txt

		for i in `seq -w 1 1 16`

		do
		a=$(($k-25))
		b=$(($j-25))
		g_dist -f ../../heme/16_convensionalMD/traj$i/md001.xtc -s ../../heme/16_convensionalMD/traj$i/md001.tpr -n ../../heme/16_convensionalMD/index.ndx  -o dist_traj$i\_heme$a\_heme\_$b.xvg -nice -18 -b 50000 -dt 1 < idx$k\_$j.txt &

		done
	fi
	done
done
