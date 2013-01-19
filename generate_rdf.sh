#!/bin/bash
## written by lina on Sun Jan 20 00:14:33 SGT 2013

for i in `seq -w 1 1 16`

do

	for j in {26..29}
		do
		for k in {26..29}
		
		do
		if [ $j -lt $k ]; then
		echo -e "$j\n$k" > idx$j\_$k.txt
		a=$(($j-25))
		b=$(($k-25))		

		g_rdf -f ../../heme/16_convensionalMD/traj$i/md001.xtc -s ../../heme/16_convensionalMD/traj$i/md001.tpr -n ../../heme/16_convensionalMD/index.ndx -o rdf_$i\_heme$a\_heme$b.xvg -b 50000 -dt 1 -nice -19 < idx$j\_$k.txt & 	
		fi
		done
		done
done
