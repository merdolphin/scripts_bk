#!/bin/bash

for i in {0..107}

do

trjcat_g_f -f ../../../md039_$i\_sot.xtc ../../../md040_$i\_sot.xtc -cat -o last10_$i.xtc -nice -10 

done
