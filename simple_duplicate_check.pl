#!/usr/bin/perl
my %names;
my $Eng;
#the first file
while(<>){
	$_ =~ s/\x{FEFF}|\r//g;
	#$_ =~ m/(.+)\t(.+)/;
	#$Eng = $1;
	$_ =~ s/\.|\?|\!|,|\"|\'|\s+|:|;|-//g;
	$names{$_} = 1;
		last if eof;
}

# scan second file

while(<>){
   $_ =~ s/\x{FEFF}|\r//g;
   my $base = $_;
   $_ =~ s/\.|\?|\!|,|\"|\'|\s+|:|;|-//g;
   
   print "$base" if $names{$_} != 1; 		#print not dulplicated list from first file to second file
	}















































































































