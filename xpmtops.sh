#!/bin/bash

#for filename in A_chol.xpm  A_dppc.xpm  B_chol.xpm  B_dppc.xpm  C_chol.xpm  C_dppc.xpm

for filename in *.xpm
do
 xpm2ps -f $filename -o $filename.eps
done

## eos
