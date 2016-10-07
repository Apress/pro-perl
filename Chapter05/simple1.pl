#!/usr/bin/perl
# simple1.pl (p150)
use warnings;
use strict;

my @outer = (['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3']);
foreach my $outer_el (@outer) {
    foreach (@{$outer_el}) {
        print "$_\n";
    }
    print "\n";
}
