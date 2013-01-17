#!/bin/bash
WHAM2D="/nfs_home/tutoadmin/PLUMED/wham/wham/wham-2d/wham-2d"
$WHAM2D Px=pi -3.14159 3.14159 50 Py=pi -3.14159 3.14159 50 0.001 300 0 metadatafile free_ene.dat >out_wham  
