#BSUB -J b100a9
#BSUB -a intelmpi
#BSUB -n 432

ntcpu=432
nrep=108

exerun=/gpfssan1/home/jzhang/ygmu/gromacs-4.5.4/bin/mdrun_mpi

#
# Make sure I am in the correct directory and execute

 t0=md005
 c=6
 tt=39

 while [ $c -le $tt ]; do

 t=`awk -v c=$c 'BEGIN{printf "md%03d\n",c}'`


 if [ $c -eq 0 ]; then
 cd mdp
 echo "md000" >> ccc
 ./awk_wt_mdp.sh md00.mdp.mod
 cd ..
 fi

 if [ $c -eq 0 ]; then
 cd mdp
 echo "md001" >> ccc
 ./awk_wt_mdp.sh md01.mdp.mod
 cd ..
 fi

if [ $c -gt 6 ]; then
 ./make_tpr.sh ${t0} $t
fi

 echo this is to check if the files are ready
 ls -l > output_list.$c

 mpirun.lsf $exerun -multi $nrep -replex 500  -s ${t} -x ${t}_ -g ${t}_ -c ${t}_

 t0=$t

 let c=c+1
 done

