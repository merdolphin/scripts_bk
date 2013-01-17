#!/bin/sh

j=1
a=1
cp nvt.mdp nvt_0.mdp

for i in 305.57  311.22  316.96  322.78  328.69  334.19  340.27  346.45  352.72  359.08  365.54  372.10  378.75  385.50  392.36  399.32  406.38  413.56  420.86  428.26  435.76  443.38  451.11  458.96  466.95  475.04  483.25  491.59  500.05  508.63  517.36  526.21  535.21  544.33  553.61  563.03  572.58  582.28  592.10  602.10
do
cat md.mdp | sed 's/300/'$i'/g' > md_$j.mdp
#cat nvt.mdp | sed 's/300/'$i'/g' > nvt_$j.mdp

#grompp_g_f -f nvt_$j.mdp -c em_10.gro -o nvt_$j.tpr

grompp_g_f -f md_$j.mdp -c nvt_$j.gro -o md_$j.tpr -n index.ndx

#cat md0.sh | sed 's/nvt/nvt_'$j'/g' > m$j.sh

j=$(($j+$a))
 
done

#for i in 0 1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 28 29 33 34 35 36 38 39 40
#do
#qsub m$i.sh
#done
