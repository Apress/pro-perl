#!/usr/bin/perl
# turntohash.pl (p503)
use warnings;
use strict;

my %args;

if (scalar(@ARGV)%2) {
    die "Odd number of arguments passed to $0";
} else {
    %args = @ARGV;   # convert to hash
    foreach (keys %args) {
        # check each of the keys
        die "Bad argument '$_' does not start with -" unless /^-/;
    }
}
