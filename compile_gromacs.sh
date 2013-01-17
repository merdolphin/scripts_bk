#!/bin/bash
if [ $# -eq 0 ];
then
 echo "USAGE :"
 echo "./compile.sh (-s/d/mpis/mpid)   "
 echo "  compile gromacs" 
 echo " -d reinstall everything in singleprec and delete all previous configs  "
 echo " -s add mdrun in doubleprec "
 echo " -mpis add mdrun in singleprec mpi"
 echo " -mpid add mdrun in doubleprec mpi"
 echo " "
 echo " "
 exit
fi
#
# set environments
#
source  /usr/local/Modules/3.2.6/init/bash
module load intel-cc/10.1.015
module load fftw/3.2.2_intel-10.1.015
module load openmpi/1.2.6_intel-10.1.015 
mydir=`pwd`
export plumedir="/nfs_home/tutoadmin/PLUMED/plumed-13sep10"
#gver="4.5.1"
gver="4.0.7"
mycc=icc
myld=icc
mycxx=icpc
set -o verbose
fftw=/opt/fftw-3.2.2/intel-10.1.015
case "$1" in
(-d)
rm -rf gromacs-$gver
tar -zxvf gromacs-$gver.tar.gz
cd gromacs-$gver
mkdir $mydir/gromacs-$gver/install_dir
#
# single prec installation
#
./configure LDFLAGS=-L${fftw}/lib CPPFLAGS=-I${fftw}/include --prefix=$mydir/gromacs-${gver}/install_dir CC=$mycc LD=$myld CXX=$mycxx --with-fft=fftw3 --program-suffix=_d --disable-float 
chmod +x $plumedir/patches/plumedpatch_gromacs_${gver}.sh
$plumedir/patches/plumedpatch_gromacs_${gver}.sh -patch 
make 
make install 
cd ..
;;
(-s)
#
# single prec
#
cd gromacs-$gver 
make clean
$plumedir/patches/plumedpatch_gromacs_${gver}.sh -revert
./configure   LDFLAGS=-L${fftw}/lib CPPFLAGS=-I${fftw}/include --prefix=$mydir/gromacs-${gver}/install_dir CC=$mycc LD=$myld CXX=$mycxx  --with-fft=fftw3 --program-suffix=_s 
$plumedir/patches/plumedpatch_gromacs_${gver}.sh -patch
make mdrun
make install-mdrun
#exit
cd ..
;;
(-mpis)
#
# necessary for mpi 
#
#
# workaround for openmpi 32bits
#
cd gromacs-$gver
make clean
$plumedir/patches/plumedpatch_gromacs_${gver}.sh -revert
./configure  LDFLAGS=-L${fftw}/lib CPPFLAGS=-I${fftw}/include --prefix=$mydir/gromacs-$gver/install_dir --enable-mpi  --program-suffix=_mpi --with-fft=fftw3 --program-suffix=_mpis  CC=$mycc LD=$myld CXX=$mycxx   
$plumedir/patches/plumedpatch_gromacs_${gver}.sh -patch 
make mdrun
make install-mdrun
cd ..
;;
(-mpid)
#
#
# necessary for double precision
#
cd gromacs-$gver
make clean
$plumedir/patches/plumedpatch_gromacs_${gver}.sh -revert
./configure  LDFLAGS=-L${fftw}/lib CPPFLAGS=-I${fftw}/include --prefix=$mydir/gromacs-$gver/install_dir --disable-float --with-fft=fftw3 --program-suffix=_mpid  --enable-mpi CC=$mycc LD=$myld CXX=$mycxx  
$plumedir/patches/plumedpatch_gromacs_${gver}.sh  -patch
#exit
make mdrun
make install-mdrun
cd ..
;;
(*)
 echo "USAGE :"
 echo "./compile.sh (-s/d/mpis/mpid)   "
 echo "  compile gromacs" 
 echo "  -d reinstall everything in singleprec and delete all previous configs  "
 echo " -s add mdrun in singleprec "
 echo " -mpis add mdrun in singleprec mpi"
 echo " -mpid add mdrun in doubleprec mpi"
 echo " "
 echo " "
 exit

esac


