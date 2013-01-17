#!/bin/bash
#
#PBS -N cellulose
#PBS -j eo
#PBS -V
#PBS -l nodes=32:ppn=8
#PBS -l walltime=450:00:00

## Join the standard error and the standard output into 1 file output
cd $PBS_O_WORKDIR

## /usr/local/openmpi/bin/mpirun -machinefile $PBS_NODEFILE ./myprog


ncpu=256
mpi=/usr/local/openmpi/bin/mpirun

exegro=/home/ygmu/share/gromacs-4.5.4/bin/grompp_454s
exerun=/home/ygmu/share/gromacs-4.5.4/bin/mdrun_454

#
# Make sure I am in the correct directory and execute

type=prep/p1

cp $PBS_NODEFILE .

t0=md017
c=18
tt=20

while [ $c -le $tt ]; do

t=`awk -v c=$c 'BEGIN{printf "md%03d\n",c}'`

./make_tpr.sh $t0 $t

rm mdout.mdp \#*

$mpi -np $ncpu  -machinefile $PBS_NODEFILE  $exerun -multi 64 -replex 500 -s $t -x ${t}_ -g ${t}_ -c ${t}_  -e ${t}_

rm mdout* 

./cal_rms.sh $c $c

t0=$t
let c=c+1

done
