#!/usr/bin/env perl
#
# This file is part of moses.  Its use is licensed under the GNU Lesser General
# Public License version 2.1 or, at your option, any later version.


use warnings;
use strict;
use utf8;

binmode STDIN,":utf8";
binmode STDOUT,":utf8";


while(<STDIN>) {
    print "old: $_";
    s/\r//g;
    
    # remove extra spaces
    s/\(/ \(/g;
    s/\)/\) /g; s/ +/ /g;
    s/\) ([\.\!\:\?\;\,])/\)$1/g;
    s/\( /\(/g;
    s/ \)/\)/g;
    s/(\d) \%/$1\%/g;
    s/ :/:/g;
    s/ ;/;/g;

    # normalize unicode punctuation
    s/„/\"/g;
    s/“/\"/g;
    s/”/\"/g;
    s/–/-/g;
    s/—/ - /g; s/ +/ /g;
    s/´/\'/g;
    s/‘|’/'/g;
    s/([a-z])‘([a-z])/$1\'$2/gi;
    s/([a-z])’([a-z])/$1\'$2/gi;
    #s/‘/\"/g;
    s/‚/\"/g;
    #s/’/\"/g;
    s/''/\"/g;
    s/´´/\"/g;
    s/…/.../g;

    # French quotes
    s/ « / \"/g;
    s/« /\"/g;
    s/«/\"/g;
    s/ » /\" /g;
    s/ »/\"/g;
    s/»/\"/g;
    s/ʔ|Ɂ|ɂ|ˀ|¿|؟|⸮|？/?/g;
    s/¡|ǃ|﹗|❢|❣|！/!/g;
    
    # handle pseudo-spaces
    s/ \%/\%/g;
    s/nº /nº /g;
    s/ :/:/g;
    s/ ºC/ ºC/g;
    s/ cm/ cm/g;
    s/ \?/\?/g;
    s/ \!/\!/g;
    s/ ;/;/g;
    s/, /, /g;
    s/  +/ /g;
    s/\x{202D}//g;
    s/\p{Zs}/ /g;
 

    # English "quotation," followed by comma, style
    s/\"([,\.]+)/$1\"/g;
    s/(\d) (\d)/$1.$2/g;
    print "NEW: $_\n";
}
