#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode STDIN, ":utf8";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

if ((scalar @ARGV) != 2) {
    print "[ERROR] input_file_name output_file_name not given.\n";
    exit;
}

my $input_file_name = $ARGV[0];
my $output_file_name = $ARGV[1];
my @lines;

open INFILE, "<:encoding(utf8)", $input_file_name;
while (<INFILE>) {
    chomp;
    $_ =~ s/^\s+|\s+$//g;
    next unless (defined $_ and length $_);
    my $line = $_;
    # print "$line\n";
    push @lines, $line;
}
close INFILE;

unless (@lines and scalar(@lines)) {
    print "[ERROR] no valid line included.\n";
    exit;
}

my $title = shift @lines;
my $content = join(" ", @lines);

open OUTFILE, ">:utf8", $output_file_name;
print OUTFILE $title."\n";
print OUTFILE $content."\n";
close OUTFILE;

