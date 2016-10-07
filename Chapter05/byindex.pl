#!/usr/bin/perl
# byindex.pl (p113)
use strict;
use warnings;

my @array = ("First", "Second");
foreach (0..$#array) {
    print "Element number $_ contains $array[$_] \n";
}
