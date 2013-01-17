#!/bin/bash


#my_dssp_full -f ../PDBsGROs/md_0.xtc -s ../PDBsGROs/md024_0.gro -n ../../index.ndx  -full md_0_full.dat -sc md_0_sc.xvg -br md_0_br.dat -dt 1 

my_dssp_full -f ../PDBsGROs/md_0.xtc -s ../PDBsGROs/md024_0.gro -n ../../index.ndx  -full ABS_0_full.dat -sc ABS_0_sc.xvg -br ABS_0_br.dat -dt 10
