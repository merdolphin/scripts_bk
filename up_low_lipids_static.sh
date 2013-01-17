#!/bin/sh
#!/bin/sh
## written by lina
##

## for cholesterol static
#awk '{
#	match($1,/([0-9]*)([A-Z]*)/,label)
#	if(label[2]=="CHOL" && $2 == "O28" && $6  > 7.9 )
 # 		 printf("%5d%-5s%5s%5d%8.3f%8.3f%8.3f%8.3f%8.3f%8.3f\n",label[1],label[2],$2,$3,$4,$5,$6,$7,$8,$9)
#	else
#		$9=0
#	 }' \
#	$1


## for DPPC static
awk '{
	match($1,/([0-9]*)([A-Z]*)/,label)
	if(label[2]=="DPPC" && $2 == "N4" && $6  < 7.9 )
  		 printf("%5d%-5s%5s%5d%8.3f%8.3f%8.3f%8.3f%8.3f%8.3f\n",label[1],label[2],$2,$3,$4,$5,$6,$7,$8,$9)
	else
		$9=0
	 }' \
	$1


exit 0
##
## eos

