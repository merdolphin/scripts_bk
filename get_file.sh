t=$1

c=0
tt=108
while [ $c -lt $tt ]; do

scp -P 8816 jzhang@hpcc.nju.edu.cn:/gpfssan1/home/jzhang/ygmu/remd/${t}_${c}_sot.xtc .

let c=c+1
done

echo "finished"
