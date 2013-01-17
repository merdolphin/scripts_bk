#!/bin/bash


#more all_replicas_index.xvg | awk 'BEGIN{a=0}{for(i=2;i<=NF;i++){if($i==0){a++; print a}}
#}'

more all_replicas_index.xvg | awk 'BEGIN{a=0}{if($109==53){a++}}END{print a}' 
