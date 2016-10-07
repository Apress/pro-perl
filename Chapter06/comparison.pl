#!/usr/bin/perl
# comparison.pl (p179)
use warnings;
use strict;

my @words = split ('\s+',<>);
die "Enter two words \n" unless scalar(@words) == 2;

my $result = $words[0] cmp $words[1];
print "The first word is ", $result ? $result>0 ? "greater than" :
    "less than" : "equal to "," the second \n";
