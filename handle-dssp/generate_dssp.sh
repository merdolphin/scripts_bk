#!/bin/bash


echo "1
1" > idx.txt

for i in `seq -w 1 1 16`

do
	do_dssp -f ../../heme/16_convensionalMD/traj$i/md001.xtc -s ../../heme/16_convensionalMD/traj$i/md001.tpr -o full_ss_$i.xpm -sc full_scount_$i.xvg -ver 1 -dt 1 -nice -18  < idx.txt &


	#g_mdmat -f ../../heme/16_convensionalMD/traj$i/md001.xtc -s ../../heme/16_convensionalMD/traj$i/md001.tpr -n ../../heme/16_convensionalMD/index.ndx  -mean dm_$i.xpm -nice -19 -b 50000 -dt 1 < idx.txt &

done
