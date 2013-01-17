#!/bin/bash

#more temAB_S  | awk '{if($2>1600){print $0}}'

#more temA_B  | awk '{if($2>1600){print $0}}'

more CHC_S_minidist.xvg | awk '{if(NF==2){print $0}}' | head | sed '1d' | head -n 1 > tem_chc_s

more CHC_S_minidist.xvg | awk '{if(NF==2){print $0}}' | sed '1d' | sed '/^0.000000/d' >> tem_chc_s

 more tem_chc_s | awk '{if($2>=0.25 && $2 <=0.33){printf("%06d  %.7f\n",NR, $2)}}' > C_AB_S

more CHC_CHC_dist.xvg  | awk '{if(NF==5){print $0}}'  | head | sed '1,3d' | head -n 1  > tem_chc_chc

 more CHC_CHC_dist.xvg  | awk '{if(NF==5){print $0}}'  | sed '1,3d' | sed '/^   0.0000000/d' >> tem_chc_chc

more tem_chc_chc | awk '{if($2>=0.47 && $2 <=0.52 || $2>=0.67 && $2 <= 1 ){printf("%06d %.7f\n", NR,$2)}}'  > C_chc_chc

join C_AB_S C_chc_chc | awk '{printf("%d %f %f\n",$1,$2,$3)}'

#./correlation_subGroup.sh | awk '{a=$1; getline; b=$1; print b-a}' | uniq -c | awk '{if($1>11){print $0}}'
