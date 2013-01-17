#!/bin/sh

mtime=$(stat -c %Y traj0.xtc)

ctime=$(date +%s)


intervalT=$(($ctime - $mtime))

n=20

while [ 1 ] 
do
	if [[ $intervalT < 3600 ]]; then 
		sleep 3600
	fi

	if [[ $intervalT > 3600 ]]; then
		echo "Something might be wrong with writting" | mail -s "not_written_2app4hem" zhao0139@e.ntu.edu.sg  
		break
	fi
	break
done

