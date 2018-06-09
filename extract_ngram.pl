#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use open ':encoding(UTF-8)';
binmode STDOUT, ':utf8';

sub trim {
	my $str = shift;
	$str = lc $str;
	$str =~ s/([\x{21}-\x{2F}\x{3A}-\x{40}\x{5B}-\x{60}\x{7B}-\x{7E}])/ $1/g;
	$str =~ s/\s+/ /g;
	$str =~ s/^ | $//g;
	return $str;
}

$#ARGV == 1 or die "Usage: $0 ngram_size filename\n";

$ARGV[0] =~ m/^[1-9][0-9]*$/ or die "Error: invalid ngram size\n";
open my $fo, $ARGV[1] or die "Error: $ARGV[1] not found\n";

my $line = 0;
my %ngrams;
  
while (<$fo>) {
	$_ = trim $_;
	my $len = length($_) - 1;
	for my $i (0 .. $ARGV[0] - 1) {
		for my $j (0 .. $len - $i) {
			next if substr($_, $j, 1) eq ' ' or substr($_, $i + $j, 1) eq ' ';
			$ngrams{substr $_, $j, $i + 1}++;
		}
	}
	warn "$ARGV[2]: $line lines hashed\n" if ++$line % 100000 == 0;
	}


$line = 0;
foreach (sort {$ngrams{$b} <=> $ngrams{$a}} keys %ngrams) {
	print "$ngrams{$_}\t$_\n";
	$line++;
}
close $fo;
