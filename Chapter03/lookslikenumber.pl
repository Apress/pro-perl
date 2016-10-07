#!/usr/bin/perl
# lookslikenumber.pl (p66)
use Scalar::Util 'looks_like_number';

foreach (@ARGV) {
    print "$ARGV[0] ";
    print looks_like_number($ARGV[0])
        ? "looks" : "does not look";
    print " like a number\n";
}
