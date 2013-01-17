!#/bin/bash


for i in 4 6 7 8 10 13 14 23 30 31 32 33 36 38 40 43 45 46 52 61 65 67 70

do
demux.pl ../md0$i\_0.log 

mv replica_index.xvg replica_index_$i.xvg

done

a=4
cp replica_index_4.xvg new_replica_index_4.xvg

for i in  6 7 8 10 13 14 23 30 31 32 33 36 38 40 43 45 46 52 61 65 67 70
do
b=$i
cat renumber_v3.py | sed 's/replica_index_4.xvg/replica_index_'$a'.xvg/g' | sed 's/replica_index_6.xvg/replica_index_'$b'.xvg/g' > tem_renumber_$i.py
chmod +x tem_renumber_$i.py
./tem_renumber_$i.py | sed '/^$/d' > new_replica_index_$i.xvg
a=$i
done

for i in 4 6 7 8 10 13 14 23 30 31 32 33 36 38 40 43 45 46 52 61 65 67 70 

do

trjcat_g_f -f ../md0$i\_0.xtc ../md0$i\_1.xtc ../md0$i\_2.xtc ../md0$i\_3.xtc ../md0$i\_4.xtc ../md0$i\_5.xtc ../md0$i\_6.xtc ../md0$i\_7.xtc ../md0$i\_8.xtc ../md0$i\_9.xtc ../md0$i\_10.xtc ../md0$i\_11.xtc ../md0$i\_12.xtc ../md0$i\_13.xtc ../md0$i\_14.xtc ../md0$i\_15.xtc ../md0$i\_16.xtc ../md0$i\_17.xtc ../md0$i\_18.xtc ../md0$i\_19.xtc ../md0$i\_20.xtc ../md0$i\_21.xtc ../md0$i\_22.xtc ../md0$i\_23.xtc ../md0$i\_24.xtc ../md0$i\_25.xtc ../md0$i\_26.xtc ../md0$i\_27.xtc ../md0$i\_28.xtc ../md0$i\_29.xtc ../md0$i\_30.xtc ../md0$i\_31.xtc ../md0$i\_32.xtc ../md0$i\_33.xtc ../md0$i\_34.xtc ../md0$i\_35.xtc ../md0$i\_36.xtc ../md0$i\_37.xtc ../md0$i\_38.xtc ../md0$i\_39.xtc ../md0$i\_40.xtc ../md0$i\_41.xtc ../md0$i\_42.xtc ../md0$i\_43.xtc ../md0$i\_44.xtc ../md0$i\_45.xtc ../md0$i\_46.xtc ../md0$i\_47.xtc ../md0$i\_48.xtc ../md0$i\_49.xtc ../md0$i\_50.xtc ../md0$i\_51.xtc ../md0$i\_52.xtc ../md0$i\_53.xtc ../md0$i\_54.xtc ../md0$i\_55.xtc ../md0$i\_56.xtc ../md0$i\_57.xtc ../md0$i\_58.xtc ../md0$i\_59.xtc ../md0$i\_60.xtc ../md0$i\_61.xtc ../md0$i\_62.xtc ../md0$i\_63.xtc  -demux new_replica_index_$i.xvg -nice -10


for j in {0..63}

do

mv $j\_trajout.xtc c$i\_$j.xtc

done

done

for k in {0..63}

do

trjcat_g_f -f c4\_$k.xtc c6\_$k.xtc c7\_$k.xtc c8\_$k.xtc c10\_$k.xtc c13\_$k.xtc c14\_$k.xtc c23\_$k.xtc c30\_$k.xtc c31\_$k.xtc c32\_$k.xtc c33\_$k.xtc c36\_$k.xtc c38\_$k.xtc c40\_$k.xtc c43\_$k.xtc c45\_$k.xtc c46\_$k.xtc c52\_$k.xtc c61\_$k.xtc c65\_$k.xtc c67\_$k.xtc c70\_$k.xtc  -cat -o cc_$k.xtc -nice -10

done

rm replica_index_* new_replica_index_* tem_renumber_*
