#!/bin/bash

 source  /usr/local/Modules/3.2.6/init/bash
 module load intel-fc/10.1.015

 rm fes.dat.* 1>/dev/null 2>/dev/null
 mv diff_t diff_t.old
 ss=$1
 hills_file=$2
 T=$3
 kt=`echo "${T} * 2.478 / 298" | bc -l`

 /nfs_home/tutoadmin/PLUMED/PLUMED-1.2.1/utilities/sum_hills/sum_hills -stride ${ss} -ndim 1 -ndw 1 -pi 1 -kt ${kt} -file ${hills_file}

 for file in fes.dat.? fes.dat.?? fes.dat.??? fes.dat.????
 do

  if [ -f ${file} ]
  then
    A=`awk 'BEGIN{tot=0}{if(NF==2 && $1>-3.0 && $1<-2.0)  tot=tot+exp(-$2/kt)}END{print -kt*log(tot)}' kt=${kt} ${file}`
    B=`awk 'BEGIN{tot=0}{if(NF==2 && $1>0.5  && $1<1.0)   tot=tot+exp(-$2/kt)}END{print -kt*log(tot)}' kt=${kt} ${file}`
    delta=`echo "${A} - ${B}" | bc -l`
    echo $delta >> diff_t
    echo "Extracting from file :: ${file}"  
  fi

 done
