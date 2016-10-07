#!/usr/bin/perl
# getopt.pl (p508-509)
use strict;
use warnings;

use Getopt::Std;

my %opts;
getopt("atef",\%opts);

print "Arguments:\n";
foreach (keys %opts) {
    print "\t$_ => $opts{$_}\n";
}

print "ARGV:\n";
foreach (@ARGV) {
    print "\t$_\n";
}
