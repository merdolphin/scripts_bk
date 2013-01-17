#!/bin/bash
source  /usr/local/Modules/3.2.6/init/bash
module load intel-cc/10.1.015  
module load intel-fc/10.1.015 
module load fftw/3.2.2_intel-10.1.015
module load openmpi/1.2.6_intel-10.1.015
source /scratch/tutoXX/1_compiling/gromacs/gromacs-4.0.7/install_dir/bin/GMXRC 
CATDCD="/nfs_home/tutoadmin/PLUMED/catdcd/LINUXAMD64/bin/catdcd4.0/catdcd"
TRJCONV="trjconv_d"
DRIVER="/scratch/tutoXX/1_compiling/plumed/PLUMED-1.2.1/utilities/driver/driver" 
mv COLVAR COLVAR.bak
#
# generate the pdb
#
echo 0 | $TRJCONV -f 2ala.gro -o 2ala.pdb
#
# generate the dcd 
#
$CATDCD  -o traj.dcd -trr traj.trr 
#
# run the driver
#
$DRIVER -pdb 2ala.pdb -dcd traj.dcd -ncv 2 -nopbc -plumed plumed2.dat 
