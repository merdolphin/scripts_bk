#!/bin/bash

sleep 1200

echo "26
28" > s_ab_backbone.txt

for i in {0..108}

do

g_hbond_g_f -f ../cc_$i.xtc -s ../../../nd0010.tpr -n index.ndx -g s_ab_backbone_hbond_$i.log -hbn s_ab_backbonehbond_$i.ndx -num s_ab_backbonehbnum_$i.xvg -nice -19 < s_ab_backbone.txt & 

done
