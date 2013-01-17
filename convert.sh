lab[0]="psi1"
lab[1]="phi1"
lab[2]="psi2"
lab[3]="phi2"
act[0]=0 # first  CV = 0
act[1]=1 # second CV = 1 
act[2]=2 # third  CV = 2
act[3]=3 # fourth CV = 3

for i in 0 1 2 3 
do
  # this adds one column (a label) at the end of each COLVAR line
  awk -v label=${lab[${i}]} '{if($1!="#!")print $0,label}' COLVAR$i > CV$i

  # this adds a line (number of biased CVs, indexes of biased CVs, label)
  # at the beginning of each HILLS file
  (
  echo "1 ${act[${i}]} ${lab[${i}]}"
  cat HILLS$i
  ) > HI$i
done


 export PATH=/Applications/Gnuplot.app/Contents/Resources/bin:$PATH
 export GNUTERM=x11
