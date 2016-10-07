#!/usr/bin/perl
# complex3.pl (p148)
use warnings;
use strict;

my (@outer, @inner);
foreach my $element (1..3) {
    @inner = ("one", "two");
    push @outer, [@inner]; #push reference to copy of @inner
} print '@outer is ', "@outer \n";
