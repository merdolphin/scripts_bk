#!/bin/bash
t0=$1
tt=$2
##exe=/ftpdir/gromacs-4.5.4/bin/grompp_454s
##exe=/opt/gromacs-4.5.4-mkl/bin/grompp_mpi
exe=/home/ygmu/share/gromacs-4.5.4/bin/grompp_454s

##dir=../prep_protein

#type=$dir/system

c=0;
read d < Nnode.sh
read node1 < Nnode.sh

while [ $c -lt $d ]; do
$exe \
 -f md$c.mdp -p abeta.top -c ${t0}_$c.gro -o ${tt}$c.tpr \
 -n index.ndx >  /dev/null

rm mdout.mdp

let c=c+1
done

