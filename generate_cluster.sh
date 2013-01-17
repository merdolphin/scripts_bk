#!/bin/bash

for i in 0 
do

echo "22
22" > idx.txt

g_cluster_g_f -f ../c_$i.xtc -s ../../PDBsGROs/nd0010.tpr -n ../../PDBsGROs/index.ndx -o rmsd-cluster.xpm -g cluster_$i.log -dist rmsd_dist_$i.xvg -ev rmsd_eig.xvg -sz clust-size.xvg -tr clust-trans_$i.xpm -clid clust-id_$i.xvg -cl cluster_$i.pdb -method gromos -cutoff 0.2 -nice -10 -dt 10 < idx.txt

rm idx.txt

done
