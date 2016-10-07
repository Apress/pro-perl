#!/usr/bin/perl
# splice2.pl (p112)
use strict;
use warnings;

my @array = ('a', 'b', 'c', 'd', 'e', 'f');
# replace three elements 2, 3, and 4 with a different three
my @removed = splice @array, 2, 3, (1, 2, 3);
print "@array\n";   # produces 'a b 1 2 3 f'
print "@removed\n";   # produces 'c d e'
