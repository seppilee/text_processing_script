#!/usr/bin/perl

binmode STDIN, ':utf8';
binmode STDERR, ':utf8';
binmode STDOUT, ':utf8';


while (<>)
{
    my $words = 0;
    chomp;
    $_ =~ s/\x{FEFF}|\r//;

if(/\p{Hangul}/){
     $words += scalar(split(/\s+/,$_));
	if(2 < $words && $words < 18){
	print $_.$words."\n";
	}
}

}


