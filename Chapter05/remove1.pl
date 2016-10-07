#!/usr/bin/perl
# remove1.pl (p115)
use strict;
use warnings;

my @array = (1, 2, 3, 4, 5, 6);
push @array, '7';   # add '7' to the end
print "@array\n";   # array is now (1, 2, 3, 4, 5, 6, 7)
my $last = pop @array; # retrieve '7' and return array to six elements
print "$last\n";   # print 7
unshift @array, -1, 0;
print "@array\n";   # array is now (-1, 0, 1, 2, 3, 4, 5, 6)
shift @array;   # remove the first element of the array
shift @array;   # remove the first element of the array
print "@array\n";   # array is now again (1, 2, 3, 4, 5, 6)
