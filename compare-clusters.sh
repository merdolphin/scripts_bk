# compares the free energy of clusters from bias exchange
# and from equilibrium MD (assuming a grid 10x10x10x10 is used!!!)

file1="CLUSTERS.FES"
file2="EQUIL_CLUSTERS.FES"

awk 'BEGIN{ pi=3.14159; pi2=pi*2.; dx=pi2/10. }
{
 if(FILENAME=="CLUSTERS.FES"){
   n++; x1[n]=$3; x2[n]=$4; x3[n]=$5; x4[n]=$6; fbe[n]=$7
 }else{
   y1=$3; y2=$4; y3=$5; y4=$6
   for(i=1;i<=n;i++){
     dx1=(x1[i]-y1)*(x1[i]-y1)
     dx2=(x2[i]-y2)*(x2[i]-y2)
     dx3=(x3[i]-y3)*(x3[i]-y3)
     dx4=(x4[i]-y4)*(x4[i]-y4)
     if(dx1+dx2+dx3+dx4<0.1){
       print $0,fbe[i]
     }
   }
 }
}' $file1 $file2
