#!/bin/bash

echo "31" > idx.txt

echo "20
31" > index.txt

j=1;

for i in 096 0102 0103 0104 0105 0106 0112 0115 0117 0120 0123 0124 0126 0127 0128 0136 0138 0142 0144 0147 0150 0151 0154 0157 0158 0163 0165 0166 0169 0173 0175 0180 0186 0188 0189 0190 0198 0207 0211 0213 0216 0222 0225 0226 0229 0230 0231 0232 0240 0243 0247 0259 0261 0262 0267 0277 0287 0291 0293 0295 0301 0306 0311 0315 0319 0336 0338 0340 0344 0351 0359 0363 0364 0371 0380 0383 0385 0386 0388 0396 0397 0398 0400 0402 0403 0405


do

#do_dssp -f ../../../md$i\_0.xtc -s ../../../../2app4hem/confout0.gro -n ../index.ndx -o ss_$j.xpm -sc scount_$j.xvg -nice -19  < idx.txt &

g_mindist_g_f -f ../../../md$i\_0.xtc -s ../../../../2app4hem/confout0.gro -n ../index.ndx -o atmo-pair_$j.out -printresname -od mindist_$j.xvg -on numcount_$j.xvg -or mindres_$i.xvg < index.txt &


j=$(($j+1))

done

