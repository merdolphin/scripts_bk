#!/bin/bash

echo 22 | do_dssp -f ../cc_ii.xtc -s ../../../md024_0.gro -o ss_ii.xpm -nice -19 -n ../../index.ndx -dt 1
