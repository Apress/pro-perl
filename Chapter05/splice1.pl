#!/usr/bin/perl
# splice1.pl (p112)
use strict;
use warnings;

my @array = ('a', 'b', 'c', 'd', 'e', 'f');
# replace third element with three new elements
my $removed = splice @array, 2, 1, (1, 2, 3);
print "@array \n";   # produces 'a b 1 2 3 d e f'
print "$removed \n";   # produces 'c'
