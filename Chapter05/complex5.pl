#!/usr/bin/perl
# complex5.pl (p149)
use warnings;
use strict;

my (@outer, $inner_ref);
foreach my $element (1..3) {
    $inner_ref = ["one", "two"];
    push @outer, $inner_ref; #push scalar reference
}
print '@outer is ', "@outer \n";
