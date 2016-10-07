#!/usr/bin/perl
# unicodeshort.pl (p961)
use charnames qw(:short);   # use Unicode with short names
binmode STDOUT,":utf8";
print "\N{Cyrillic:Psi} is a capital Psi in Cyrillic\n";
print "\N{Greek:Psi} is a capital Psi in Greek\n";
print "\N{Cyrillic:psi} is a lowercase psi in Cyrillic\n";
