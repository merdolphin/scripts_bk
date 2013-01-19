#!/bin/bash
 
more dict | awk '{print $1}' | grep -v HEM | uniq | perl -e '
my %dict; 
my $to_be_translated_name = "temp_abeta"; 
open my $fh, "<", $to_be_translated_name; 
while(<>){
	if(/(\d+)([A-Z]+)/){
		$dict{$1}="$2-$1";
	}
	}; 

while(<$fh>){
	if(/(\d+) (\& \S+)/){
		print "\%", $dict{$1},$2," ";
			}

}
'
#print $dict{$1}, $2,"\n";

