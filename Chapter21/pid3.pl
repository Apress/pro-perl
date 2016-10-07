#!/usr/bin/perl
# pid3.pl (p877-878)
use warnings;
use strict;

open (PS, "-|") || exec 'ps', '-ef';
while (<PS>) {
    chomp;
    print "PS: $_ \n";
}
close PS;
