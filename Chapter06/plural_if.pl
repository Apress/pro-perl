#!/usr/bin/perl
# plural_if.pl (p178)
use warnings;
use strict;

my @words = split ('\s+', <>);   #read some text and split on whitespace

my $count = scalar (@words);

print "There ";
if ($count == 1) {
    print "is";
} else {
    print "are";
}
print " $count word";

unless ($count == 1) {
    print "s";
}
print " in the text \n";
