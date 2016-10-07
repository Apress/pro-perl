#!/usr/bin/perl
# negate.pl (p512)
use warnings;
use strict;

use Getopt::Long;
# translate + negation to Getopt::Long compatible --no negation
foreach (@ARGV) {
    s/^\+/--no/;   # substitute elements of @ARGV directly
}

my %opts;
GetOptions (\%opts, 'verbose', 'background');
