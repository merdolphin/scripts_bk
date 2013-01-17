#!/bin/bash

#grep -l -i finish md0*_0.log | sed  's/\_0.log/\_*.\{log,tpr,xtc\}/; s/^/mv /g; s/$/ successed_finished_one/g'
mv md023_*.{log,tpr,xtc} successed_finished_one
mv md030_*.{log,tpr,xtc} successed_finished_one
mv md031_*.{log,tpr,xtc} successed_finished_one
mv md032_*.{log,tpr,xtc} successed_finished_one
mv md033_*.{log,tpr,xtc} successed_finished_one
mv md036_*.{log,tpr,xtc} successed_finished_one
mv md038_*.{log,tpr,xtc} successed_finished_one
mv md040_*.{log,tpr,xtc} successed_finished_one
mv md043_*.{log,tpr,xtc} successed_finished_one
mv md045_*.{log,tpr,xtc} successed_finished_one
mv md046_*.{log,tpr,xtc} successed_finished_one
mv md052_*.{log,tpr,xtc} successed_finished_one

