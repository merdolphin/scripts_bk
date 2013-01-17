EXE="/nfs_home/tutoadmin/PLUMED/PLUMED-1.2.1/utilities/sum_hills/sum_hills"

# plot the profile of each HILLS file every 100 hills, to check parallel growth
# (then you can plot e.g. with "xmgrace hills0-*")
for i in 0 1 2 3
do
  $EXE -file HILLS$i -ndim 1 -ndw 1 -stride 100 -pi 1
  for f in fes.dat*
  do
    mv $f hills$i-$f
  done
done

# plot the profile of each HILLS making a time-average over the last 500 hills
# the resulting profile should be compared with files EQUIL_FES0,1,2,3
# (obtained from 3 microsec of equilibrium MD)
for i in 0 1 2 3
do
  $EXE -file HILLS$i -ndim 1 -ndw 1 -pi 1 -aver 500
  mv fes.dat aver-hills$i
done
