#!/bin/bash

for k in {0..107} 

do 

trjcat_g_f -f  c12\_$k.xtc c13\_$k.xtc c14\_$k.xtc c15\_$k.xtc c16\_$k.xtc c17\_$k.xtc c18\_$k.xtc c19\_$k.xtc c20\_$k.xtc c21\_$k.xtc c22\_$k.xtc c23\_$k.xtc c24\_$k.xtc c25\_$k.xtc c26\_$k.xtc c27\_$k.xtc c28\_$k.xtc c29\_$k.xtc  c30\_$k.xtc  c31\_$k.xtc  c32\_$k.xtc  c33\_$k.xtc  c34\_$k.xtc  c35\_$k.xtc  c36\_$k.xtc  c37\_$k.xtc  c38\_$k.xtc c39\_$k.xtc c40\_$k.xtc -cat -o cc_$k.xtc -nice -19 &  

done
