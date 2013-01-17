#!/bin/bash

awk '{ 
	for (i = 1; i <= NF; i++)
		if ($i%1000==0)
			$i= $i/1000

		else
			print $i
	print $0
}' $1
