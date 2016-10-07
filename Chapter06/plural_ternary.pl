#!/usr/bin/perl
# plural_ternary.pl (p178-179)
use warnings;
use strict;

my @words = split ('\s+', <>); #read some text and split on whitespace
my $words = scalar (@words);

print "There ", ($words == 1)?"is":"are"," $words word",
  ($words == 1)?"":"s"," in the text \n";
