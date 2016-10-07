#!/usr/bin/perl
# startexp.pl (p191)
use warnings;
use strict;

# define a selection of strings one of which is "start"
my @lines = ("ignored", "data", "start", "the data", "we want");

# discard lines until we see the "start" marker
while (my $line = shift @lines) {
    last if $line eq 'start';
}

# print out the remaining elements using interpolation ($")
print "@lines";
