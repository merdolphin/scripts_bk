t=$1

c=65
tt=92
while [ $c -lt $tt ]; do

echo ${t}_${c}_sot.xtc
scp -P 8816 jzhang@hpcc.nju.edu.cn:/gpfssan1/home/jzhang/ygmu/remd/${t}_${c}_sot.xtc .

let c=c+1
done

echo "finished"
