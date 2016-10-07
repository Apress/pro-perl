#!/usr/bin/perl
# splice3.pl (p112)
use strict;
use warnings;

my @array = ('a', 'b', 'c', 'd', 'e', 'f');
# remove elements 2, 3 and 4
my @removed = splice @array, 2, 3;
print "@array\n";   # produces 'a b f'
print "@removed\n";   # produces 'c d e'
