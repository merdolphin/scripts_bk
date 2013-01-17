#!/bin/bash

dir=/home/zhao0139/scratch/namd/4abeta_Bdna/output

Email=zhao0139@e.ntu.edu.sg


for i in {1..20}

do

ls -lrt * | tail -1 > report

mail -s "starfruit problem" $Email < report

sleep 3600

done
