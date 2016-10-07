#!/usr/bin/perl
# codepattern.pl (p373)
use warnings;
use strict;

my $text=<>;

while ($text=~/
    (?{$count=0})
    ((?:\w
        (?{print ++$count,"=$& "})
    )+)
/xg) {
    print "\nGot $1\n";
}
