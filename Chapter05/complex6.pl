#!/usr/bin/perl
# complex6.pl (p149)
use warnings;
use strict;

my @outer;
foreach my $element (1..3) {
    my @inner = ("one", "two");
    push @outer, \@inner; #push reference to @inner
}
print '@outer is ', "@outer \n";
