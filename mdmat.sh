#!/bin/bash

for i in 0 400000 8000000 860000 920000 980000
do
	echo 29 > group.txt
	g_mdmat_g_d -f protein_$i.pdb -s protein_$i.pdb -n index.ndx -mean AB_$i.xpm < group.txt
	xpm2ps_g_d -f AB_$i.xpm -o AB_$i.eps
	echo 31 > group.txt
        g_mdmat_g_d -f protein_$i.pdb -s protein_$i.pdb -n index.ndx -mean BC_$i.xpm < group.txt
	xpm2ps_g_d -f BC_$i.xpm -o BC_$i.eps
	echo 32 > group.txt
        g_mdmat_g_d -f protein_$i.pdb -s protein_$i.pdb -n index.ndx -mean ABC_$i.xpm < group.txt
	xpm2ps_g_d -f ABC_$i.xpm -o ABC_$i.eps
done
