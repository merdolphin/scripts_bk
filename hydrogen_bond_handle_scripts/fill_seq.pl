#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

my $filename = $ARGV[0];

open my $fh, '<', $filename;

my $id = 1;

while(<$fh>){
	my @fields = split ' ', $_;
	
	if($id != $fields[0]){
		say $id++, " ", "0" until $id == $fields[0];
		
	}
	if($id == $fields[0]){	
		say $id, " ", $fields[1];
		$id ++;
	}

}

if($id < 42){
	say $id++, " ", "0" until $id > 42;
}
