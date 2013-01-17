#!/bin/bash

for i in {0..107}

do 


more dist_$i.xvg | awk '{if ($2 <= 0.4 ) {print $2}} ' | wc -l 


done
