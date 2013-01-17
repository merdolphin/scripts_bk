awk -v file=$1 'BEGIN{
while (getline< file)
  {
  k++;
  aa[k]=$0
  if ( $1=="ref_t") k0=k
  if ( $1=="gen_temp") k1=k
  }
close(file)
j=0;
while (getline< "replica-temp.dat" > 0.5)
  {
  file="md" j ".mdp"
  
  for (i=1;i<=k;i++)
   {
    if (i==k0) print "ref_t    =   ",$2,"    ",$2 > file;
    else if (i==k1) print "gen_temp            = ", $2 > file;
    else
    print aa[i] > file;
   }
  j++
  }
}' 
