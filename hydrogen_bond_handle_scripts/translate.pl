#!/usr/bin/env perl

use strict;
use warnings;
use autodie qw(open close);
use Carp qw(croak);
use 5.012;

my $dict_filename = "dict";

my $to_be_translated_filename = "A_index_file";

open my $fh1, '<', $dict_filename; 

open my $fh2, '<', $to_be_translated_filename;

my %dict;

while(<$fh1>){

	my @fields = split ' ', $_;
	$dict{$fields[2]} = $fields[0];
}

#print map "$dict{$_}:$_\n", sort keys %dict;

while(<$fh2>){

	my @fields = split ' ', $_;
	#if($fields[2]>=2831){
		#say $dict{$fields[0]}, ' ', $dict{$fields[2]};
		#}
	if($fields[0]<629){
		say $dict{$fields[0]};
	}
	if($fields[2] <629){
		say $dict{$fields[2]};
	
	}
}
