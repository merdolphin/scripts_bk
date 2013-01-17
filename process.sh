#!/bin/bash

for i in {1..16}

do 

#grompp_g_f -f minim.mdp -c solv\_ions\_$i.gro -p top_$i.top -o em_$i.tpr 

cat m0.sh | sed 's/md_0/npt_'$i'/g' > m_$i.sh

chmod +x m_$i.sh

qsub -q iwarp m_$i.sh

done
