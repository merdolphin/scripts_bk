#!/bin/bash


#for i in 4 6 7 8 10 13 14 23 30 31 32 33 36 38 40 43 45 46 52 61 65 67 70

for i in {10..40}

do
demux.pl ../../md0$i\_0.log 

mv replica_index.xvg replica_index_$i.xvg

done

cp replica_index_1.xvg new_replica_index_1.xvg

a=1

for i in {11..40}

do

b=$i

cat renumber_v3.py | sed 's/replica_index_4.xvg/replica_index_'$a'.xvg/g' | sed 's/replica_index_6.xvg/replica_index_'$b'.xvg/g' > tem_renumber_$i.py
chmod +x tem_renumber_$i.py
./tem_renumber_$i.py | sed '/^$/d' > new_replica_index_$i.xvg
a=$i
done

for i in {10..40} 

do

trjcat_g_f -f ../../md0$i\_0\_sot.xtc  ../../md0$i\_1\_sot.xtc  ../../md0$i\_2\_sot.xtc  ../../md0$i\_3\_sot.xtc  ../../md0$i\_4\_sot.xtc  ../../md0$i\_5\_sot.xtc  ../../md0$i\_6\_sot.xtc  ../../md0$i\_7\_sot.xtc  ../../md0$i\_8\_sot.xtc  ../../md0$i\_9\_sot.xtc  ../../md0$i\_10\_sot.xtc  ../../md0$i\_11\_sot.xtc  ../../md0$i\_12\_sot.xtc  ../../md0$i\_13\_sot.xtc  ../../md0$i\_14\_sot.xtc  ../../md0$i\_15\_sot.xtc  ../../md0$i\_16\_sot.xtc  ../../md0$i\_17\_sot.xtc  ../../md0$i\_18\_sot.xtc  ../../md0$i\_19\_sot.xtc  ../../md0$i\_20\_sot.xtc  ../../md0$i\_21\_sot.xtc  ../../md0$i\_22\_sot.xtc  ../../md0$i\_23\_sot.xtc  ../../md0$i\_24\_sot.xtc  ../../md0$i\_25\_sot.xtc  ../../md0$i\_26\_sot.xtc  ../../md0$i\_27\_sot.xtc  ../../md0$i\_28\_sot.xtc  ../../md0$i\_29\_sot.xtc  ../../md0$i\_30\_sot.xtc  ../../md0$i\_31\_sot.xtc  ../../md0$i\_32\_sot.xtc  ../../md0$i\_33\_sot.xtc  ../../md0$i\_34\_sot.xtc  ../../md0$i\_35\_sot.xtc  ../../md0$i\_36\_sot.xtc  ../../md0$i\_37\_sot.xtc  ../../md0$i\_38\_sot.xtc  ../../md0$i\_39\_sot.xtc  ../../md0$i\_40\_sot.xtc  ../../md0$i\_41\_sot.xtc  ../../md0$i\_42\_sot.xtc  ../../md0$i\_43\_sot.xtc  ../../md0$i\_44\_sot.xtc  ../../md0$i\_45\_sot.xtc  ../../md0$i\_46\_sot.xtc  ../../md0$i\_47\_sot.xtc  ../../md0$i\_48\_sot.xtc  ../../md0$i\_49\_sot.xtc  ../../md0$i\_50\_sot.xtc  ../../md0$i\_51\_sot.xtc  ../../md0$i\_52\_sot.xtc  ../../md0$i\_53\_sot.xtc  ../../md0$i\_54\_sot.xtc  ../../md0$i\_55\_sot.xtc  ../../md0$i\_56\_sot.xtc  ../../md0$i\_57\_sot.xtc  ../../md0$i\_58\_sot.xtc  ../../md0$i\_59\_sot.xtc  ../../md0$i\_60\_sot.xtc  ../../md0$i\_61\_sot.xtc  ../../md0$i\_62\_sot.xtc  ../../md0$i\_63\_sot.xtc  ../../md0$i\_64\_sot.xtc  ../../md0$i\_65\_sot.xtc  ../../md0$i\_66\_sot.xtc  ../../md0$i\_67\_sot.xtc  ../../md0$i\_68\_sot.xtc  ../../md0$i\_69\_sot.xtc  ../../md0$i\_70\_sot.xtc  ../../md0$i\_71\_sot.xtc  ../../md0$i\_72\_sot.xtc  ../../md0$i\_73\_sot.xtc  ../../md0$i\_74\_sot.xtc  ../../md0$i\_75\_sot.xtc  ../../md0$i\_76\_sot.xtc  ../../md0$i\_77\_sot.xtc  ../../md0$i\_78\_sot.xtc  ../../md0$i\_79\_sot.xtc  ../../md0$i\_80\_sot.xtc  ../../md0$i\_81\_sot.xtc  ../../md0$i\_82\_sot.xtc  ../../md0$i\_83\_sot.xtc  ../../md0$i\_84\_sot.xtc  ../../md0$i\_85\_sot.xtc  ../../md0$i\_86\_sot.xtc  ../../md0$i\_87\_sot.xtc  ../../md0$i\_88\_sot.xtc  ../../md0$i\_89\_sot.xtc  ../../md0$i\_90\_sot.xtc  ../../md0$i\_91\_sot.xtc  ../../md0$i\_92\_sot.xtc  ../../md0$i\_93\_sot.xtc  ../../md0$i\_94\_sot.xtc  ../../md0$i\_95\_sot.xtc  ../../md0$i\_96\_sot.xtc  ../../md0$i\_97\_sot.xtc  ../../md0$i\_98\_sot.xtc  ../../md0$i\_99\_sot.xtc  ../../md0$i\_100\_sot.xtc  ../../md0$i\_101\_sot.xtc  ../../md0$i\_102\_sot.xtc  ../../md0$i\_103\_sot.xtc  ../../md0$i\_104\_sot.xtc  ../../md0$i\_105\_sot.xtc  ../../md0$i\_106\_sot.xtc  ../../md0$i\_107\_sot.xtc  -nice -19 -demux new_replica\_index\_$i.xvg 


for j in {0..107}

do

mv $j\_trajout.xtc c$i\_$j.xtc

done

done

#for k in {0..107}

#do

#trjcat_g_f -f c1\_$k.xtc c2\_$k.xtc c3\_$k.xtc c4\_$k.xtc c5\_$k.xtc c6\_$k.xtc c7\_$k.xtc c8\_$k.xtc c9\_$k.xtc c10\_$k.xtc c11\_$k.xtc c12\_$k.xtc c13\_$k.xtc c14\_$k.xtc c15\_$k.xtc c16\_$k.xtc c17\_$k.xtc c18\_$k.xtc c19\_$k.xtc c20\_$k.xtc c21\_$k.xtc c22\_$k.xtc c23\_$k.xtc c24\_$k.xtc c25\_$k.xtc c26\_$k.xtc c27\_$k.xtc c28\_$k.xtc c29\_$k.xtc  c30\_$k.xtc  c31\_$k.xtc  c32\_$k.xtc  c33\_$k.xtc  c34\_$k.xtc  c35\_$k.xtc  c36\_$k.xtc  c37\_$k.xtc  c38\_$k.xtc c39\_$k.xtc c40\_$k.xtc -cat -o cc_$k.xtc -nice -19 &

#done

#rm replica_index_* new_replica_index_* tem_renumber_*
 
