#!/bin/bash

seq 0 10

#trjcat_g_f -f md001\_$i\_sot.xtc md002\_$i\_sot.xtc md003\_$i\_sot.xtc md004\_$i\_sot.xtc -cat -o md\_$i.xtc -nice 0

#while ($((ps au | grep sleep | wc -l)) > 9)
#do
#sleep 2
#done  

done
