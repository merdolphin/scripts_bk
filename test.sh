for i in {31..40}

do
demux.pl ../../md0$i\_0.log

mv replica_index.xvg replica_index_$i.xvg

done

cp replica_index_31.xvg new_replica_index_31.xvg

cat replica_index_31.xvg > all_replicas_index.xvg

a=31

for i in {32..40}

do

b=$i

cat renumber_v3.py | sed 's/replica_index_4.xvg/replica_index_'$a'.xvg/g' | sed 's/replica_index_6.xvg/replica_index_'$b'.xvg/g' > tem_renumber_$i.py
chmod +x tem_renumber_$i.py
./tem_renumber_$i.py | sed '/^$/d' > new_replica_index_$i.xvg
a=$i

cat new_replica_index_$i.xvg >> all_replicas_index.xvg

done

