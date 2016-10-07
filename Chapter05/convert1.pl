#!/usr/bin/perl
# convert1.pl (p129)
use warnings;
use strict;

my %hash = (one => 1, two => 2, three => 3, four => 4, five => 5);

# check the hash has data
if (%hash) {
    # find out how well the hash is being stored
    print scalar(%hash); # produces '4/8'
}
