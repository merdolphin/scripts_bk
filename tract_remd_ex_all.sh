#!/bin/ksh

nre=8

awk -v nre=$nre 'BEGIN{ printf "%5i",0 ; for (i=0;i<nre;i++) printf "%5i",i; printf "\n";}' > time_remd00 

cp  time_remd00    time_remd   

c=1
d=$1;
while [ $c -le $d ]; do

if [ $c -lt 10 ]; then
tt=md00$c
else
if [ $c -lt 100 ]; then
tt=md0$c
else
tt=md$c
fi
fi 

## ./tract_remd_ex.sh  ../${tt}_0.log  >>remd_md_all.xvg

awk -v nre=$nre 'BEGIN{
getline < "time_remd";
t0=$1
for (i=0;i<nre;i++) ll[i]=$(i+2)
close("time_remd");
dt=0.001;

nl=100000000
}
{
if (index( $0,"Repl ex")> 0.5) 
  {
  k=0;
  for (i=1;i<=NF;i++) if ($(i)=="x") {k++;ex[k]=i}
  for (i=1;i<=k;i++) {n1=$(ex[i]-1); n2=$(ex[i]+1); 
  if (n2-n1 != 1) {print "exchange error"; exit}; t=ll[n1];ll[n1]=ll[n2];ll[n2]=t}
  }

if ($1=="Step") nl=NR
if (NR==nl+1) 
  {
  tt=t0+$2*dt;
  if (tt > t0) {
  printf "%10.4f",tt;
  for (i=0;i<nre;i++) {printf "%5d",ll[i]}
  printf "\n";
  }}
}
END{
printf "%10.4f",tt > "time_remd";
for (i=0;i<nre;i++) {printf "%5d",ll[i] > "time_remd"}
printf "\n"> "time_remd";

}'  ../${tt}_0.log  >>remd_md_all.xvg

let c=c+1
done

