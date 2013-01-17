#!/bin/bash
## translate the xpm file into a numerical matrix

## written by lina
## last major modification on 2011/05/07

echo "Enter the file name"

cat dummy.txt > xpmdata

cat xpmdata | tr "\n"

#xpmdata_array=('cat xpmfile | tr "\\", "\n"')

#print xpmdata_array

#for x in "${xpmdata_array[@]}"
#do
#	echo "> [$x]"
#done
