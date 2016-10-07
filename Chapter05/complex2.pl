#!/usr/bin/perl
# complex2.pl (p147)
use warnings;
use strict;

my (@outer, @inner);
foreach my $element (1..3) {
    @inner = ("one", "two");
    #ERROR: list flattening
    push @outer, @inner;
}
print '@outer is ', "@outer \n";
