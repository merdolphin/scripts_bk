#!/bin/bash

#for i in 0 900000 950000 

#do
#	g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.chol_hydrophobic_mass_density.xvg -b $i -e $i+500000 < group.txt
#	echo 22 > group.txt
#	 g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_mass_density.xvg -b $i -e $i+500000 < group.txt
#	echo 68 > group.txt
#	 g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_hydrophobic_mass_density.xvg -b $i -e $i+500000 < group.txt
#	echo 63 > group.txt
#	g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_headgroup_mass_density.xvg -b $i -e $i+500000 < group.txt
#	echo 65 > group.txt
#	g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.abeta1_27_density.xvg -b $i -e $i+500000 < group.txt
#	echo 66 > group.txt
#       g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.abeta28_42_density.xvg -b $i -e $i+500000 < group.txt
#	echo 67 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_CO__density.xvg -b $i -e $i+500000 < group.txt
#	echo 17 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.water_density.xvg -b $i -e $i+500000 < group.txt
#	echo 69 > group.txt
#	g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.chol_headgroup_density.xvg -b $i -e $i+500000 < group.txt
	
#done

#for i in 0 900000 950000 

#do
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o  $i.chol_hydrophobic_mass_density.xvg -b $i -e $i+50000 < group.txt
#        echo 22 > group.txt
#         g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_mass_density.xvg -b $i -e $i+50000 < group.txt
#        echo 68 > group.txt
#         g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_hydrophobic_mass_density.xvg -b $i -e $i+50000 < group.txt
#        echo 63 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_headgroup_mass_density.xvg -b $i -e $i+50000 < group.txt
#        echo 65 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.abeta1_27_density.xvg -b $i -e $i+50000 < group.txt
#        echo 66 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.abeta28_42_density.xvg -b $i -e $i+50000 < group.txt
#        echo 67 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_CO__density.xvg -b $i -e $i+50000 < group.txt
#       echo 17 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.water_density.xvg -b $i -e $i+50000 < group.txt
#        echo 69 > group.txt
#        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.chol_headgroup_density.xvg -b $i -e $i+50000 < group.txt

#done


for i in 0 900000

do
	let "j = $i + 100000"
	
	echo 21 > group.txt
	g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.chol_mass_density.xvg -b $i -e $j < group.txt 
       	echo 68 > group.txt
	g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o  $i.chol_hydrophobic_mass_density.xvg -b $i -e $j < group.txt
        echo 22 > group.txt
         g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_mass_density.xvg -b $i -e $j < group.txt
        echo 68 > group.txt
         g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_hydrophobic_mass_density.xvg -b $i -e $j < group.txt
        echo 63 > group.txt
        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_headgroup_mass_density.xvg -b $i -e $j < group.txt
        echo 65 > group.txt
        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.abeta1_27_density.xvg -b $i -e $j < group.txt
        echo 66 > group.txt
        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.abeta28_42_density.xvg -b $i -e $j < group.txt
        echo 67 > group.txt
        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.dppc_CO__density.xvg -b $i -e $j < group.txt
        echo 17 > group.txt
        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.water_density.xvg -b $i -e $j < group.txt
        echo 69 > group.txt
        g_density_g_d -f ../../md_0_1000.xtc -s ../../md_0_1000.tpr -n index.ndx -o $i.chol_headgroup_density.xvg -b $i -e $j < group.txt

done










