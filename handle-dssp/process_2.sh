#!/bin/bash

PEPTIDE=proB

more ${PEPTIDE}_all.out | awk '{
            for(i=1;i<=NF;i++){
                if(i%4==1)
                    {printf("%.2f ", 100*$i/($i+$(i+1)+$(i+2)+$(i+3)))}
                    }
                    printf("\n");
                    }' > BT_${PEPTIDE}.out

more ${PEPTIDE}_all.out | awk '{
            for(i=1;i<=NF;i++){
                if(i%4==2)
                    {printf("%.2f ", 100*$i/($i+$(i-1)+$(i+1)+$(i+2)))}
                    }
                    printf("\n");
                    }' >BS_${PEPTIDE}.out

more ${PEPTIDE}_all.out | awk '{
            for(i=1;i<=NF;i++){
                if(i%4==0)
                    {printf("%.2f ", 100*$i/($i+$(i-3)+$(i-1)+$(i-2)))}
                    }
                    printf("\n");
                    }' > HS_${PEPTIDE}.out
