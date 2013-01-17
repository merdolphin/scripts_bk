#BSUB -J trirna_eq
#BSUB -a intelmpi
#BSUB -n 16

ntcpu=16
nrep=88

exerun=/gpfssan1/home/jzhang/ygmu/gromacs-4.5.4/bin/mdrun_mpi

#
# Make sure I am in the correct directory and execute

 t0=eq01
 c=1
 tt=1

 while [ $c -le $tt ]; do

 t=`awk -v c=$c 'BEGIN{printf "md%03d\n",c}'`
 t=eq01


 if [ $c -eq 0 ]; then
 cd mdp
 echo "md000" >> ccc
 ./awk_wt_mdp.sh md00.mdp.mod
 cd ..
 fi

 if [ $c -eq 2 ]; then
 cd mdp
 echo "md001" >> ccc
 ./awk_wt_mdp.sh md01.mdp.mod
 cd ..
 fi

if [ $c -gt 1 ]; then
 ./make_tpr.sh ${t0} $t
fi

 echo this is to check if the files are ready
 ls -l > output_list.$c

 mpirun.lsf $exerun -deffnm $t
 
## -multi $nrep -replex 500  -s ${t} -x ${t}_ -g ${t}_ -c ${t}_

 t0=$t

 let c=c+1
 done

