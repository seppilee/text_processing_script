#!/usr/bin/perl

my %names;
#the first file
while(<>){
	$_ =~ s/\x{FEFF}|\r//g;
	$_ =~ s/\.|\?|\!|,|\"|\'|\s+//g;
	$names{$_} = 1;
		last if eof;
}

# scan second file
while(<>){
   $_ =~ s/\x{FEFF}|\r//g;
   my $base = $_;
   $_ =~ s/\.|\?|\!|,|\"|\'|\s+//g;
   print "$_ \t $base" if $names{$_};
					}















































































































