#!/bin/bash

for i in {1..107}

do

trjcat_g_f -f ../../md031\_$i\_sot.xtc  ../../md032\_$i\_sot.xtc  ../../md033\_$i\_sot.xtc  ../../md034\_$i\_sot.xtc  ../../md035\_$i\_sot.xtc  ../../md036\_$i\_sot.xtc  ../../md037\_$i\_sot.xtc  ../../md038\_$i\_sot.xtc  ../../md039\_$i\_sot.xtc  ../../md040\_$i\_sot.xtc   -cat -nice -15 -o c_$i.xtc &

done
