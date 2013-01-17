# print atoms for ALPHA/ANTIBETA/PARABETARMSD from start.pdb
awk '{
  if($1=="ATOM"&&$4=="VAL"){
    a=$3; r=$5
    if((a=="N"||a=="CA"||a=="C"||a=="O"||a=="CB")&&r!=oldres) {
      nres++; oldres=$5; rr[nres]=$4 }
    if(a=="N")  {  N[nres]=$2; nat[nres]++ }
    if(a=="CA") { CA[nres]=$2; nat[nres]++ }
    if(a=="C")  {  C[nres]=$2; nat[nres]++ }
    if(a=="O")  {  O[nres]=$2; nat[nres]++ }
    if(a=="CB") { CB[nres]=$2; nat[nres]++ }
  }
}
END{
  for(ires=1;ires<=nres;ires++){
    printf "%5d %5d %5d %5d %5d\n",N[ires],CA[ires],C[ires],O[ires],CB[ires]
  }
}' start.pdb
