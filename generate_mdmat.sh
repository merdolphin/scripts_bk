#!/bin/bash


echo "30
30" > idx.txt

for i in `seq -w 1 1 16`

do
	g_mdmat -f ../../heme/16_convensionalMD/traj$i/md001.xtc -s ../../heme/16_convensionalMD/traj$i/md001.tpr -n ../../heme/16_convensionalMD/index.ndx  -mean dm_$i.xpm -nice -19 -b 50000 -dt 1 < idx.txt &

done
