#!/bin/bash

echo "13
1" > idx.txt

g_dist_g_f -f ../c_0.xtc -s ../../tpr/md0410.tpr -n ../../index.ndx -dist 0.75 < idx.txt > output

