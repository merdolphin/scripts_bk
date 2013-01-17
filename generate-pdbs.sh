#!/bin/bash

echo "1" > idx.txt

for i in {1..40}

do

trjconv_g_f -f new_$i.xtc -s nd0010.tpr -o new_$i.pdb -nice -19 -dt 10 < idx.txt  &

done
