t=$1

c=0
tt=108
while [ $c -lt $tt ]; do

echo ${t}_${c}_sot.xtc
scp -P 8816 jzhang@hpcc.nju.edu.cn:/gpfsTMP/jzhang/ygmu/b100a9_2/${t}_${c}_sot.xtc .

let c=c+1
done

echo "finished"
