#!/usr/bin/perl
# unicodescript.pl (p961)
use charnames qw(cyrillic);   # use explicit Unicode script
binmode STDOUT,":utf8";
print "\N{Psi} is a capital Psi in Cyrillic\n";
print "\N{psi} is a lowercase psi in Cyrillic\n";
