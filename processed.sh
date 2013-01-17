#!/bin/sh

m=77

for f in sys_em_*.gro

do

sed '69977,69985d' $f | sed 's/70072/70063/g'  > new_$m.gro

m=$(($m+1))

done
