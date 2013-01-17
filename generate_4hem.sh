#!/bin/bash

n=0
for i in 1 2 3
do
	for j in 2 3 4
	do 
		for k in {5..7}
		do
			for m in {8..13}
			do
			if [[ $i != $j ]]; then
				cat 2app.gro > 2app4hem_$n.gro
				awk '{if(NF==6) print $0}' hem_$i.gro >> 2app4hem_$n.gro
				awk '{if(NF==6) print $0}' hem_$j.gro >> 2app4hem_$n.gro
				awk '{if(NF==6) print $0}' hem_$k.gro >> 2app4hem_$n.gro
				awk '{if(NF==6) print $0}' hem_$m.gro >> 2app4hem_$n.gro
				

				tail -1 hem_1.gro >>  2app4hem_$n.gro
			n=$(($n+1))
					
			fi
			done
		done
	done
done


