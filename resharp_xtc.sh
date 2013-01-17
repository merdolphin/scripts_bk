#!/bin/sh

#for i in {0..8}

for i in  {2..9}

do

pbc_xtc_ctn_ng ../../md00${i}_0_sot.xtc new_$i.xtc 1 5001 1 & 

done

#./generate_PDBs.sh
