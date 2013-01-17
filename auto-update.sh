#!/bin/bash

#ctime=$('date +%s')

for i in {1..10}

do

#target_time=$(date -d '04/'$i'/2012/ 18:10' +%s)

rsync -azvu nya:/home/ygmu/share/b1009a/* .

sleep 86400


done
