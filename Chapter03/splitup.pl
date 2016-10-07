#!/usr/bin/perl
# splitup.pl (p67)
use strict;
use warnings;

my $csv = "one, two, three, four, five, six";
my @list = split ', ' , $csv;
print "@list";
