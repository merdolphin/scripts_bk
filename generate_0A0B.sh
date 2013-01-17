more OB | awk '{if(is_csh<13) {print is_csh-=} else {print =-is_csh}}' | sort | uniq -c 
