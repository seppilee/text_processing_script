#!/usr/bin/perl

use strict;
#use warnings;
use utf8;

binmode STDIN, ":utf8";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";


my $input_file_name = $ARGV[0];
my $corpus_file_name = $ARGV[1];
my %multiple;
my $base;
my @patterns;


open INFILE, "<:encoding(utf8)", $input_file_name;
while (<INFILE>) {
	chomp;
	$_ =~ s/\x{FEFF}|\r//gi;
	$_ =~ s/\.|\?|\!|,|\"|\'| //g;
	
	next unless (defined $_ and length $_);
	
	$multiple{$_} = 1;
}

close INFILE;


open CORFILE, "<:encoding(utf8)", $corpus_file_name;
my $line = 0;
my $eng;
my $base;
my $kor;
while (<CORFILE>) {
	chomp;
	$line ++;
    	$_ =~ s/\x{FEFF}|\r//gi;
	next unless (defined $_ and length $_);
	if(/(.+)\t(.+)/){
	$base = $1;
	$eng = $1;
	$kor = $2;
	$eng =~ s/\.|\?|\!|,|\"|\'| //g;
	
	if($multiple{$eng}==1){
	
	print "$base\t$kor\n";
	
	}
	}

	if (!($line%1000))
	{
		print  STDERR"processing: $line\n";
	}
	

}

close CORFILE;
