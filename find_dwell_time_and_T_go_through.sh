#!/bin/sh

b=105

touch result

for i in `seq -f '%02g' 1 40`

do

sed 's/\$f/replica_index_'$i'.xvg/g;s/a=0/a='$b'/g' find_dwell_time_and_T_go_through_template.sh > find_dwell_time_and_T_go_through_$i.sh

chmod +x find_dwell_time_and_T_go_through_$i.sh

./find_dwell_time_and_T_go_through_$i.sh >> result

b=`tail -n 1 result`
done
