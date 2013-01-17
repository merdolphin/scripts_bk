#!/bin/sh

a=0
 

more  $f  | awk '{
		for(j=2;j<=109;j++)
			{
			 if($j==a){ 
			  	print j-2
			 	}
			}
		
	
}'



