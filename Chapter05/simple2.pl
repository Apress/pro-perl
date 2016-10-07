#!/usr/bin/perl
# simple2.pl (p150)
use warnings;
use strict;

my %outer = (A=> {a1=>1, a2=>2, a3=>3}, B=> {b1=>4, b2=>5, b3=>6},
             C=> {c1=>7,c2=>8, c3=>9});

foreach my $outer_key (keys %outer) {
    print "$outer_key => \n";
    foreach (keys %{$outer{$outer_key}} ) {
        print"\t$_ => $outer{$outer_key}{$_} \n";
    }
    print "\n";
}
