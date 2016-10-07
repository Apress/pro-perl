#!/usr/bin/perl
# splice4.pl (p113)
use strict;
use warnings;

my @array = ('a', 'b', 'c', 'd', 'e', 'f');
# remove last three elements
my @last_3_elements = splice @array, -3;
print "@array\n";   # produces 'a b c'
print "@last_3_elements\n";   # produces 'd e f'
