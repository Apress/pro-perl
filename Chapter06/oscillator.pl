#!/usr/bin/perl
# oscillator.pl (p191-192)
use warnings;
use strict;

my $max = 20;
my @array = (1..$max-1);

while (my $element = shift @array) {
    push (@array, $max - $element);
    sleep 1; # delay the print for one second to see the output
    print '*' x $element, "\n"; # multiply single '*' to get a bar of '*'s
}
