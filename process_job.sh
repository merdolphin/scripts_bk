#!/bin/bash

for i in {3..1296}

#for i in {1..2}
do 

cat m1.sh | sed 's/try/em_'$i'/g' > m_$i.sh

chmod +x m_$i.sh

qsub m_$i.sh

sleep 1

rm \#*

done

#for i in {1..1296}

#do

#mdrun_g_f -v -deffnm em_$i & 

#done
