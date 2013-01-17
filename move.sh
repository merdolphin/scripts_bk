#/bin/bash

for i  in {0..64}

do

mv md010_$i.{xtc,log,tpr} successed_finished_one
mv md013_$i.{xtc,log,tpr} successed_finished_one
mv md014_$i.{xtc,log,tpr} successed_finished_one
mv md04_$i.{xtc,log,tpr} successed_finished_one
mv md06_$i.{xtc,log,tpr} successed_finished_one
mv md07_$i.{xtc,log,tpr} successed_finished_one
mv md08_$i.{xtc,log,tpr} successed_finished_one

done
