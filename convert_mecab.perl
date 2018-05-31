#!/usr/bin/perl

use strict;
use utf8;

binmode STDIN, ":utf8";
binmode STDOUT, ":utf8";

my @word;
my @tag;
my @seg;

while(<>){
        chomp;
        if ($_ =~ m/^(.+)\t(.+?),/) {
        push @word, $1;
                push @tag, $2;
                push @seg, "$1/$2";
                next;
        }
        die "Error: invalid format\n" if $#word != $#tag;
        for my $i (0.. $#seg) {
                print  "" if $i > 0;
        if ($seg[$i] =~ /SF/gi)
              {
               $seg[$i] =~ s/\/SF//g;
               #$seg[$i] =~ s/_/ /g;
               print "$seg[$i]\n";
              }
        #elsif($seg[$i] =~ /\/(J|EF|EC|EC|ET|M|IC|XS|NNB)/g)
        #      {
        #       $seg[$i] =~ s/\/\S+/ /g;
        #       print "$seg[$i]";
        #      }
        else  {
               $seg[$i] =~ s/\/\S+//g;
               #$seg[$i] =~ s/_/ /g;
               print "$seg[$i]";

              }
     }
        undef @word;
        undef @tag;
        undef @seg;
        print "\n";
}
