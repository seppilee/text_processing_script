#!/usr/bin/perl

use strict;

binmode STDIN, ":utf8";
binmode STDOUT, ":utf8";

my %lines = ();

while (my $l = <STDIN>)
{
	if (defined($lines{$l})) { print STDERR "duplicate: $l"; next; }
	$lines{$l} = 1;
	print $l;
}

