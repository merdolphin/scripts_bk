t=$1
rm tot_out_chk_${t}

c=0
tt=108
while [ $c -lt $tt ]; do

gmxcheck_454s -f ${t}_${c}_sot.xtc >& out_chk_${t}_${c}_sot
awk -v c=$c '{if ($1=="Step") print c,"  ",$2}' out_chk_${t}_${c}_sot >> tot_out_chk_${t}

let c=c+1
done

echo "finished"
