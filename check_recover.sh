#!/bin/bash


while(pbsnodes -a | grep -q down)
do 
sleep 300 
done

echo recover | mail zhao0139@e.ntu.edu.sg

qsub -l nodes=starfruit-c09:ppn=8 m_0.sh

qdel  12781.starfruit-h00
