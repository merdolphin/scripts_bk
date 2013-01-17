#!/bin/bash
nslices=10
#
source  /usr/local/Modules/3.2.6/init/bash
module load intel-cc/10.1.015  
module load intel-fc/10.1.015 
module load fftw/3.2.2_intel-10.1.015
module load openmpi/1.2.6_intel-10.1.015
source /scratch/tutoXX/1_compiling/gromacs/gromacs-4.0.7/install_dir/bin/GMXRC  
CATDCD="/nfs_home/tutoadmin/PLUMED/catdcd/LINUXAMD64/bin/catdcd4.0/catdcd"
TRJCONV="trjconv_d"
DRIVER="/scratch/tutoXX/1_compiling/plumed/PLUMED-1.2.1/utilities/driver/driver" 
GROMPP="grompp_d"
MDRUN="mdrun_d"
mv COLVAR COLVAR.bak
#
# generate the pdb
#
echo 0 | $TRJCONV -f 2ala_ts.gro -o 2ala.pdb
#
# generate the dcd 
#
$CATDCD  -o traj.dcd -trr traj.trr 
#
# run the driver and get the cv for the cv you are interesetd in 
#
cat >>plumed2.dat<<EOF
PRINT W_STRIDE 1
#
# Phi 
#
TORSION LIST 5 7 9 15   
ENDMETA
EOF
$DRIVER -pdb 2ala.pdb -dcd traj.dcd -ncv 2 -nopbc -plumed plumed2.dat 
#
# now  COLVAR has all the data you need: create the slices 
#
rm -rf indexes_* points
grep -v FIELDS COLVAR | awk 'BEGIN{ii=0;min=100000;max=-100000}{x[ii]=$2;if($2<min){min=$2};if($2>max){max=$2};ii++ }\
END{\
  step=(max-min)/nslices;\
  print min, max, nslices , step, ii;\
  mm=sprintf("points"); \
  for(i=0;i<nslices;i++){\
     printf("%f \n",min+(i+0.5)*step) >>mm ;\
     m1=min+i*step;m2=min+(i+1)*step ;\
     ff=sprintf("indexes_%d",i+1);
     for(j=0;j<ii;j++){\
          if(x[j]>m1 && x[j]<m2 ){
             printf("%d \n",j+1) >>ff
          } 
     }\
  }\
}' nslices=$nslices  
#
# now you have a bunch of indexes and you may  run the MDs  
#
#
# this is very simple... only one md per point. Loop over the slices  
#
for i in `seq 1 $nslices`
do
    nup=0
    nlo=0
    ptval=`head -$i points | tail -1 | awk '{print $1}'`
    npts=`wc -l indexes_$i | awk '{print $1}'`
    echo "XXXXXXXXXXXXXX DOING PT $ptval , NPTS $npts XXXXXXXXXXXX"
    k=0 
    for j in `less indexes_$i `
    do 
      k=$((k+1))
      echo  [ System ] >frames.ndx 
      echo $j >>frames.ndx 
      #
      # extract that frame from the traj 
      #
      rm -rf \#*
      echo  0 | $TRJCONV -f traj.trr -o current.gro -fr frames.ndx &>/dev/null 
      #
      # create a plumed input 
      #
      cat >plumedcom.dat<<EOF
PRINT W_STRIDE 1
#
# Phi 
#
TORSION LIST 5 7 9 15   
STOPWHEN CV 1 MORETHAN  0.8 
STOPWHEN CV 1 LESSTHAN -0.8 
ENDMETA
EOF
    $GROMPP -f md.mdp -c current.gro -p gromacs.top &>/dev/null 
    $MDRUN -plumed plumedcom -o com.trr &>/dev/null 
    upper=`grep KILLING md.log | grep MORE | wc -l `  
    lower=`grep KILLING md.log | grep LESS | wc -l `  
    echo -n "NTRIALS $k OVER $npts "
    if [ "$upper" -gt "0" ]; then
      nup=$((nup+1))
      echo " FOUND UPPER : $nup "
    fi
    if [ "$lower" -gt "0" ]; then
      nlo=$((nlo+1))
      echo "FOUND LOWER : $nlo"
    fi
    done
    prob=`echo $nup $npts | awk '{print $1/$2}'` 
    echo " "
    echo  "COMMITTOR  x= $ptval  comm= $prob "  
done

