#!/bin/bash

n=1;

for i in {1..4}
    do
    for j in {2..4}
        do
        for k in {5..8}
            do
            for m in {6..8}
                do
                if [ $i -ne $j ] && [ $j -ne $k ] && [ $k -ne $m ]; then
                      cat Bdna_newbox.gro | sed '$d' > new_$n.gro
                      sed -n '3, 629p' 1app\_$i.gro >> new_$n.gro
                      sed -n '3, 629p' 1app\_$j.gro >> new_$n.gro  
                      sed -n '3, 629p' 1app\_$k.gro >> new_$n.gro
                      sed -n '3, 629p' 1app\_$m.gro >> new_$n.gro
                      echo "   7.00000   7.00000   9.00000" >> new_$n.gro
                      sed -i 's/1278/3786/g' new_$n.gro
                      n=$(($n+1))

                fi
                done
        done
    done
done



