#!/usr/bin/perl
# add1.pl (p114)
use strict;
use warnings;

my @array = ('a', 'b', 'c', 'd', 'e', 'f');
print "@array \n";   # produces 'a b c d e f'
$array[6] = "g";
print "@array \n";   # produces 'a b c d e f g'
