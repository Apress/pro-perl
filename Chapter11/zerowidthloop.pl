#!/usr/bin/perl
# zerowidthloop.pl (p366)
use warnings;
use strict;

my $text = "proton";
while ($text =~ /(?=(.))/g) {
    print "[$1]";
}
