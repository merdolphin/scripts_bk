#!/bin/bash

echo "27
28" > index.txt

g_dist_g_f -f ../c_0.xtc -s ../../nd0010.tpr -n ../../index.ndx  -nice -19 -o CHC_CHC_dist.xvg < index.txt

rm index.txt
