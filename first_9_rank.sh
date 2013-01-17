#!/bin/bash

for i in `seq -w 1 1 16` ; do  echo -n "$i "; more cluster_$i.log | awk '{if((NF==15)&& ($1==1)){print $0}}'|  awk '{print $1,$3}'; echo -n "$i "; more cluster_$i.log | awk '{if((NF==15)&& ($1==2)){print $0}}' | awk '{print $1,$3}'; done | sort -nr -k3 | head -n 9
