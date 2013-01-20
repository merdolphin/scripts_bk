#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

my $filename = "try_ssp_c";

open my $fh, '<', $filename;

my @bend_turn;
my @beta_sheet;
my @coil;
my @helix;

while(my $line = <$fh>){
	my @ssp = split "",$line;
	my $BTcount = 0;
	my $BScount = 0;
	my $Ccount = 0;
	my $Hcount = 0;
	foreach(@ssp){
		if($_ eq "S" || $_ eq "T"){
			$BTcount++;
		}
		if($_ eq "B" || $_ eq "E"){
			$BScount++;
		}
		if($_ eq "~"){
			$Ccount++;
		}
			if($_ eq "H" || $_ eq "G"){
			$Hcount++;
		}



		
	}
	say $BTcount,"\t",$BScount,"\t",$Ccount,"\t",$Hcount;
	 
}
