#!/usr/bin/perl

use utf8;


binmode STDIN, ":utf8";
binmode STDERR, ":uft8";
binmode STDOUT, ":utf8";

my %names;
open INFILE, "<:encoding(utf8)", $ARGV[0];

while(<INFILE>){
s/\x{FEFF}|\r//;
next if /(\d|>|<|\)|\(|\'|\"|[a-zA-Z]{3}|:|\/|\[|\]|~|\.\.|\=)/;
next unless /^[\x{AC00}-\x{D7AF}]/;


s/^\s+//g;

my $words = 0;
$words += scalar(split(/\s+/, $_));
if($words > 3 && $words < 11){
$count++;

my $base = $_;
$_ =~ s/\,|\s+|\"|\'|\?|\!//g;
$names{$_}++;
if($names{$_} == 1){
print $base;
}


}

}
close INFILE;


