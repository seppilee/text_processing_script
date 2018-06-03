#!/usr/bin/perl

my $file1 = $ARGV[0];
my $file2 = $ARGV[1];

open(FILE1, "<$file1") || die "Can't open file $file";
open(FILE2, "<$file2") || die "Can't open file $file";

while (my $l1 = <FILE1>)
{
	my $l2 = <FILE2>;
	
	chomp($l1);
	chomp($l2);
	
	my @toks1 = split(/ /, $radek1);
	my @toks2 = split(/ /, $radek2);
	
	if (scalar(@toks1) != scalar(@toks2))
	{
		print "Non-matching lines:\n";
		print "$file1: $l1\n";
		print "$file2: $l2\n";
		exit; 
	}
}

