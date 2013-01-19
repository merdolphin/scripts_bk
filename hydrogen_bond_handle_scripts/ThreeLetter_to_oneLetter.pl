#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

my %AA = (ALA=>'A',TYR=>'Y',MET=>'M',LEU=>'L',CYS=>'C',GLY=>'G',
         ARG=>'R',ASN=>'N',ASP=>'D',GLN=>'Q',GLU=>'E',HIS=>'H',TRP=>'W',
         LYS=>'K',PHE=>'F',PRO=>'P',SER=>'S',THR=>'T',ILE=>'I',VAL=>'V');

#print map "$_:$AA{$_}\n", sort keys %AA;

my $filename = "S_HB_A";

open my $fh, '<', $filename;

while(<$fh>){
	if(/(\d+)([A-Z]{3})/){
		#say $1,$AA{$2}; 
		say $1;
	}
}
