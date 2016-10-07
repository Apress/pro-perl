#!/usr/bin/perl
# quality.pl (p370)
use warnings;

my $text = "3 Stumps, 2 Bails, and 0 Vogons";

$text =~ s/\b(\d+)\b/$1 > 0?$1 > 1?$1 > 2? "Several":"A pair of":"One":"No"/ge;

print $text, "\n";
