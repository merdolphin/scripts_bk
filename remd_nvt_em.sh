#!/bin/sh


for i in $(seq 40)


do


grompp_g_f -f minim.mdp -c nvt_emm_0.gro -o nvt_em_0.tpr
grompp_g_f -f minim.mdp -c nvt_emm_$i.gro -o nvt_em_$i.tpr


cat md0.sh | sed 's/nvt/nvt_em_'$i'/g' > m$i.sh

 
done

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30   
do
qsub m$i.sh
sleep 1
done

for i in 31 32 33 34 35 36 37 38 39 40
do 
qsub -q chiku m$i.sh
done

