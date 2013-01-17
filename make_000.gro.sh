c=0
read d < Nnode.sh
while [ $c -lt $d ]; do

res=`awk -v c=$c 'BEGIN{d=c%5; print d}'`

## ln -s      mdp/mini.gro  md000_$c.gro
echo $res
 
ln -s  prep_shift_$res/mini.gro md000_$c.gro

let c=c+1
done

