#!/bin/bash
#
# load the needed environment
#
# let know this shell to use modules 
source  /usr/local/Modules/3.2.6/init/bash
# load the modules
module load intel-cc/10.1.015  
module load fftw/3.2.2_intel-10.1.015
source /scratch/tutoXX/1_compiling/gromacs/gromacs-4.0.7/install_dir/bin/GMXRC 
#
# do the grompp 
# (if you want to change MD parameters (timesteps, etc...), edit grompp.mdp)
#
grompp_d 

#
# run 
#
mdrun_d -plumed plumed > output
