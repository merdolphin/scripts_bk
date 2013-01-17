#!/bin/bash
#PBS -N Bdna
#PBS -M zhao0139@e.ntu.edu.sg
#PBS -j oe
#PBS -V

#PBS -l nodes=4:ppn=8

## pre-processing script
cd $PBS_O_WORKDIR
NCPUS=`cat $PBS_NODEFILE | wc -l`
echo $NCPUS

export PATH=/opt/intel/composerxe-2011.2.137/bin/intel64:/usr/local/mpi/intel/bin:/usr/local/fftw/bin:/usr/local/gromacs/bin:${PATH}

export LD_LIBRARY_PATH=/usr/local/fftw/lib:/opt/intel/composerxe-2011.2.137/mkl/lib/intel64:/opt/intel/lib/intel64:/usr/local/mpi/intel/lib:${LD_LIBRARY_PATH}

for i in {1..50}

do



/usr/local/mpi/intel/bin/mpirun -np $NCPUS -machinefile $PBS_NODEFILE namd2 4abeta_Bdna_md.namd

done	

