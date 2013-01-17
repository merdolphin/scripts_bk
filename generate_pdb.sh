#!/bin/sh

echo "22" > tex

for i in {31..37}

do

./pbc_xtc_ctn_ng ../../md0$i\_0\_sot.xtc new\_md0$i\_0.xtc 2831 3272 2831

trjconv_g_f -f new\_md0$i\_0.xtc -s nd0010.tpr -o new\_md0$i\_0.pdb -dt 100 -nice -11 -n ../PDBsGROs/index.ndx  < tex

done


scp -p new_md0{31..37}_0.pdb lina@172.21.50.136:/scratch/lina/gmxMD/b100a9/analysis/last_50ns/dpca 
