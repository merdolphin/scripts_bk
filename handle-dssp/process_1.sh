#!/bin/bash

for i in `seq -w 1 1 16`

    do 
        more ss_$i.xpm | awk '{if(NF==1){print $0}}' > try_ssp_c

        ./SSP.pl > a_$i.out

    done
