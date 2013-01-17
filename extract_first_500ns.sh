#!/bin/bash

for i in 4
do

trjconv_g_f -f md500_$i.xtc -o md_$i.xtc -b 0 -e 500000 -nice -10 

done
