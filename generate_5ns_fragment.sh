#!/bin/bash

for i in {30..39}

#for i in 30
do 

#rm -r $i

#mkdir $i

cd $i 
rm -r A_B_distance
mkdir A_B_distance  
#continous_traj  PDBsGROs

#cd PDBsGROs

#demux.pl ../../../md0$i\_0.log 

#cd ../continous_traj

#trjcat_g_f -f ../../../md0$i\_0\_sot.xtc  ../../../md0$i\_1\_sot.xtc  ../../../md0$i\_2\_sot.xtc  ../../../md0$i\_3\_sot.xtc  ../../../md0$i\_4\_sot.xtc  ../../../md0$i\_5\_sot.xtc  ../../../md0$i\_6\_sot.xtc  ../../../md0$i\_7\_sot.xtc  ../../../md0$i\_8\_sot.xtc  ../../../md0$i\_9\_sot.xtc  ../../../md0$i\_10\_sot.xtc  ../../../md0$i\_11\_sot.xtc  ../../../md0$i\_12\_sot.xtc  ../../../md0$i\_13\_sot.xtc  ../../../md0$i\_14\_sot.xtc  ../../../md0$i\_15\_sot.xtc  ../../../md0$i\_16\_sot.xtc  ../../../md0$i\_17\_sot.xtc  ../../../md0$i\_18\_sot.xtc  ../../../md0$i\_19\_sot.xtc  ../../../md0$i\_20\_sot.xtc  ../../../md0$i\_21\_sot.xtc  ../../../md0$i\_22\_sot.xtc  ../../../md0$i\_23\_sot.xtc  ../../../md0$i\_24\_sot.xtc  ../../../md0$i\_25\_sot.xtc  ../../../md0$i\_26\_sot.xtc  ../../../md0$i\_27\_sot.xtc  ../../../md0$i\_28\_sot.xtc  ../../../md0$i\_29\_sot.xtc  ../../../md0$i\_30\_sot.xtc  ../../../md0$i\_31\_sot.xtc  ../../../md0$i\_32\_sot.xtc  ../../../md0$i\_33\_sot.xtc  ../../../md0$i\_34\_sot.xtc  ../../../md0$i\_35\_sot.xtc  ../../../md0$i\_36\_sot.xtc  ../../../md0$i\_37\_sot.xtc  ../../../md0$i\_38\_sot.xtc  ../../../md0$i\_39\_sot.xtc  ../../../md0$i\_40\_sot.xtc  ../../../md0$i\_41\_sot.xtc  ../../../md0$i\_42\_sot.xtc  ../../../md0$i\_43\_sot.xtc  ../../../md0$i\_44\_sot.xtc  ../../../md0$i\_45\_sot.xtc  ../../../md0$i\_46\_sot.xtc  ../../../md0$i\_47\_sot.xtc  ../../../md0$i\_48\_sot.xtc  ../../../md0$i\_49\_sot.xtc  ../../../md0$i\_50\_sot.xtc  ../../../md0$i\_51\_sot.xtc  ../../../md0$i\_52\_sot.xtc  ../../../md0$i\_53\_sot.xtc  ../../../md0$i\_54\_sot.xtc  ../../../md0$i\_55\_sot.xtc  ../../../md0$i\_56\_sot.xtc  ../../../md0$i\_57\_sot.xtc  ../../../md0$i\_58\_sot.xtc  ../../../md0$i\_59\_sot.xtc  ../../../md0$i\_60\_sot.xtc  ../../../md0$i\_61\_sot.xtc  ../../../md0$i\_62\_sot.xtc  ../../../md0$i\_63\_sot.xtc  ../../../md0$i\_64\_sot.xtc  ../../../md0$i\_65\_sot.xtc  ../../../md0$i\_66\_sot.xtc  ../../../md0$i\_67\_sot.xtc  ../../../md0$i\_68\_sot.xtc  ../../../md0$i\_69\_sot.xtc  ../../../md0$i\_70\_sot.xtc  ../../../md0$i\_71\_sot.xtc  ../../../md0$i\_72\_sot.xtc  ../../../md0$i\_73\_sot.xtc  ../../../md0$i\_74\_sot.xtc  ../../../md0$i\_75\_sot.xtc  ../../../md0$i\_76\_sot.xtc  ../../../md0$i\_77\_sot.xtc  ../../../md0$i\_78\_sot.xtc  ../../../md0$i\_79\_sot.xtc  ../../../md0$i\_80\_sot.xtc  ../../../md0$i\_81\_sot.xtc  ../../../md0$i\_82\_sot.xtc  ../../../md0$i\_83\_sot.xtc  ../../../md0$i\_84\_sot.xtc  ../../../md0$i\_85\_sot.xtc  ../../../md0$i\_86\_sot.xtc  ../../../md0$i\_87\_sot.xtc  ../../../md0$i\_88\_sot.xtc  ../../../md0$i\_89\_sot.xtc  ../../../md0$i\_90\_sot.xtc  ../../../md0$i\_91\_sot.xtc  ../../../md0$i\_92\_sot.xtc  ../../../md0$i\_93\_sot.xtc  ../../../md0$i\_94\_sot.xtc  ../../../md0$i\_95\_sot.xtc  ../../../md0$i\_96\_sot.xtc  ../../../md0$i\_97\_sot.xtc  ../../../md0$i\_98\_sot.xtc  ../../../md0$i\_99\_sot.xtc  ../../../md0$i\_100\_sot.xtc  ../../../md0$i\_101\_sot.xtc  ../../../md0$i\_102\_sot.xtc  ../../../md0$i\_103\_sot.xtc  ../../../md0$i\_104\_sot.xtc  ../../../md0$i\_105\_sot.xtc  ../../../md0$i\_106\_sot.xtc  ../../../md0$i\_107\_sot.xtc  -nice -10 -demux ../PDBsGROs/replica_index.xvg 

#cp ../../PDBsGROs/index.ndx . 
#cp ../../PDBsGROs/nd0010.tpr .

cd A_B_distance/

echo "20
21" > idx.txt

mkdir continous_replica  different_temp


for j in {0..107}

do

#g_dist_g_f -f ../continous_traj/$i\_trajout.xtc -s ../continous_traj/nd0010.tpr -n ../continous_traj/index.ndx -nice -10 -o dist_$i.xvg < idx.txt

g_dist_g_f -f ../../../md0$i\_$j\_sot.xtc -s ../continous_traj/nd0010.tpr -n ../continous_traj/index.ndx -nice -10 -o dist_$j.xvg < idx.txt


done

mv dist*.xvg different_temp


for j in {0..107}

do
g_dist_g_f -f ../continous_traj/$j\_trajout.xtc -s ../continous_traj/nd0010.tpr -n ../continous_traj/index.ndx -nice -10 -o dist_$j.xvg < idx.txt

done

mv dist*.xvg continous_replica 


cd ../../

done
