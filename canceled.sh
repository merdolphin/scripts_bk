for i in m0 m1 m2 m3 m6 m25 m26 m28 m29 m36 m37 m38 m39 m40 
do
	#echo $i
	qsub $i.sh
done
