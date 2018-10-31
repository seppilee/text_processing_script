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
my %base_idx;
my %base_line;
my $base;
my $base_org;


sub find_keys {
    my ( $h, $values ) = @_;
    while ( my ( $k, $v ) = each %$h ) {
              return $k if $v eq $values;
                                       }
             return;
                }

sub find_values {
    my ( $h, $keys ) = @_;
    while ( my ( $k, $v ) = each %$h ) {
              return $v if $k eq $keys;
                                       }
             return;
                }

open INFILE, "<:encoding(utf8)", $input_file_name;
my $line = 0;
while (<INFILE>) {
  chomp;
  $line++;
  $_ =~ s/\x{FEFF}|\r//gi;
  $base_org = $_;
  $_ =~ s/\s+|\.|\?|\!|,|\"|\'//g;                       # to change for special characters(file1)
  next unless (defined $_ and length $_);
  $multiple{$_} = 1;
  $base_idx{$_} = $base_org;
  $base_line{$base_org} = $line;
}
close INFILE;


open CORFILE, "<:encoding(utf8)", $corpus_file_name;
my $line = 0;
my $fnd = 0;
while (<CORFILE>) {
  chomp;
  $line ++;
  $_ =~ s/\x{FEFF}|\r//gi;
next unless (defined $_ and length $_);
  $base = $_;
  $_ =~ s/\s+|\.|\?|\!|,|\"|\'//g;                                     # to change for special characers(file 2)
  if($multiple{$_} == 1){
    my $p = find_values(\%base_idx, $_);
    print "$p(=$corpus_file_name)\n$base(=$input_file_name)\n\n" if($p)&&($p ne $base);

  }else{
    my $q = find_keys(\%base_line, $line);
    print "$base(<>$corpus_file_name)\n$q(<>$input_file_name)\n\n" if($q);

  $fnd = 1;
  }

  if (!($line%100))
  {
    print  STDERR"processing line: $line\n";
  }
}

if ($fnd == 0){
    print  STDERR"not found unique sentence!\n";
  }

close CORFILE;
