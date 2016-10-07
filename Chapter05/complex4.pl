#!/usr/bin/perl
# complex4.pl (p148)
use warnings;
use strict;

my (@outer, @inner);
foreach my $element (1..3) {
    @inner = ("one", "two");
    push @outer, \@inner; #push reference to @inner
} print '@outer is ', "@outer \n";
