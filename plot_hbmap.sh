#!/bin/bash

for filename in *.xpm
do
FILENAME=$filename
FILEBASENAME=${FILENAME##*/}
FILEBASENAME=${FILEBASENAME%.*}

#echo $FILEBASENAME

perl plot_hbmap.pl -s system.pdb -map $FILEBASENAME.xpm -index $FILEBASENAME.hbond.ndx

mv summary_HBmap.dat summary_HBmap.$FILEBASENAME.dat
done

