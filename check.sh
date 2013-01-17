#!/bin/bash

EMAIL=zhao0139@e.ntu.edu.sg

FILE=output/4abeta_Bdna-md.xst

filetime=`stat -c %Y $FILE`

currtime=`date +%s`

difference=$(($currtime-$filetime))

for i in {1..20}
do

JOBID=`qstat | grep namd_Bdna_md | awk '{print $1}'`

until [ $difference -gt 3600 ]; do

    sleep 600
    #echo "I am sleeping ..."
    filetime=`stat -c %Y $FILE`
    currtime=`date +%s`
    difference=$(($currtime-$filetime))
done

qsub -q iwarp namd_run.sh 

qdel $JOBID

echo "It comes the ${i}th of 20 report" | mail -s "Time to check your job" $EMAIL

sleep 100

    filetime=`stat -c %Y $FILE`
    currtime=`date +%s`

    difference=$(($currtime-$filetime))
done
