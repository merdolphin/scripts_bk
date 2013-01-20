#!/bin/bash
## written by lina on Mon Jan 21 00:11:46 SGT 2013

for i in `seq -w 1 1 16`
    do 
    awk '{if(NF==11){print $4+$5, $8+$9+$10}}' full_scount_$i.xvg > s$i.out
     
    ./average_dssp.sh s$i.out > ab$i.out

     done
     
     paste ab01.out ab02.out ab03.out ab04.out ab05.out ab06.out ab07.out ab08.out ab09.out ab10.out ab11.out ab12.out ab13.out ab14.out ab15.out ab16.out > temp_ab
      
      awk '{for(i=1;i<NF;i++){
                if(i%2!=0){
                    printf("%.2f ",$i)
                    }
                    }
                    printf("\n")
            }' temp_ab > temp_b

      awk '{for(i=1;i<NF;i++){
                if(i%2==0){
                    printf("%.2f ",$i)
                    }
                    }
                    printf("\n")
            }' temp_ab > temp_a

past temp_b temp_a  > temp

soffice -calc -o temp
