#!/bin/bash
#PBS -N nvt
#PBS -M zhao0139@e.ntu.edu.sg
#PBS -j oe
#PBS -V

#PBS -l nodes=2:ppn=4

## pre-processing script
cd $PBS_O_WORKDIR
NCPUS=`cat $PBS_NODEFILE | wc -l`
echo $NCPUS

# ###########################################
# PATH for Intel Compiler and OpenMPI
# ############################################
export PATH=/opt/intel/composerxe-2011.2.137/bin/intel64:/usr/local/mpi/intel/bin:/usr/local/fftw/bin:/usr/local/gromacs/bin:${PATH}

export LD_LIBRARY_PATH=/usr/local/fftw/lib:/opt/intel/composerxe-2011.2.137/mkl/lib/intel64:/opt/intel/lib/intel64:/usr/local/mpi/intel/lib:${LD_LIBRARY_PATH}

# ################################
# commands to launch OpenMPI jobs
# ################################
/usr/local/mpi/intel/bin/mpirun -np $NCPUS -machinefile $PBS_NODEFILE mdrun_g_f -v -deffnm nvt -pd -dlb yes
#-append -dd 0 0 0 -dlb yes

# #############################
# PATH for GNU Compiler and OpenMPI
# ##############################
# export PATH=/usr/local/mpi/gnu/bin:/usr/local/fftw/bin:/usr/local/gromacs/bin:${PATH}
# export LD_LIBRARY_PATH=/usr/local/fftw/lib:/usr/lib64:${LD_LIBRARY_PATH}

# ##############################
# Using GNU Compiler and OpenMPI
# ##############################
#/usr/local/mpi/gnu/bin/mpirun -np $NCPUS -machinefile $PBS_NODEFILE /usr/local/bin/mdrun -deffnm

# #########################################
# Optional LD_LIBRARY_PATH if not using MKL
# #########################################
# export LD_LIBRARY_PATH=/usr/local/atlas/lib:${LD_LIBRARY_PATH}
# export LD_LIBRARY_PATH=/usr/local/blacs/lib:${LD_LIBRARY_PATH}
# export LD_LIBRARY_PATH=/usr/local/lapack/lib:${LD_LIBRARY_PATH}
# export LD_LIBRARY_PATH=/usr/local/salapack/lib:${LD_LIBRARY_PATH}

