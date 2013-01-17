# print atoms for ALPHABETA dihedrals from file start.pdb

awk '{
  if($1=="ATOM"&&($4!="ACE"&&$4!="NME")){
    a=$3; r=$5
    if((a=="N"||a=="CA"||a=="C")&&r!=oldres) {
      nres++; oldres=$5; rr[nres]=$4 }
    if(a=="N")  {  N[nres]=$2; nat[nres]++ }
    if(a=="CA") { CA[nres]=$2; nat[nres]++ }
    if(a=="C")  {  C[nres]=$2; nat[nres]++ }
  }
}
END{
#  refangle=-1.0472
#  print "# phi dihedrals:"
#  for(ires=1;ires<nres;ires++){
#    printf "%5d %5d %5d %5d  %8.5f\n",C[ires],N[ires+1],CA[ires+1],C[ires+1],refangle
#  }
  refangle=-0.7854
  print "# psi dihedrals:"
  for(ires=1;ires<nres;ires++){
    printf "%5d %5d %5d %5d  %8.5f\n",N[ires],CA[ires],C[ires],N[ires+1],refangle
  }
}' start.pdb
