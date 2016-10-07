#!/usr/bin/perl
# unicodefull.pl (p960-961)
use charnames qw(:full);   # use Unicode with full names

binmode STDOUT,":utf8";
print "\N{CYRILLIC CAPITAL LETTER PSI} is a Cyrillic capital Psi\n";
print "\N{GREEK CAPITAL LETTER PSI} is a Greek capital Psi\n";
print "\N{CYRILLIC SMALL LETTER PSI} is a Cyrillic small psi\n";
