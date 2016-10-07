#!/usr/bin/perl
# upanddown.pl (p192)
use warnings;
use strict;

my $max = 6;
my @array = (1..$max);

while (my $element = shift @array) {
    push (@array,$max - $element);
    print $element, " : ", join(",", @array), "\n";
}
